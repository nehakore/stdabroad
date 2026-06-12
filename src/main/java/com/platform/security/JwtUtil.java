package com.platform.security;

import com.platform.model.User;
import org.springframework.stereotype.Component;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@Component
public class JwtUtil {

    private static final String SECRET_KEY = "study_abroad_secret_key_extremely_secure_and_long";
    private static final long EXPIRATION_TIME = 864000000; // 10 days in milliseconds

    public String generateToken(User user) {
        try {
            String header = Base64.getUrlEncoder().withoutPadding().encodeToString(
                    "{\"alg\":\"HS256\",\"typ\":\"JWT\"}".getBytes(StandardCharsets.UTF_8)
            );
            
            long exp = System.currentTimeMillis() + EXPIRATION_TIME;
            String payloadJson = String.format(
                    "{\"sub\":\"%s\",\"userId\":%d,\"role\":\"%s\",\"name\":\"%s\",\"exp\":%d}",
                    user.getEmail(), user.getId(), user.getRole() != null ? user.getRole().toString() : "USER", user.getName(), exp
            );
            String payload = Base64.getUrlEncoder().withoutPadding().encodeToString(
                    payloadJson.getBytes(StandardCharsets.UTF_8)
            );
            
            String data = header + "." + payload;
            String signature = sign(data, SECRET_KEY);
            
            return data + "." + signature;
        } catch (Exception e) {
            throw new RuntimeException("Error generating token", e);
        }
    }

    public CustomClaims validateTokenAndGetClaims(String token) {
        try {
            if (token == null) return null;
            String[] parts = token.split("\\.");
            if (parts.length != 3) return null;

            String header = parts[0];
            String payload = parts[1];
            String signature = parts[2];

            String expectedSignature = sign(header + "." + payload, SECRET_KEY);
            if (!expectedSignature.equals(signature)) {
                return null;
            }

            String payloadJson = new String(Base64.getUrlDecoder().decode(payload), StandardCharsets.UTF_8);
            
            // Validate expiration
            Long exp = getLongClaim(payloadJson, "exp");
            if (exp == null || System.currentTimeMillis() > exp) {
                return null;
            }

            Long userId = getLongClaim(payloadJson, "userId");
            String email = getStringClaim(payloadJson, "sub");
            String role = getStringClaim(payloadJson, "role");
            String name = getStringClaim(payloadJson, "name");

            return new CustomClaims(userId, email, role, name);
        } catch (Exception e) {
            return null;
        }
    }

    private String sign(String data, String secret) throws Exception {
        Mac sha256HMAC = Mac.getInstance("HmacSHA256");
        SecretKeySpec secretKey = new SecretKeySpec(secret.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
        sha256HMAC.init(secretKey);
        byte[] hash = sha256HMAC.doFinal(data.getBytes(StandardCharsets.UTF_8));
        return Base64.getUrlEncoder().withoutPadding().encodeToString(hash);
    }

    private Long getLongClaim(String json, String claimName) {
        String pattern = "\"" + claimName + "\":";
        int index = json.indexOf(pattern);
        if (index == -1) return null;
        int start = index + pattern.length();
        int end = json.indexOf(",", start);
        if (end == -1) end = json.indexOf("}", start);
        String val = json.substring(start, end).trim();
        return Long.parseLong(val);
    }

    private String getStringClaim(String json, String claimName) {
        String pattern = "\"" + claimName + "\":\"";
        int index = json.indexOf(pattern);
        if (index == -1) return null;
        int start = index + pattern.length();
        int end = json.indexOf("\"", start);
        return json.substring(start, end);
    }

    public static class CustomClaims {
        private final Long userId;
        private final String email;
        private final String role;
        private final String name;

        public CustomClaims(Long userId, String email, String role, String name) {
            this.userId = userId;
            this.email = email;
            this.role = role;
            this.name = name;
        }

        public Long getUserId() { return userId; }
        public String getEmail() { return email; }
        public String getRole() { return role; }
        public String getName() { return name; }
    }
}
