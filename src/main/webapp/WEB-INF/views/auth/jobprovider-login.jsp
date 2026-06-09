<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Provider Login | STD Abroad Recruitment Portal</title>
    <meta name="description" content="Login to your Job Provider account to manage overseas job listings, applications and recruitment.">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            background: #0f172a;
            overflow: hidden;
        }

        /* ── Left Panel ── */
        .left-panel {
            flex: 1;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #0f172a 100%);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 60px 50px;
            position: relative;
            overflow: hidden;
        }

        /* Animated background blobs */
        .blob {
            position: absolute;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.18;
            animation: blobFloat 8s ease-in-out infinite;
        }
        .blob-1 { width: 400px; height: 400px; background: #3b82f6; top: -100px; left: -100px; animation-delay: 0s; }
        .blob-2 { width: 300px; height: 300px; background: #6366f1; bottom: 50px; right: -80px; animation-delay: 3s; }
        .blob-3 { width: 200px; height: 200px; background: #8b5cf6; top: 50%; left: 50%; transform: translate(-50%,-50%); animation-delay: 6s; }

        @keyframes blobFloat {
            0%, 100% { transform: translateY(0) scale(1); }
            50% { transform: translateY(-30px) scale(1.05); }
        }

        .left-brand {
            position: relative;
            z-index: 2;
            text-align: center;
            max-width: 400px;
        }

        .brand-icon {
            width: 80px; height: 80px;
            background: linear-gradient(135deg, #3b82f6, #6366f1);
            border-radius: 22px;
            display: flex; align-items: center; justify-content: center;
            font-size: 2rem; color: #fff;
            margin: 0 auto 28px;
            box-shadow: 0 20px 60px rgba(59,130,246,0.4);
            animation: iconPulse 3s ease-in-out infinite;
        }
        @keyframes iconPulse {
            0%, 100% { box-shadow: 0 20px 60px rgba(59,130,246,0.4); }
            50% { box-shadow: 0 20px 80px rgba(99,102,241,0.6); }
        }

        .left-brand h1 {
            font-size: 2rem; font-weight: 800;
            color: #fff; letter-spacing: -0.5px;
            line-height: 1.2; margin-bottom: 12px;
        }
        .left-brand h1 span { color: #60a5fa; }

        .left-brand p {
            font-size: 0.95rem; color: #94a3b8;
            line-height: 1.7; margin-bottom: 40px;
        }

        .feature-list {
            list-style: none;
            text-align: left;
            width: 100%;
        }
        .feature-list li {
            display: flex; align-items: center; gap: 14px;
            padding: 14px 18px;
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.06);
            border-radius: 12px;
            margin-bottom: 10px;
            color: #cbd5e1;
            font-size: 0.88rem;
            font-weight: 500;
            transition: background 0.2s;
        }
        .feature-list li:hover { background: rgba(255,255,255,0.07); }
        .feature-list li .feat-icon {
            width: 36px; height: 36px;
            border-radius: 9px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1rem; flex-shrink: 0;
        }

        /* ── Right Panel (Form) ── */
        .right-panel {
            width: 480px;
            flex-shrink: 0;
            background: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 60px 50px;
            position: relative;
            overflow-y: auto;
        }

        .back-link {
            position: absolute;
            top: 28px; left: 28px;
            display: flex; align-items: center; gap: 8px;
            color: #64748b; text-decoration: none;
            font-size: 0.85rem; font-weight: 500;
            transition: color 0.2s;
        }
        .back-link:hover { color: #3b82f6; }

        .form-header { margin-bottom: 36px; }
        .form-header .tag {
            display: inline-flex; align-items: center; gap: 6px;
            background: #eff6ff; color: #2563eb;
            font-size: 0.72rem; font-weight: 700;
            text-transform: uppercase; letter-spacing: 1px;
            padding: 5px 12px; border-radius: 50px;
            margin-bottom: 16px;
        }
        .form-header h2 {
            font-size: 1.8rem; font-weight: 800;
            color: #0f172a; letter-spacing: -0.5px;
            margin-bottom: 8px;
        }
        .form-header p {
            font-size: 0.88rem; color: #64748b; line-height: 1.6;
        }

        /* Alert banners */
        .alert-box {
            border-radius: 12px; padding: 14px 18px;
            display: flex; align-items: center; gap: 12px;
            font-size: 0.87rem; font-weight: 500;
            margin-bottom: 24px; animation: slideIn 0.3s ease;
        }
        @keyframes slideIn { from { opacity:0; transform:translateY(-8px); } to { opacity:1; transform:translateY(0); } }
        .alert-error { background: #fef2f2; color: #b91c1c; border: 1px solid #fecaca; }
        .alert-success { background: #f0fdf4; color: #15803d; border: 1px solid #bbf7d0; }

        /* Form fields */
        .form-group { margin-bottom: 20px; }
        .form-group label {
            display: block; font-size: 0.85rem;
            font-weight: 600; color: #374151; margin-bottom: 8px;
        }
        .input-wrapper {
            position: relative;
        }
        .input-wrapper i {
            position: absolute; left: 14px; top: 50%;
            transform: translateY(-50%);
            color: #9ca3af; font-size: 0.9rem; pointer-events: none;
        }
        .input-wrapper input {
            width: 100%; padding: 13px 14px 13px 42px;
            border: 1.5px solid #e2e8f0;
            border-radius: 12px; font-size: 0.92rem;
            font-family: 'Inter', sans-serif;
            color: #0f172a; background: #f8fafc;
            transition: all 0.2s; outline: none;
        }
        .input-wrapper input:focus {
            border-color: #3b82f6;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(59,130,246,0.12);
        }
        .input-wrapper .toggle-pw {
            position: absolute; right: 14px; top: 50%;
            transform: translateY(-50%);
            color: #9ca3af; cursor: pointer;
            font-size: 0.9rem; pointer-events: all;
            transition: color 0.2s;
        }
        .input-wrapper .toggle-pw:hover { color: #3b82f6; }

        .form-options {
            display: flex; justify-content: space-between;
            align-items: center; margin-bottom: 28px;
        }
        .remember-label {
            display: flex; align-items: center; gap: 8px;
            font-size: 0.85rem; color: #64748b; cursor: pointer;
        }
        .remember-label input[type="checkbox"] {
            width: 16px; height: 16px; accent-color: #3b82f6;
        }
        .forgot-link {
            font-size: 0.85rem; color: #3b82f6;
            text-decoration: none; font-weight: 600;
            transition: color 0.2s;
        }
        .forgot-link:hover { color: #1d4ed8; }

        .btn-login {
            width: 100%; padding: 14px;
            background: linear-gradient(135deg, #3b82f6, #6366f1);
            color: #fff; border: none; border-radius: 12px;
            font-size: 1rem; font-weight: 700;
            font-family: 'Inter', sans-serif;
            cursor: pointer; transition: all 0.25s;
            display: flex; align-items: center; justify-content: center; gap: 10px;
            box-shadow: 0 4px 20px rgba(59,130,246,0.3);
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 28px rgba(59,130,246,0.45);
        }
        .btn-login:active { transform: translateY(0); }

        .divider {
            display: flex; align-items: center; gap: 12px;
            margin: 24px 0; color: #cbd5e1; font-size: 0.82rem;
        }
        .divider::before, .divider::after {
            content: ''; flex: 1; height: 1px; background: #e2e8f0;
        }

        .register-link {
            text-align: center; font-size: 0.88rem; color: #64748b;
        }
        .register-link a {
            color: #3b82f6; font-weight: 700; text-decoration: none;
            transition: color 0.2s;
        }
        .register-link a:hover { color: #1d4ed8; }

        .other-login {
            margin-top: 20px; text-align: center;
            font-size: 0.82rem; color: #94a3b8;
        }
        .other-login a { color: #64748b; font-weight: 600; text-decoration: none; }
        .other-login a:hover { color: #3b82f6; }

        @media (max-width: 900px) {
            body { flex-direction: column; overflow: auto; }
            .left-panel { padding: 40px 24px; min-height: 280px; }
            .left-brand h1 { font-size: 1.5rem; }
            .feature-list { display: none; }
            .right-panel { width: 100%; padding: 40px 24px; }
            .blob-1, .blob-2, .blob-3 { display: none; }
        }
    </style>
</head>
<body>

<!-- ── Left Branding Panel ── -->
<div class="left-panel">
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>
    <div class="blob blob-3"></div>

    <div class="left-brand">
        <div class="brand-icon">
            <i class="fas fa-briefcase"></i>
        </div>
        <h1>Job Provider <span>Recruitment</span> Portal</h1>
        <p>Manage your overseas hiring pipeline — post jobs, review applications, and connect with global talent.</p>

        <ul class="feature-list">
            <li>
                <div class="feat-icon" style="background:rgba(59,130,246,0.15);">
                    <i class="fas fa-plus-circle" style="color:#60a5fa;"></i>
                </div>
                Post jobs in 190+ countries worldwide
            </li>
            <li>
                <div class="feat-icon" style="background:rgba(99,102,241,0.15);">
                    <i class="fas fa-users" style="color:#818cf8;"></i>
                </div>
                Review & shortlist candidate applications
            </li>
            <li>
                <div class="feat-icon" style="background:rgba(139,92,246,0.15);">
                    <i class="fas fa-passport" style="color:#a78bfa;"></i>
                </div>
                Offer visa sponsorship & relocation support
            </li>
            <li>
                <div class="feat-icon" style="background:rgba(34,197,94,0.15);">
                    <i class="fas fa-chart-line" style="color:#4ade80;"></i>
                </div>
                Track applications with real-time dashboard
            </li>
        </ul>
    </div>
</div>

<!-- ── Right Login Form Panel ── -->
<div class="right-panel">
    <a href="/" class="back-link">
        <i class="fas fa-arrow-left"></i> Back to Home
    </a>

    <div class="form-header">
        <div class="tag"><i class="fas fa-building"></i> Company / Recruiter</div>
        <h2>Welcome Back!</h2>
        <p>Sign in to your Job Provider account to manage your overseas recruitment listings.</p>
    </div>

    <!-- Error / Success Messages -->
    <c:if test="${param.error == 'invalidCredentials'}">
        <div class="alert-box alert-error">
            <i class="fas fa-exclamation-circle"></i>
            Invalid email or password. Please try again.
        </div>
    </c:if>
    <c:if test="${param.error == 'notApproved'}">
        <div class="alert-box alert-error">
            <i class="fas fa-clock"></i>
            Your account is pending admin approval. Please check back soon.
        </div>
    </c:if>
    <c:if test="${param.error == 'notCompany'}">
        <div class="alert-box alert-error">
            <i class="fas fa-exclamation-triangle"></i>
            This portal is for Company/Job Providers only. University providers, use the <a href="/provider/login" style="color:#b91c1c;font-weight:700;">Provider Login</a>.
        </div>
    </c:if>
    <c:if test="${param.registered == 'true'}">
        <div class="alert-box alert-success">
            <i class="fas fa-check-circle"></i>
            Registration submitted! You can login after admin approval.
        </div>
    </c:if>

    <!-- Login Form -->
    <form action="/jobprovider/login" method="POST" id="loginForm">

        <div class="form-group">
            <label for="email">Email Address</label>
            <div class="input-wrapper">
                <i class="fas fa-envelope"></i>
                <input type="email" id="email" name="email"
                       placeholder="your@company.com" required autocomplete="email">
            </div>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <div class="input-wrapper">
                <i class="fas fa-lock"></i>
                <input type="password" id="password" name="password"
                       placeholder="Enter your password" required autocomplete="current-password">
                <span class="toggle-pw" onclick="togglePassword()">
                    <i class="fas fa-eye" id="pwIcon"></i>
                </span>
            </div>
        </div>

        <div class="form-options">
            <label class="remember-label">
                <input type="checkbox" name="remember"> Remember me
            </label>
            <a href="/provider/forgot-password" class="forgot-link">Forgot password?</a>
        </div>

        <button type="submit" class="btn-login" id="loginBtn">
            <i class="fas fa-sign-in-alt"></i>
            Sign In to Dashboard
        </button>
    </form>

    <div class="divider">or</div>

    <div class="register-link">
        Don't have an account?
        <a href="/provider/register-company">Register as Job Provider</a>
    </div>

    <div class="other-login">
        University Provider? &nbsp;<a href="/provider/login">Login here</a>
        &nbsp;·&nbsp;
        Student? &nbsp;<a href="/login">Student Login</a>
    </div>
</div>

<script>
    function togglePassword() {
        const pw = document.getElementById('password');
        const icon = document.getElementById('pwIcon');
        if (pw.type === 'password') {
            pw.type = 'text';
            icon.className = 'fas fa-eye-slash';
        } else {
            pw.type = 'password';
            icon.className = 'fas fa-eye';
        }
    }

    // Loading state on submit
    document.getElementById('loginForm').addEventListener('submit', function() {
        const btn = document.getElementById('loginBtn');
        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Signing In...';
        btn.disabled = true;
    });
</script>
</body>
</html>
