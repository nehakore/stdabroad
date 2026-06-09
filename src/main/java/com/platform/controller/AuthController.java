package com.platform.controller;

import com.platform.model.Admin;
import com.platform.model.Provider;
import com.platform.model.User;
import com.platform.service.AdminService;
import com.platform.service.ProviderService;
import com.platform.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import jakarta.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private ProviderService providerService;
    
    @Autowired
    private AdminService adminService;

    @GetMapping({"/login", "/user/login"})
    public String loginPage() {
        return "auth/login";
    }

    @GetMapping("/provider/login")
    public String providerLoginPage() {
        return "auth/provider-login";
    }

    @GetMapping("/jobprovider/login")
    public String jobProviderLoginPage() {
        return "auth/jobprovider-login";
    }

    @GetMapping("/admin/login")
    public String adminLoginPage() {
        return "auth/admin-login";
    }

    @GetMapping("/admin/register")
    public String adminRegisterPage() {
        return "auth/admin-register";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "auth/register";
    }

    @GetMapping("/provider/register")
    public String providerRegisterPage() {
        return "auth/provider-register";
    }

    @GetMapping("/provider/register-company")
    public String jobProviderRegisterPage() {
        return "auth/job-provider-register";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, 
                        @RequestParam String password, 
                        @RequestParam String role, 
                        HttpSession session) {
        
        if ("STUDENT".equals(role) || "JOB_SEEKER".equals(role) || "USER".equals(role)) {
            User user = userService.authenticate(email, password);
            if (user != null) {
                session.setAttribute("loggedInUser", user);
                session.setAttribute("role", user.getRole() != null ? user.getRole().toString() : "USER");
                
                if (com.platform.model.Role.JOB_SEEKER.equals(user.getRole())) {
                    return "redirect:/jobseeker/dashboard";
                }
                return "redirect:/user/dashboard";
            }
        } else if ("PROVIDER".equals(role)) {
            Provider provider = providerService.authenticate(email, password);
            if (provider != null) {
                if (!provider.isApproved()) {
                    return "redirect:/login?error=notApproved";
                }
                session.setAttribute("loggedInProvider", provider);
                session.setAttribute("role", "PROVIDER");
                // Company providers → Job Provider Dashboard; University providers → Provider Dashboard
                if ("Company".equals(provider.getType())) {
                    return "redirect:/jobprovider/dashboard";
                }
                return "redirect:/provider/dashboard";
            }
        }
        
        return "redirect:/login?error=invalidCredentials";
    }

    @PostMapping("/jobprovider/login")
    public String jobProviderLogin(@RequestParam String email,
                                   @RequestParam String password,
                                   HttpSession session) {
        Provider provider = providerService.authenticate(email, password);
        if (provider == null) {
            return "redirect:/jobprovider/login?error=invalidCredentials";
        }
        // Accept 'Company', 'company', 'COMPANY', 'Job Provider', 'Employer' etc.
        String type = provider.getType();
        boolean isCompanyType = type != null && (
            type.equalsIgnoreCase("Company") ||
            type.equalsIgnoreCase("Job Provider") ||
            type.equalsIgnoreCase("Employer") ||
            type.equalsIgnoreCase("Recruitment Agency")
        );
        if (!isCompanyType) {
            return "redirect:/jobprovider/login?error=notCompany";
        }
        // Allow login even if pending approval — dashboard shows a banner
        session.setAttribute("loggedInProvider", provider);
        session.setAttribute("role", "PROVIDER");
        return "redirect:/jobprovider/dashboard";
    }

    @PostMapping("/admin/login")
    public String adminLogin(@RequestParam String email, 
                             @RequestParam String password, 
                             HttpSession session) {
        Admin admin = adminService.authenticate(email, password);
        if (admin != null) {
            session.setAttribute("loggedInAdmin", admin);
            session.setAttribute("role", "ADMIN");
            return "redirect:/admin/dashboard";
        }
        return "redirect:/admin/login?error=invalidCredentials";
    }

    @PostMapping("/register-user")
    public String registerUser(User user) {
        userService.saveUser(user);
        return "redirect:/login?registered=true";
    }

    @PostMapping("/register-provider")
    public String registerProvider(Provider provider,
                                   @RequestParam(value = "govId", required = false) MultipartFile govId,
                                   @RequestParam(value = "businessCert", required = false) MultipartFile businessCert,
                                   @RequestParam(value = "profilePhoto", required = false) MultipartFile profilePhoto,
                                   HttpServletRequest request) {
        
        if (providerService.providerExists(provider.getEmail())) {
            String redirectUrl = "Company".equals(provider.getType()) ? "/provider/register-company" : "/provider/register";
            return "redirect:" + redirectUrl + "?error=emailExists";
        }
        
        String uploadDir = request.getServletContext().getRealPath("/") + "uploads" + File.separator + "providers" + File.separator;
        File dir = new File(uploadDir);
        if (!dir.exists()) dir.mkdirs();

        try {
            if (govId != null && !govId.isEmpty()) {
                String fileName = System.currentTimeMillis() + "_gov_" + govId.getOriginalFilename().replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
                Files.copy(govId.getInputStream(), Paths.get(uploadDir, fileName));
                provider.setGovIdUrl("/uploads/providers/" + fileName);
            }
            if (businessCert != null && !businessCert.isEmpty()) {
                String fileName = System.currentTimeMillis() + "_cert_" + businessCert.getOriginalFilename().replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
                Files.copy(businessCert.getInputStream(), Paths.get(uploadDir, fileName));
                provider.setBusinessCertUrl("/uploads/providers/" + fileName);
            }
            if (profilePhoto != null && !profilePhoto.isEmpty()) {
                String fileName = System.currentTimeMillis() + "_photo_" + profilePhoto.getOriginalFilename().replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
                Files.copy(profilePhoto.getInputStream(), Paths.get(uploadDir, fileName));
                provider.setProfilePhotoUrl("/uploads/providers/" + fileName);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        provider.setApproved(false);
        providerService.saveProvider(provider);
        return "redirect:/login?registeredProvider=true";
    }

    @PostMapping("/register-admin")
    public String registerAdmin(Admin admin) {
        adminService.saveAdmin(admin);
        return "redirect:/admin/login?registered=true";
    }

    @GetMapping({"/logout", "/provider/logout", "/jobprovider/logout", "/admin/logout", "/user/logout"})
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
