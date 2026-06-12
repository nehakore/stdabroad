<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard | STD Abroad</title>
    <meta name="description" content="Manage your study abroad journey - universities, courses, applications and scholarships.">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Inter', sans-serif;
            background: #f1f5f9;
            display: flex;
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* ══════════════════════════════════
           SIDEBAR
        ══════════════════════════════════ */
        .sd-sidebar {
            width: 265px;
            background: linear-gradient(180deg, #0f172a 0%, #1e293b 100%);
            color: #fff;
            display: flex;
            flex-direction: column;
            position: fixed;
            height: 100vh;
            z-index: 200;
            overflow-y: auto;
            scrollbar-width: thin;
            scrollbar-color: rgba(255,255,255,0.08) transparent;
            flex-shrink: 0;
            transition: transform 0.3s ease;
        }
        .sd-sidebar::-webkit-scrollbar { width: 4px; }
        .sd-sidebar::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.12); border-radius: 4px; }

        /* Brand */
        .sd-brand {
            padding: 20px 20px 16px;
            border-bottom: 1px solid rgba(255,255,255,0.07);
            display: flex; align-items: center; gap: 12px;
        }
        .sd-brand-icon {
            width: 42px; height: 42px; border-radius: 12px;
            background: linear-gradient(135deg, #6366f1, #8b5cf6);
            display: flex; align-items: center; justify-content: center;
            font-size: 1.1rem; color: #fff; flex-shrink: 0;
        }
        .sd-brand h5 { font-size: 1rem; font-weight: 700; color: #fff; margin: 0; }
        .sd-brand span { font-size: 0.68rem; color: #64748b; text-transform: uppercase; letter-spacing: 1px; }

        /* User Info */
        .sd-user {
            padding: 14px 18px;
            border-bottom: 1px solid rgba(255,255,255,0.06);
            display: flex; align-items: center; gap: 11px;
        }
        .sd-avatar {
            width: 40px; height: 40px; border-radius: 50%;
            background: linear-gradient(135deg, #6366f1, #a855f7);
            display: flex; align-items: center; justify-content: center;
            font-weight: 700; font-size: 1rem; color: #fff; flex-shrink: 0;
        }
        .sd-user-name { font-size: 0.85rem; font-weight: 600; color: #e2e8f0; }
        .sd-user-role { font-size: 0.7rem; color: #64748b; margin-top: 1px; }

        /* Nav */
        .sd-nav { padding: 12px 10px; flex: 1; }
        .sd-nav-label {
            font-size: 0.62rem; font-weight: 700; color: #475569;
            text-transform: uppercase; letter-spacing: 1.2px;
            padding: 10px 10px 5px; margin-top: 6px;
        }
        .sd-nav-link {
            display: flex; align-items: center; gap: 10px;
            padding: 9px 13px; border-radius: 9px;
            color: #94a3b8; text-decoration: none;
            font-size: 0.86rem; font-weight: 500;
            transition: all 0.18s; margin-bottom: 2px; cursor: pointer;
            background: none; border: none; width: 100%; text-align: left;
        }
        .sd-nav-link i { width: 17px; text-align: center; font-size: 0.9rem; flex-shrink: 0; }
        .sd-nav-link:hover { background: rgba(255,255,255,0.06); color: #e2e8f0; }
        .sd-nav-link.active {
            background: linear-gradient(135deg, #6366f1, #8b5cf6);
            color: #fff;
            box-shadow: 0 4px 14px rgba(99,102,241,0.35);
        }
        .sd-nav-link .sd-badge {
            margin-left: auto; background: #ef4444; color: #fff;
            font-size: 0.65rem; font-weight: 700;
            padding: 2px 7px; border-radius: 50px; flex-shrink: 0;
        }

        .sd-sidebar-footer {
            padding: 14px 10px;
            border-top: 1px solid rgba(255,255,255,0.06);
        }

        /* ══════════════════════════════════
           MAIN
        ══════════════════════════════════ */
        .sd-main {
            margin-left: 265px;
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Top Bar */
        .sd-topbar {
            background: #fff;
            padding: 14px 30px;
            display: flex; align-items: center; justify-content: space-between;
            border-bottom: 1px solid #e2e8f0;
            position: sticky; top: 0; z-index: 100;
            box-shadow: 0 1px 4px rgba(0,0,0,0.05);
        }
        .sd-topbar-title { font-size: 1.1rem; font-weight: 700; color: #0f172a; }
        .sd-topbar-sub { font-size: 0.78rem; color: #94a3b8; margin-top: 1px; }
        .sd-topbar-actions { display: flex; align-items: center; gap: 10px; }
        .sd-notif-btn {
            width: 38px; height: 38px; border-radius: 10px;
            background: #f1f5f9; border: none; cursor: pointer;
            display: flex; align-items: center; justify-content: center;
            color: #64748b; font-size: 0.95rem; position: relative;
            transition: background 0.2s;
        }
        .sd-notif-btn:hover { background: #e2e8f0; }
        .sd-notif-dot {
            position: absolute; top: 6px; right: 6px;
            width: 8px; height: 8px; background: #ef4444;
            border-radius: 50%; border: 2px solid #fff;
        }
        .sd-hamburger {
            display: none; background: none; border: none;
            font-size: 1.2rem; color: #64748b; cursor: pointer;
        }

        /* Content area */
        .sd-content { padding: 26px 30px; flex: 1; }

        /* Panels */
        .sd-panel { display: none; }
        .sd-panel.active { display: block; }

        /* ══════════════════════════════════
           CARDS
        ══════════════════════════════════ */
        .sd-card {
            background: #fff; border-radius: 16px; padding: 22px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.04), 0 4px 16px rgba(0,0,0,0.04);
            border: 1px solid #f1f5f9;
        }
        .sd-card-title {
            font-size: 0.82rem; font-weight: 700; color: #6366f1;
            text-transform: uppercase; letter-spacing: 0.8px;
            padding-bottom: 12px; margin-bottom: 16px;
            border-bottom: 2px solid #ede9fe;
            display: flex; align-items: center; gap: 8px;
        }

        /* Stat Cards */
        .stat-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; margin-bottom: 24px; }
        .stat-card {
            background: #fff; border-radius: 16px; padding: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.04), 0 4px 16px rgba(0,0,0,0.04);
            border: 1px solid #f1f5f9;
            display: flex; align-items: center; gap: 16px;
            transition: transform 0.2s, box-shadow 0.2s;
            cursor: pointer;
        }
        .stat-card:hover { transform: translateY(-3px); box-shadow: 0 8px 28px rgba(0,0,0,0.09); }
        .stat-icon {
            width: 52px; height: 52px; border-radius: 14px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.3rem; flex-shrink: 0;
        }
        .stat-num { font-size: 1.75rem; font-weight: 800; color: #0f172a; line-height: 1; }
        .stat-lbl { font-size: 0.78rem; color: #64748b; font-weight: 500; margin-top: 3px; }

        /* Tables */
        .sd-table th {
            font-size: 0.72rem; font-weight: 700; color: #64748b;
            text-transform: uppercase; letter-spacing: 0.6px;
            padding: 10px 16px; background: #f8fafc;
            border-bottom: 2px solid #f1f5f9;
        }
        .sd-table td { padding: 13px 16px; font-size: 0.88rem; color: #334155; border-bottom: 1px solid #f8fafc; vertical-align: middle; }
        .sd-table tr:last-child td { border-bottom: none; }
        .sd-table tr:hover td { background: #f8fafc; }

        /* Badges */
        .sd-badge-pill {
            display: inline-flex; align-items: center;
            padding: 3px 11px; border-radius: 50px; font-size: 0.73rem; font-weight: 600;
        }
        .badge-pending  { background: #fef9c3; color: #a16207; }
        .badge-accepted { background: #dcfce7; color: #15803d; }
        .badge-rejected { background: #fee2e2; color: #b91c1c; }
        .badge-review   { background: #dbeafe; color: #1d4ed8; }
        .badge-shortlisted { background: #ede9fe; color: #6d28d9; }
        .badge-uni  { background: #dbeafe; color: #1d4ed8; }
        .badge-course { background: #dcfce7; color: #15803d; }
        .badge-job  { background: #fef9c3; color: #a16207; }

        /* Application tracker timeline */
        .tracker-step {
            display: flex; align-items: flex-start; gap: 16px; padding-bottom: 24px;
            position: relative;
        }
        .tracker-step:not(:last-child)::before {
            content: ''; position: absolute; left: 17px; top: 36px;
            width: 2px; height: calc(100% - 12px);
            background: #e2e8f0;
        }
        .tracker-dot {
            width: 36px; height: 36px; border-radius: 50%; flex-shrink: 0;
            display: flex; align-items: center; justify-content: center;
            font-size: 0.85rem; font-weight: 700;
        }
        .dot-done { background: #dcfce7; color: #15803d; }
        .dot-active { background: linear-gradient(135deg,#6366f1,#8b5cf6); color: #fff; box-shadow: 0 4px 14px rgba(99,102,241,0.35); }
        .dot-pending { background: #f1f5f9; color: #94a3b8; }

        /* Empty state */
        .empty-state { text-align: center; padding: 50px 20px; color: #94a3b8; }
        .empty-state i { font-size: 2.5rem; margin-bottom: 14px; color: #e2e8f0; display: block; }
        .empty-state p { margin-bottom: 16px; font-size: 0.9rem; }

        /* Form styles */
        .form-group { margin-bottom: 18px; }
        .form-label-sd { font-size: 0.83rem; font-weight: 600; color: #374151; margin-bottom: 6px; display: block; }
        .form-input {
            width: 100%; padding: 11px 14px; border: 1.5px solid #e2e8f0;
            border-radius: 10px; font-size: 0.9rem; font-family: 'Inter',sans-serif;
            color: #0f172a; background: #f8fafc; transition: all 0.2s; outline: none;
        }
        .form-input:focus { border-color: #6366f1; background: #fff; box-shadow: 0 0 0 3px rgba(99,102,241,0.12); }

        /* Buttons */
        .btn-sd-primary {
            background: linear-gradient(135deg, #6366f1, #8b5cf6);
            color: #fff; border: none; border-radius: 10px;
            padding: 10px 22px; font-weight: 600; font-size: 0.88rem;
            cursor: pointer; transition: all 0.2s; font-family: 'Inter',sans-serif;
        }
        .btn-sd-primary:hover { transform: translateY(-1px); box-shadow: 0 6px 20px rgba(99,102,241,0.3); }
        .btn-sd-outline {
            background: transparent; border: 1.5px solid #e2e8f0;
            color: #475569; border-radius: 10px; padding: 9px 18px;
            font-weight: 600; font-size: 0.88rem; cursor: pointer;
            transition: all 0.2s; font-family: 'Inter',sans-serif;
        }
        .btn-sd-outline:hover { border-color: #6366f1; color: #6366f1; }

        /* University / Course cards */
        .item-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 16px; }
        .item-card {
            background: #fff; border-radius: 14px; overflow: hidden;
            border: 1px solid #f1f5f9; transition: transform 0.2s, box-shadow 0.2s;
            box-shadow: 0 1px 3px rgba(0,0,0,0.04);
        }
        .item-card:hover { transform: translateY(-3px); box-shadow: 0 8px 24px rgba(0,0,0,0.08); }
        .item-card-img {
            height: 130px; background: linear-gradient(135deg,#6366f1,#8b5cf6);
            display: flex; align-items: center; justify-content: center;
            font-size: 2.5rem; color: rgba(255,255,255,0.6);
        }
        .item-card-body { padding: 14px; }
        .item-card-title { font-weight: 700; font-size: 0.9rem; color: #1e293b; margin-bottom: 4px; }
        .item-card-sub { font-size: 0.78rem; color: #64748b; }

        /* Scholarship card */
        .schol-card {
            background: #fff; border-radius: 14px; padding: 18px;
            border: 1px solid #f1f5f9; display: flex; gap: 14px; align-items: flex-start;
            transition: transform 0.2s, box-shadow 0.2s;
            box-shadow: 0 1px 3px rgba(0,0,0,0.04);
        }
        .schol-card:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(0,0,0,0.07); }
        .schol-icon {
            width: 44px; height: 44px; border-radius: 12px;
            background: linear-gradient(135deg,#f59e0b,#d97706);
            display: flex; align-items: center; justify-content: center;
            font-size: 1.1rem; color: #fff; flex-shrink: 0;
        }

        /* Notification item */
        .notif-item {
            display: flex; gap: 13px; align-items: flex-start;
            padding: 14px 0; border-bottom: 1px solid #f1f5f9;
        }
        .notif-item:last-child { border-bottom: none; }
        .notif-dot-icon {
            width: 38px; height: 38px; border-radius: 10px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1rem; flex-shrink: 0;
        }
        .notif-unread { background: #ede9fe; color: #6d28d9; }
        .notif-read { background: #f1f5f9; color: #94a3b8; }

        /* Mobile overlay */
        .sd-overlay {
            display: none; position: fixed; inset: 0;
            background: rgba(0,0,0,0.5); z-index: 190;
        }

        @media (max-width: 900px) {
            .sd-sidebar { transform: translateX(-100%); }
            .sd-sidebar.open { transform: translateX(0); }
            .sd-main { margin-left: 0; }
            .sd-overlay.open { display: block; }
            .sd-hamburger { display: flex; }
            .stat-grid { grid-template-columns: repeat(2,1fr); }
            .sd-content { padding: 16px; }
            .sd-topbar { padding: 12px 16px; }
        }
        @media (max-width: 480px) {
            .stat-grid { grid-template-columns: 1fr 1fr; }
        }

        /* Custom University Details Modal */
        .custom-modal {
            display: none;
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(15, 23, 42, 0.6);
            backdrop-filter: blur(8px);
            z-index: 1000;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        .custom-modal.show {
            display: flex;
            opacity: 1;
        }
        .custom-modal-content {
            background: #fff;
            border-radius: 20px;
            width: 90%;
            max-width: 800px;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            animation: modalSlideUp 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
            position: relative;
        }
        @keyframes modalSlideUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .custom-modal-header {
            position: relative;
            height: 200px;
            display: flex;
            align-items: flex-end;
            padding: 24px;
            color: #fff;
        }
        .custom-modal-header-overlay {
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: linear-gradient(180deg, rgba(15,23,42,0.1) 0%, rgba(15,23,42,0.85) 100%);
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }
        .custom-modal-header-text {
            position: relative;
            z-index: 2;
        }
        .custom-modal-close {
            position: absolute;
            top: 16px; right: 16px;
            width: 36px; height: 36px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: #fff;
            font-size: 1.2rem;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s;
            z-index: 10;
        }
        .custom-modal-close:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }
        .custom-modal-body {
            padding: 28px;
        }
        .facility-chip {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            color: #334155;
            padding: 8px 16px;
            border-radius: 12px;
            font-size: 0.82rem;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
    </style>
</head>
<body>

<!-- Mobile overlay -->
<div class="sd-overlay" id="sdOverlay" onclick="closeSidebar()"></div>

<!-- ══ SIDEBAR ══ -->
<aside class="sd-sidebar" id="sdSidebar">
    <!-- Brand -->
    <div class="sd-brand">
        <div class="sd-brand-icon"><i class="fas fa-graduation-cap"></i></div>
        <div>
            <h5>STD Abroad</h5>
            <span>Student Portal</span>
        </div>
    </div>

    <!-- User Info -->
    <div class="sd-user">
        <div class="sd-avatar">
            ${not empty sessionScope.loggedInUser.name ? sessionScope.loggedInUser.name.substring(0,1).toUpperCase() : 'S'}
        </div>
        <div>
            <div class="sd-user-name">${not empty sessionScope.loggedInUser.name ? sessionScope.loggedInUser.name : 'Student'}</div>
            <div class="sd-user-role"><i class="fas fa-circle" style="font-size:5px;color:#22c55e;"></i> Student Account</div>
        </div>
    </div>

    <!-- Navigation -->
    <nav class="sd-nav">

        <!-- Overview -->
        <div class="sd-nav-label">Overview</div>
        <button class="sd-nav-link active" onclick="showPanel('overview', this)">
            <i class="fas fa-chart-pie"></i> Dashboard
        </button>

        <!-- Profile Management -->
        <div class="sd-nav-label">Profile Management</div>
        <button class="sd-nav-link" onclick="showPanel('my-profile', this)">
            <i class="fas fa-user"></i> My Profile
        </button>
        <button class="sd-nav-link" onclick="showPanel('education', this)">
            <i class="fas fa-user-graduate"></i> Education Details
        </button>
        <button class="sd-nav-link" onclick="showPanel('documents', this)">
            <i class="fas fa-folder-open"></i> Documents
        </button>
        <button class="sd-nav-link" onclick="showPanel('account-settings', this)">
            <i class="fas fa-cog"></i> Account Settings
        </button>

        <!-- Study Abroad -->
        <div class="sd-nav-label">Study Abroad</div>
        <button class="sd-nav-link" onclick="showPanel('search-universities', this)">
            <i class="fas fa-search"></i> Search Universities
        </button>
        <button class="sd-nav-link" onclick="showPanel('saved-universities', this)">
            <i class="fas fa-university"></i> Saved Universities
        </button>

        <!-- Applications -->
        <div class="sd-nav-label">Applications</div>
        <button class="sd-nav-link" onclick="showPanel('my-applications', this)">
            <i class="fas fa-file-alt"></i> My Applications
            <c:if test="${not empty applications}">
                <span class="sd-badge">${applications.size()}</span>
            </c:if>
        </button>
        <button class="sd-nav-link" onclick="showPanel('app-tracking', this)">
            <i class="fas fa-route"></i> Application Tracking
        </button>
        <button class="sd-nav-link" onclick="showPanel('offer-letters', this)">
            <i class="fas fa-envelope-open-text"></i> Offer Letters
        </button>

        <!-- Scholarships -->
        <div class="sd-nav-label">Scholarships</div>
        <button class="sd-nav-link" onclick="showPanel('schol-recommendations', this)">
            <i class="fas fa-star"></i> Recommendations
        </button>
        <button class="sd-nav-link" onclick="showPanel('saved-scholarships', this)">
            <i class="fas fa-heart"></i> Saved Scholarships
        </button>

        <!-- Support -->
        <div class="sd-nav-label">Support</div>
        <button class="sd-nav-link" onclick="showPanel('enquiries', this)">
            <i class="fas fa-question-circle"></i> My Enquiries
        </button>
        <button class="sd-nav-link" onclick="showPanel('notifications', this)">
            <i class="fas fa-bell"></i> Notifications
            <c:if test="${not empty unreadNotificationsCount && unreadNotificationsCount > 0}">
                <span class="sd-badge">${unreadNotificationsCount}</span>
            </c:if>
        </button>
        <button class="sd-nav-link" onclick="showPanel('help-center', this)">
            <i class="fas fa-life-ring"></i> Help Center
        </button>

    </nav>

    <!-- Footer -->
    <div class="sd-sidebar-footer">
        <a href="/logout" style="display:flex;align-items:center;gap:9px;padding:9px 13px;border-radius:9px;color:#ef4444;text-decoration:none;font-size:0.85rem;font-weight:600;transition:background 0.2s;"
           onmouseover="this.style.background='rgba(239,68,68,0.08)'" onmouseout="this.style.background='none'">
            <i class="fas fa-sign-out-alt"></i> Sign Out
        </a>
    </div>
</aside>

<!-- ══ MAIN ══ -->
<div class="sd-main">

    <!-- Top Bar -->
    <div class="sd-topbar">
        <div style="display:flex;align-items:center;gap:12px;">
            <button class="sd-hamburger" id="hamburgerBtn" onclick="toggleSidebar()">
                <i class="fas fa-bars"></i>
            </button>
            <div>
                <div class="sd-topbar-title" id="pageTitle">Dashboard Overview</div>
                <div class="sd-topbar-sub" id="pageSub">Welcome back, ${not empty sessionScope.loggedInUser.name ? sessionScope.loggedInUser.name : 'Student'}!</div>
            </div>
        </div>
        <div class="sd-topbar-actions">
            <button class="sd-notif-btn" onclick="showPanel('notifications', document.querySelector('[onclick*=notifications]'))">
                <i class="fas fa-bell"></i>
                <c:if test="${not empty unreadNotificationsCount && unreadNotificationsCount > 0}">
                    <span class="sd-notif-dot"></span>
                </c:if>
            </button>
            <a href="/user/dashboard" style="text-decoration:none;">
                <div style="width:36px;height:36px;border-radius:50%;background:linear-gradient(135deg,#6366f1,#8b5cf6);display:flex;align-items:center;justify-content:center;color:#fff;font-weight:700;font-size:0.9rem;">
                    ${not empty sessionScope.loggedInUser.name ? sessionScope.loggedInUser.name.substring(0,1).toUpperCase() : 'S'}
                </div>
            </a>
        </div>
    </div>

    <!-- ══ CONTENT PANELS ══ -->
    <div class="sd-content">
        <!-- Alert Messages -->
        <div id="dashboardAlerts">
            <c:if test="${not empty successMsg}">
                <div style="background: #dcfce7; border: 1px solid #bbf7d0; color: #15803d; padding: 12px 16px; border-radius: 12px; margin-bottom: 20px; font-size: 0.9rem; display: flex; align-items: center; gap: 8px;">
                    <i class="fas fa-check-circle"></i>
                    <span>${successMsg}</span>
                </div>
            </c:if>
            <c:if test="${not empty errorMsg}">
                <div style="background: #fee2e2; border: 1px solid #fecaca; color: #b91c1c; padding: 12px 16px; border-radius: 12px; margin-bottom: 20px; font-size: 0.9rem; display: flex; align-items: center; gap: 8px;">
                    <i class="fas fa-exclamation-circle"></i>
                    <span>${errorMsg}</span>
                </div>
            </c:if>
        </div>

        <!-- ─── OVERVIEW ─── -->
        <div class="sd-panel active" id="panel-overview">
            <!-- Welcome Banner -->
            <div style="background: linear-gradient(135deg, #4f46e5, #7c3aed); color: #ffffff; padding: 24px; border-radius: 16px; margin-bottom: 22px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.2);">
                <div>
                    <h3 style="font-weight: 700; margin-bottom: 6px; color:#ffffff;">Welcome Back, ${sessionScope.loggedInUser.name}!</h3>
                    <p style="margin-bottom: 0; opacity: 0.9; font-size: 0.9rem;">Great progress! Let's continue matching you with top universities and programs.</p>
                </div>
                <div style="text-align: right; min-width: 180px;">
                    <div style="font-weight: 600; font-size: 0.88rem; margin-bottom: 8px;">Profile Completion: ${profileCompletion}%</div>
                    <div style="width: 100%; height: 8px; background: rgba(255, 255, 255, 0.2); border-radius: 4px; overflow: hidden; margin-bottom: 8px;">
                        <div style="width: ${profileCompletion}%; height: 100%; background: #ffffff; border-radius: 4px; transition: width 0.6s;"></div>
                    </div>
                    <c:set var="isPersonalIncomplete" value="${empty sessionScope.loggedInUser.phone or empty sessionScope.loggedInUser.countryInterest or empty sessionScope.loggedInUser.courseInterest or empty sessionScope.loggedInUser.budget}" />
                    <c:set var="isAcademicIncomplete" value="${empty studentProfile or empty studentProfile.qualification or empty studentProfile.fieldOfStudy or empty studentProfile.gradYear or empty studentProfile.gpa or empty studentProfile.englishScore}" />
                    <c:set var="isResumeIncomplete" value="${empty sessionScope.loggedInUser.resumeUrl}" />
                    <c:choose>
                        <c:when test="${isPersonalIncomplete}">
                            <a href="javascript:void(0)" onclick="showPanel('my-profile', document.querySelector('[onclick*=my-profile]'))" style="color: #ffffff; font-size: 0.78rem; text-decoration: underline; font-weight: 500;"><i class="fas fa-arrow-right me-1"></i>Next: Complete Profile Info</a>
                        </c:when>
                        <c:when test="${isAcademicIncomplete}">
                            <a href="javascript:void(0)" onclick="showPanel('education', document.querySelector('[onclick*=education]'))" style="color: #ffffff; font-size: 0.78rem; text-decoration: underline; font-weight: 500;"><i class="fas fa-arrow-right me-1"></i>Next: Complete Education Details</a>
                        </c:when>
                        <c:when test="${isResumeIncomplete}">
                            <a href="javascript:void(0)" onclick="showPanel('documents', document.querySelector('[onclick*=documents]'))" style="color: #ffffff; font-size: 0.78rem; text-decoration: underline; font-weight: 500;"><i class="fas fa-arrow-right me-1"></i>Next: Upload Resume</a>
                        </c:when>
                        <c:otherwise>
                            <span style="color: #dcfce7; font-size: 0.78rem; font-weight: 600;"><i class="fas fa-check-circle me-1"></i>Profile Complete!</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Stat Cards -->
            <div class="stat-grid">
                <div class="stat-card" onclick="showPanel('saved-universities', document.querySelector('[onclick*=saved-universities]'))">
                    <div class="stat-icon" style="background:#dbeafe;">
                        <i class="fas fa-university" style="color:#3b82f6;"></i>
                    </div>
                    <div>
                        <div class="stat-num">${savedUniversitiesCount}</div>
                        <div class="stat-lbl">Saved Universities</div>
                    </div>
                </div>
                <div class="stat-card" onclick="showPanel('saved-courses', document.querySelector('[onclick*=saved-courses]'))">
                    <div class="stat-icon" style="background:#dcfce7;">
                        <i class="fas fa-book-open" style="color:#16a34a;"></i>
                    </div>
                    <div>
                        <div class="stat-num">${savedCoursesCount}</div>
                        <div class="stat-lbl">Saved Courses</div>
                    </div>
                </div>
                <div class="stat-card" onclick="showPanel('my-applications', document.querySelector('[onclick*=my-applications]'))">
                    <div class="stat-icon" style="background:#ede9fe;">
                        <i class="fas fa-file-alt" style="color:#7c3aed;"></i>
                    </div>
                    <div>
                        <div class="stat-num">${not empty applications ? applications.size() : 0}</div>
                        <div class="stat-lbl">Applications Submitted</div>
                    </div>
                </div>
                <div class="stat-card" onclick="showPanel('schol-recommendations', document.querySelector('[onclick*=schol-recommendations]'))">
                    <div class="stat-icon" style="background:#fef9c3;">
                        <i class="fas fa-star" style="color:#ca8a04;"></i>
                    </div>
                    <div>
                        <div class="stat-num">
                            <c:choose>
                                <c:when test="${not empty scholarships}">${scholarships.size()}</c:when>
                                <c:otherwise>0</c:otherwise>
                            </c:choose>
                        </div>
                        <div class="stat-lbl">Scholarships Available</div>
                    </div>
                </div>
            </div>

            <!-- Application Status Summary + Quick Actions -->
            <div style="display:grid;grid-template-columns:1fr 1fr;gap:20px;margin-bottom:22px;">
                <!-- Status Summary -->
                <div class="sd-card">
                    <div class="sd-card-title"><i class="fas fa-chart-bar"></i> Application Status Summary</div>
                    <c:choose>
                        <c:when test="${not empty applications}">
                            <c:set var="pendingCount" value="0"/>
                            <c:set var="acceptedCount" value="0"/>
                            <c:set var="rejectedCount" value="0"/>
                            <c:set var="reviewCount" value="0"/>
                            <c:forEach var="app" items="${applications}">
                                <c:if test="${app.status == 'PENDING'}"><c:set var="pendingCount" value="${pendingCount + 1}"/></c:if>
                                <c:if test="${app.status == 'ACCEPTED' or app.status == 'APPROVED' or app.status == 'ADMISSION_CONFIRMED'}"><c:set var="acceptedCount" value="${acceptedCount + 1}"/></c:if>
                                <c:if test="${app.status == 'REJECTED'}"><c:set var="rejectedCount" value="${rejectedCount + 1}"/></c:if>
                                <c:if test="${app.status == 'UNDER_REVIEW' or app.status == 'SHORTLISTED'}"><c:set var="reviewCount" value="${reviewCount + 1}"/></c:if>
                            </c:forEach>
                            <div style="display:flex;flex-direction:column;gap:12px;">
                                <div style="display:flex;justify-content:space-between;align-items:center;">
                                    <span style="font-size:0.85rem;color:#64748b;display:flex;align-items:center;gap:7px;"><span style="width:10px;height:10px;border-radius:50%;background:#f59e0b;display:inline-block;"></span>Pending</span>
                                    <span style="font-weight:700;color:#0f172a;">${pendingCount}</span>
                                </div>
                                <div style="height:6px;background:#f1f5f9;border-radius:4px;overflow:hidden;"><div style="height:100%;background:#f59e0b;border-radius:4px;width:${applications.size() > 0 ? pendingCount * 100 / applications.size() : 0}%;transition:width 0.6s;"></div></div>
                                <div style="display:flex;justify-content:space-between;align-items:center;">
                                    <span style="font-size:0.85rem;color:#64748b;display:flex;align-items:center;gap:7px;"><span style="width:10px;height:10px;border-radius:50%;background:#6366f1;display:inline-block;"></span>Under Review</span>
                                    <span style="font-weight:700;color:#0f172a;">${reviewCount}</span>
                                </div>
                                <div style="height:6px;background:#f1f5f9;border-radius:4px;overflow:hidden;"><div style="height:100%;background:#6366f1;border-radius:4px;width:${applications.size() > 0 ? reviewCount * 100 / applications.size() : 0}%;transition:width 0.6s;"></div></div>
                                <div style="display:flex;justify-content:space-between;align-items:center;">
                                    <span style="font-size:0.85rem;color:#64748b;display:flex;align-items:center;gap:7px;"><span style="width:10px;height:10px;border-radius:50%;background:#22c55e;display:inline-block;"></span>Accepted</span>
                                    <span style="font-weight:700;color:#0f172a;">${acceptedCount}</span>
                                </div>
                                <div style="height:6px;background:#f1f5f9;border-radius:4px;overflow:hidden;"><div style="height:100%;background:#22c55e;border-radius:4px;width:${applications.size() > 0 ? acceptedCount * 100 / applications.size() : 0}%;transition:width 0.6s;"></div></div>
                                <div style="display:flex;justify-content:space-between;align-items:center;">
                                    <span style="font-size:0.85rem;color:#64748b;display:flex;align-items:center;gap:7px;"><span style="width:10px;height:10px;border-radius:50%;background:#ef4444;display:inline-block;"></span>Rejected</span>
                                    <span style="font-weight:700;color:#0f172a;">${rejectedCount}</span>
                                </div>
                                <div style="height:6px;background:#f1f5f9;border-radius:4px;overflow:hidden;"><div style="height:100%;background:#ef4444;border-radius:4px;width:${applications.size() > 0 ? rejectedCount * 100 / applications.size() : 0}%;transition:width 0.6s;"></div></div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">
                                <i class="fas fa-file-alt"></i>
                                <p>No applications yet.</p>
                                <button class="btn-sd-primary" onclick="window.location.href='/universities'">Explore Universities</button>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Quick Actions -->
                <div class="sd-card">
                    <div class="sd-card-title"><i class="fas fa-bolt"></i> Quick Actions</div>
                    <div style="display:flex;flex-direction:column;gap:10px;">
                        <button class="btn-sd-primary" style="width:100%;display:flex;align-items:center;gap:10px;" onclick="window.location.href='/universities'">
                            <i class="fas fa-search"></i> Search Universities
                        </button>
                        <button class="btn-sd-outline" style="width:100%;display:flex;align-items:center;gap:10px;" onclick="window.location.href='/courses'">
                            <i class="fas fa-book-open"></i> Browse Courses
                        </button>
                        <button class="btn-sd-outline" style="width:100%;display:flex;align-items:center;gap:10px;" onclick="window.location.href='/scholarships'">
                            <i class="fas fa-star"></i> View Scholarships
                        </button>
                        <button class="btn-sd-outline" style="width:100%;display:flex;align-items:center;gap:10px;" onclick="window.location.href='/user/dashboard?panel=my-profile'">
                            <i class="fas fa-user-edit"></i> Update Profile
                        </button>
                    </div>
                </div>
            </div>

            <!-- Recent Applications -->
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-clock"></i> Recent Applications</div>
                <div class="table-responsive">
                    <table class="table sd-table mb-0">
                        <thead><tr><th>Type</th><th>Title</th><th>Provider</th><th>Status</th><th>Applied On</th></tr></thead>
                        <tbody>
                            <c:forEach var="app" items="${applications}" end="4">
                                <tr>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty app.job}"><span class="sd-badge-pill badge-job">Job</span></c:when>
                                            <c:when test="${not empty app.course}"><span class="sd-badge-pill badge-course">Course</span></c:when>
                                            <c:otherwise><span class="sd-badge-pill badge-uni">University</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="fw-semibold" style="color:#1e293b;">${not empty app.job ? app.job.title : (not empty app.course ? app.course.name : 'N/A')}</td>
                                    <td style="color:#64748b;">${not empty app.job ? app.job.provider.organizationName : (not empty app.course and not empty app.course.university ? app.course.university.name : '—')}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${app.status == 'PENDING'}"><span class="sd-badge-pill badge-pending">Pending</span></c:when>
                                            <c:when test="${app.status == 'ACCEPTED' or app.status == 'APPROVED'}"><span class="sd-badge-pill badge-accepted">Accepted</span></c:when>
                                            <c:when test="${app.status == 'REJECTED'}"><span class="sd-badge-pill badge-rejected">Rejected</span></c:when>
                                            <c:when test="${app.status == 'SHORTLISTED'}"><span class="sd-badge-pill badge-shortlisted">Shortlisted</span></c:when>
                                            <c:otherwise><span class="sd-badge-pill badge-review">${app.status}</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="color:#94a3b8;font-size:0.82rem;">${app.appliedAt.toLocalDate()}</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty applications}">
                                <tr><td colspan="5" class="text-center py-4" style="color:#94a3b8;">No applications yet. <button class="btn-sd-primary" style="margin-left:8px;padding:5px 14px;font-size:0.78rem;" onclick="window.location.href='/universities'">Start Exploring</button></td></tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- ─── MY PROFILE ─── -->
        <div class="sd-panel" id="panel-my-profile">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-user"></i> My Profile</div>
                <div style="display:flex;align-items:center;gap:20px;margin-bottom:28px;padding-bottom:20px;border-bottom:1px solid #f1f5f9;">
                    <div style="width:72px;height:72px;border-radius:50%;background:linear-gradient(135deg,#6366f1,#8b5cf6);display:flex;align-items:center;justify-content:center;color:#fff;font-size:1.8rem;font-weight:800;">
                        ${not empty sessionScope.loggedInUser.name ? sessionScope.loggedInUser.name.substring(0,1).toUpperCase() : 'S'}
                    </div>
                    <div>
                        <div style="font-size:1.2rem;font-weight:700;color:#0f172a;">${sessionScope.loggedInUser.name}</div>
                        <div style="font-size:0.85rem;color:#64748b;">${sessionScope.loggedInUser.email}</div>
                        <span class="sd-badge-pill badge-review" style="margin-top:6px;display:inline-flex;">Student</span>
                    </div>
                </div>
                <form action="/user/update-profile" method="POST">
                    <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px;">
                        <div class="form-group">
                            <label class="form-label-sd">Full Name</label>
                            <input type="text" name="name" class="form-input" value="${sessionScope.loggedInUser.name}">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">Email</label>
                            <input type="email" class="form-input" value="${sessionScope.loggedInUser.email}" disabled style="background:#f1f5f9;cursor:not-allowed;">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">Phone Number</label>
                            <input type="text" name="phone" class="form-input" value="${sessionScope.loggedInUser.phone}" placeholder="+91 9000000000">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">Country of Interest</label>
                            <input type="text" name="countryInterest" class="form-input" value="${sessionScope.loggedInUser.countryInterest}" placeholder="e.g. Canada, UK">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">Course Interest</label>
                            <input type="text" name="courseInterest" class="form-input" value="${sessionScope.loggedInUser.courseInterest}" placeholder="e.g. MBA, Computer Science">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">Budget (Annual)</label>
                            <input type="text" name="budget" class="form-input" value="${sessionScope.loggedInUser.budget}" placeholder="e.g. $20,000">
                        </div>
                    </div>
                    <div style="margin-top:8px;text-align:right;display:flex;gap:10px;justify-content:flex-end;">
                        <button type="reset" class="btn-sd-outline">Reset</button>
                        <button type="submit" class="btn-sd-primary"><i class="fas fa-save me-2"></i>Save Changes</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- ─── EDUCATION DETAILS ─── -->
        <div class="sd-panel" id="panel-education">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-user-graduate"></i> Education Details</div>
                <form action="/user/update-education" method="POST">
                    <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px;">
                        <div class="form-group">
                            <label class="form-label-sd">Highest Qualification</label>
                            <select class="form-input" name="qualification">
                                <option ${studentProfile.qualification == '10th / High School' ? 'selected' : ''}>10th / High School</option>
                                <option ${studentProfile.qualification == '12th / Higher Secondary' ? 'selected' : ''}>12th / Higher Secondary</option>
                                <option ${studentProfile.qualification == 'Diploma' ? 'selected' : ''}>Diploma</option>
                                <option ${studentProfile.qualification == "Bachelor's Degree" ? 'selected' : ''}>Bachelor's Degree</option>
                                <option ${studentProfile.qualification == "Master's Degree" ? 'selected' : ''}>Master's Degree</option>
                                <option ${studentProfile.qualification == 'PhD' ? 'selected' : ''}>PhD</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">Field of Study</label>
                            <input type="text" name="fieldOfStudy" class="form-input" value="${not empty studentProfile.fieldOfStudy ? studentProfile.fieldOfStudy : sessionScope.loggedInUser.courseInterest}" placeholder="e.g. Computer Science">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">Graduation Year</label>
                            <input type="text" name="gradYear" class="form-input" value="${studentProfile.gradYear}" placeholder="e.g. 2024">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">GPA / Percentage</label>
                            <input type="text" name="gpa" class="form-input" value="${studentProfile.gpa}" placeholder="e.g. 3.8 / 85%">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">English Test Score</label>
                            <input type="text" name="englishScore" class="form-input" value="${studentProfile.englishScore}" placeholder="e.g. IELTS 7.0 / TOEFL 100">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">Skills</label>
                            <input type="text" name="skills" class="form-input" value="${not empty studentProfile.skills ? studentProfile.skills : sessionScope.loggedInUser.skills}" placeholder="e.g. Python, Communication">
                        </div>
                    </div>
                    <div style="text-align:right;margin-top:8px;">
                        <button type="submit" class="btn-sd-primary"><i class="fas fa-save me-2"></i>Save Education</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- ─── DOCUMENTS ─── -->
        <div class="sd-panel" id="panel-documents">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-folder-open"></i> My Documents</div>
                <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(220px,1fr));gap:14px;">
                    <c:set var="docs" value="${['Passport','10th Marksheet','12th Marksheet','Degree Certificate','IELTS / TOEFL Score','Resume / CV','Statement of Purpose','Recommendation Letter','Police Clearance']}"/>
                    <c:forEach var="doc" items="${docs}">
                        <c:choose>
                            <c:when test="${doc == 'Resume / CV'}">
                                <c:choose>
                                    <c:when test="${not empty sessionScope.loggedInUser.resumeUrl}">
                                        <div style="border:2px solid #dcfce7;border-radius:12px;padding:18px;text-align:center;background:#f0fdf4;">
                                            <i class="fas fa-file-pdf" style="font-size:1.6rem;color:#16a34a;margin-bottom:10px;display:block;"></i>
                                            <div style="font-size:0.82rem;font-weight:600;color:#334155;margin-bottom:8px;">Resume / CV (Uploaded)</div>
                                            <div style="display:flex; justify-content:center; gap:8px;">
                                                <a href="${sessionScope.loggedInUser.resumeUrl}" target="_blank"
                                                   style="font-size:0.75rem;background:#dcfce7;color:#15803d;padding:4px 12px;border-radius:20px;font-weight:600;text-decoration:none;">
                                                    <i class="fas fa-eye me-1"></i>View
                                                </a>
                                                <form action="/user/upload-resume" method="POST" enctype="multipart/form-data" id="reuploadResumeForm" style="display:inline;">
                                                    <label style="cursor:pointer;">
                                                        <span style="font-size:0.75rem;background:#ede9fe;color:#6d28d9;padding:4px 12px;border-radius:20px;font-weight:600;">
                                                            <i class="fas fa-redo me-1"></i>Update
                                                        </span>
                                                        <input type="file" name="resume" style="display:none;" onchange="document.getElementById('reuploadResumeForm').submit();">
                                                    </label>
                                                </form>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div style="border:2px dashed #e2e8f0;border-radius:12px;padding:18px;text-align:center;transition:border-color 0.2s;"
                                             onmouseover="this.style.borderColor='#6366f1'" onmouseout="this.style.borderColor='#e2e8f0'">
                                            <i class="fas fa-file-upload" style="font-size:1.6rem;color:#cbd5e1;margin-bottom:10px;display:block;"></i>
                                            <div style="font-size:0.82rem;font-weight:600;color:#334155;margin-bottom:8px;">Resume / CV</div>
                                            <form action="/user/upload-resume" method="POST" enctype="multipart/form-data" id="resumeForm">
                                                <label style="cursor:pointer;">
                                                    <span style="font-size:0.75rem;background:#ede9fe;color:#6d28d9;padding:4px 12px;border-radius:20px;font-weight:600;">
                                                        <i class="fas fa-plus me-1"></i>Upload
                                                    </span>
                                                    <input type="file" name="resume" style="display:none;" onchange="document.getElementById('resumeForm').submit();">
                                                </label>
                                            </form>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <div style="border:2px dashed #e2e8f0;border-radius:12px;padding:18px;text-align:center;transition:border-color 0.2s;"
                                     onmouseover="this.style.borderColor='#6366f1'" onmouseout="this.style.borderColor='#e2e8f0'">
                                    <i class="fas fa-file-upload" style="font-size:1.6rem;color:#cbd5e1;margin-bottom:10px;display:block;"></i>
                                    <div style="font-size:0.82rem;font-weight:600;color:#334155;margin-bottom:8px;">${doc}</div>
                                    <label style="cursor:pointer;">
                                        <span style="font-size:0.75rem;background:#ede9fe;color:#6d28d9;padding:4px 12px;border-radius:20px;font-weight:600;">
                                            <i class="fas fa-plus me-1"></i>Upload
                                        </span>
                                        <input type="file" style="display:none;">
                                    </label>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- ─── ACCOUNT SETTINGS ─── -->
        <div class="sd-panel" id="panel-account-settings">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-cog"></i> Account Settings</div>
                <div style="display:flex;flex-direction:column;gap:16px;">
                    <div style="padding:18px;background:#f8fafc;border-radius:12px;border:1px solid #e2e8f0;">
                        <div style="font-weight:700;color:#0f172a;margin-bottom:4px;">Change Password</div>
                        <div style="font-size:0.82rem;color:#64748b;margin-bottom:14px;">Keep your account secure with a strong password.</div>
                        <form action="/user/change-password" method="POST" style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:12px;">
                            <input type="password" name="currentPassword" class="form-input" placeholder="Current password">
                            <input type="password" name="newPassword" class="form-input" placeholder="New password">
                            <input type="password" name="confirmPassword" class="form-input" placeholder="Confirm password">
                            <div style="grid-column:1/-1;text-align:right;">
                                <button type="submit" class="btn-sd-primary">Update Password</button>
                            </div>
                        </form>
                    </div>
                    <div style="padding:18px;background:#fef2f2;border-radius:12px;border:1px solid #fecaca;">
                        <div style="font-weight:700;color:#b91c1c;margin-bottom:4px;">Delete Account</div>
                        <div style="font-size:0.82rem;color:#64748b;margin-bottom:14px;">This action is irreversible. All your data will be permanently deleted.</div>
                        <form action="/user/delete-account" method="POST">
                            <button type="submit" class="btn-sd-outline" style="color:#dc2626;border-color:#fca5a5;" onclick="return confirm('Are you sure? This cannot be undone.')">
                                <i class="fas fa-trash me-2"></i>Delete My Account
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- ─── SEARCH UNIVERSITIES ─── -->
        <div class="sd-panel" id="panel-search-universities">
            <div class="sd-card mb-4">
                <div class="sd-card-title"><i class="fas fa-search"></i> Search Universities</div>
                <div style="display:grid;grid-template-columns:1fr 1fr auto;gap:12px;">
                    <input type="text" id="uniSearch" class="form-input" placeholder="University name or keyword...">
                    <select id="countryFilter" class="form-input">
                        <option value="">All Countries</option>
                        <c:forEach var="c" items="${countries}">
                            <option value="${c.name}">${c.name}</option>
                        </c:forEach>
                    </select>
                    <button class="btn-sd-primary" onclick="filterUniversities()"><i class="fas fa-search me-2"></i>Search</button>
                </div>
            </div>
            <div class="item-grid" id="uniGrid">
                <c:choose>
                    <c:when test="${not empty universities}">
                        <c:forEach var="uni" items="${universities}">
                            <div class="item-card uni-item" 
                                 data-id="${uni.id}"
                                 data-name="${uni.name}"
                                 data-city="${uni.city}"
                                 data-country="${not empty uni.country ? uni.country.name : ''}"
                                 data-description="<c:out value='${uni.description}'/>"
                                 data-type="${uni.type}"
                                 data-established="${uni.establishedYear}"
                                 data-accreditation="${uni.accreditation}"
                                 data-website="${uni.website}"
                                 data-fees="${uni.fees}"
                                 data-ranking="${uni.ranking}"
                                 data-placement="${uni.placementPercentage}"
                                 data-image="${uni.imageUrl}"
                                 data-banner="${uni.bannerImage}"
                                 data-docs="<c:out value='${uni.requiredDocuments}'/>"
                                 data-recruiters="<c:out value='${uni.topRecruiters}'/>"
                                 data-contact-name="${uni.admissionContact}"
                                 data-contact-email="${uni.email}"
                                 data-contact-phone="${uni.phone}"
                                 data-contact-whatsapp="${uni.whatsapp}"
                                 data-has-hostel="${uni.hasHostel}"
                                 data-has-library="${uni.hasLibrary}"
                                 data-has-sports="${uni.hasSports}"
                                 data-has-placement="${uni.hasPlacementSupport}"
                                 data-has-transport="${uni.hasTransport}"
                                 data-has-wifi="${uni.hasWifi}"
                                 data-has-labs="${uni.hasLabs}"
                                 data-has-cafeteria="${uni.hasCafeteria}">
                                <div class="item-card-img" style="background:${uni.bannerImage != null ? 'url('.concat(uni.bannerImage).concat(') center/cover no-repeat') : 'linear-gradient(135deg,#6366f1,#8b5cf6)'};">
                                    <c:if test="${empty uni.bannerImage}"><i class="fas fa-university"></i></c:if>
                                </div>
                                <div class="item-card-body">
                                    <div class="item-card-title">${uni.name}</div>
                                    <div class="item-card-sub"><i class="fas fa-map-marker-alt me-1"></i>${not empty uni.country ? uni.country.name : 'International'} <c:if test="${not empty uni.city}">· ${uni.city}</c:if></div>
                                    <div style="margin-top:8px;display:flex;gap:6px;flex-wrap:wrap;">
                                        <c:if test="${not empty uni.ranking}"><span class="sd-badge-pill badge-review" style="font-size:0.7rem;">#${uni.ranking} Ranked</span></c:if>
                                        <c:if test="${uni.hasVisaAssistance}"><span class="sd-badge-pill badge-accepted" style="font-size:0.7rem;">Visa Help</span></c:if>
                                    </div>
                                    <div style="margin-top:10px;display:flex;gap:6px;align-items:stretch;">
                                        <a href="/user/enquire-uni?id=${uni.id}" class="btn-sd-primary" style="font-size:0.8rem;padding:7px 14px;text-align:center;flex:1;">Enquire Now</a>
                                        <button class="btn btn-outline-primary btn-sm px-3" style="border-radius:8px;display:flex;align-items:center;font-size:0.8rem;font-weight:600;" onclick="viewUniversityDetails(this)">
                                            <i class="fas fa-eye me-1"></i> View
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state" style="grid-column:1/-1;">
                            <i class="fas fa-university"></i>
                            <p>No universities found. Check back soon.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- ─── BROWSE COURSES ─── -->
        <div class="sd-panel" id="panel-browse-courses">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-book-open"></i> Browse Courses</div>
                <c:choose>
                    <c:when test="${not empty courses}">
                        <div class="item-grid">
                            <c:forEach var="course" items="${courses}">
                                <div class="item-card course-item" style="border: 1px solid #f1f5f9; border-radius: 12px; padding: 16px; display: flex; flex-direction: column; justify-content: space-between;">
                                    <div>
                                        <span class="sd-badge-pill badge-course" style="font-size:0.7rem; margin-bottom:8px; display:inline-block;">${course.degreeType}</span>
                                        <div class="item-card-title" style="font-size:1rem; font-weight:700; color:#0f172a; margin-bottom:4px;">${course.name}</div>
                                        <div class="item-card-sub" style="font-size:0.82rem; color:#64748b; margin-bottom:8px;">
                                            <i class="fas fa-university me-1"></i>${course.university.name}
                                        </div>
                                        <div style="font-size:0.8rem; color:#475569; margin-bottom:12px;">
                                            Duration: ${course.duration} · Fees: $${course.fees}
                                        </div>
                                    </div>
                                    <div style="display:flex; gap:6px;">
                                        <a href="/user/enquire-uni?id=${course.university.id}" class="btn-sd-primary flex-grow-1" style="font-size:0.8rem; padding:7px 14px; text-align:center;">Enquire Now</a>
                                        
                                        <c:set var="isCourseSaved" value="false" />
                                        <c:forEach var="sc" items="${savedCourses}">
                                            <c:if test="${sc.course.id == course.id}">
                                                <c:set var="isCourseSaved" value="true" />
                                            </c:if>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${isCourseSaved}">
                                                <a href="/user/unsave-course?id=${course.id}" class="btn btn-danger btn-sm px-3" style="border-radius:8px; display:flex; align-items:center;" title="Unsave Course"><i class="fas fa-bookmark"></i></a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/user/save-course?id=${course.id}" class="btn btn-outline-primary btn-sm px-3" style="border-radius:8px; display:flex; align-items:center;" title="Save Course"><i class="far fa-bookmark"></i></a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <i class="fas fa-book-open"></i>
                            <p>No courses available at the moment.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- ─── SAVED UNIVERSITIES ─── -->
        <div class="sd-panel" id="panel-saved-universities">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-university"></i> Saved Universities</div>
                <c:choose>
                    <c:when test="${not empty savedUniversities}">
                        <div class="item-grid">
                            <c:forEach var="saved" items="${savedUniversities}">
                                <c:set var="uni" value="${saved.university}"/>
                                <div class="item-card uni-item" 
                                     data-id="${uni.id}"
                                     data-name="${uni.name}"
                                     data-city="${uni.city}"
                                     data-country="${not empty uni.country ? uni.country.name : ''}"
                                     data-description="<c:out value='${uni.description}'/>"
                                     data-type="${uni.type}"
                                     data-established="${uni.establishedYear}"
                                     data-accreditation="${uni.accreditation}"
                                     data-website="${uni.website}"
                                     data-fees="${uni.fees}"
                                     data-ranking="${uni.ranking}"
                                     data-placement="${uni.placementPercentage}"
                                     data-image="${uni.imageUrl}"
                                     data-banner="${uni.bannerImage}"
                                     data-docs="<c:out value='${uni.requiredDocuments}'/>"
                                     data-recruiters="<c:out value='${uni.topRecruiters}'/>"
                                     data-contact-name="${uni.admissionContact}"
                                     data-contact-email="${uni.email}"
                                     data-contact-phone="${uni.phone}"
                                     data-contact-whatsapp="${uni.whatsapp}"
                                     data-has-hostel="${uni.hasHostel}"
                                     data-has-library="${uni.hasLibrary}"
                                     data-has-sports="${uni.hasSports}"
                                     data-has-placement="${uni.hasPlacementSupport}"
                                     data-has-transport="${uni.hasTransport}"
                                     data-has-wifi="${uni.hasWifi}"
                                     data-has-labs="${uni.hasLabs}"
                                     data-has-cafeteria="${uni.hasCafeteria}">
                                    <div class="item-card-img" style="background:${uni.bannerImage != null ? 'url('.concat(uni.bannerImage).concat(') center/cover no-repeat') : 'linear-gradient(135deg,#6366f1,#8b5cf6)'};">
                                        <c:if test="${empty uni.bannerImage}"><i class="fas fa-university"></i></c:if>
                                    </div>
                                    <div class="item-card-body">
                                        <div class="item-card-title">${uni.name}</div>
                                        <div class="item-card-sub"><i class="fas fa-map-marker-alt me-1"></i>${not empty uni.country ? uni.country.name : 'International'} <c:if test="${not empty uni.city}">· ${uni.city}</c:if></div>
                                        <div style="margin-top:8px;display:flex;gap:6px;flex-wrap:wrap;">
                                            <c:if test="${not empty uni.ranking}"><span class="sd-badge-pill badge-review" style="font-size:0.7rem;">#${uni.ranking} Ranked</span></c:if>
                                            <c:if test="${uni.hasVisaAssistance}"><span class="sd-badge-pill badge-accepted" style="font-size:0.7rem;">Visa Help</span></c:if>
                                        </div>
                                        <div style="margin-top:10px;display:flex;gap:6px;align-items:stretch;">
                                            <a href="/user/enquire-uni?id=${uni.id}" class="btn-sd-primary" style="font-size:0.8rem;padding:7px 14px;text-align:center;flex:1;">Enquire Now</a>
                                            <button class="btn btn-outline-primary btn-sm px-3" style="border-radius:8px;display:flex;align-items:center;font-size:0.8rem;font-weight:600;" onclick="viewUniversityDetails(this)">
                                                <i class="fas fa-eye me-1"></i> View
                                            </button>
                                            <a href="/user/unsave-university?id=${uni.id}" class="btn btn-outline-danger btn-sm px-3" style="border-radius:8px;display:flex;align-items:center;" title="Remove"><i class="fas fa-trash-alt"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <i class="fas fa-university"></i>
                            <p>You haven't saved any universities yet.</p>
                            <button class="btn-sd-primary" onclick="showPanel('search-universities', document.querySelector('[onclick*=search-universities]'))">
                                Search Universities
                            </button>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- ─── SAVED COURSES ─── -->
        <div class="sd-panel" id="panel-saved-courses">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-bookmark"></i> Saved Courses</div>
                <c:choose>
                    <c:when test="${not empty savedCourses}">
                        <div class="item-grid">
                            <c:forEach var="saved" items="${savedCourses}">
                                <c:set var="course" value="${saved.course}"/>
                                <div class="item-card course-item" style="border: 1px solid #f1f5f9; border-radius: 12px; padding: 16px; display: flex; flex-direction: column; justify-content: space-between;">
                                    <div>
                                        <span class="sd-badge-pill badge-course" style="font-size:0.7rem; margin-bottom:8px; display:inline-block;">${course.degreeType}</span>
                                        <div class="item-card-title" style="font-size:1rem; font-weight:700; color:#0f172a; margin-bottom:4px;">${course.name}</div>
                                        <div class="item-card-sub" style="font-size:0.82rem; color:#64748b; margin-bottom:8px;">
                                            <i class="fas fa-university me-1"></i>${course.university.name}
                                        </div>
                                        <div style="font-size:0.8rem; color:#475569; margin-bottom:12px;">
                                            Duration: ${course.duration} · Fees: $${course.fees}
                                        </div>
                                    </div>
                                    <div style="display:flex; gap:6px;">
                                        <a href="/user/enquire-uni?id=${course.university.id}" class="btn-sd-primary flex-grow-1" style="font-size:0.8rem; padding:7px 14px; text-align:center;">Enquire Now</a>
                                        <a href="/user/unsave-course?id=${course.id}" class="btn btn-outline-danger btn-sm px-3" style="border-radius:8px; display:flex; align-items:center;" title="Remove"><i class="fas fa-trash-alt"></i></a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <i class="fas fa-bookmark"></i>
                            <p>No saved courses yet.</p>
                            <button class="btn-sd-primary" onclick="showPanel('browse-courses', document.querySelector('[onclick*=browse-courses]'))">Browse Courses</button>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- ─── MY APPLICATIONS ─── -->
        <div class="sd-panel" id="panel-my-applications">
            <div class="sd-card p-0">
                <div style="padding:20px 22px 0;"><div class="sd-card-title"><i class="fas fa-file-alt"></i> My Applications</div></div>
                <div class="table-responsive">
                    <table class="table sd-table mb-0">
                        <thead><tr><th>Type</th><th>Title</th><th>Provider / University</th><th>Status</th><th>Applied On</th><th>Resume</th></tr></thead>
                        <tbody>
                            <c:forEach var="app" items="${applications}">
                                <tr>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty app.job}"><span class="sd-badge-pill badge-job">Job</span></c:when>
                                            <c:when test="${not empty app.course}"><span class="sd-badge-pill badge-course">Course</span></c:when>
                                            <c:otherwise><span class="sd-badge-pill badge-uni">University</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="font-weight:600;color:#1e293b;">${not empty app.job ? app.job.title : (not empty app.course ? app.course.name : 'N/A')}</td>
                                    <td style="color:#64748b;">${not empty app.job ? app.job.provider.organizationName : (not empty app.course and not empty app.course.university ? app.course.university.name : '—')}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${app.status == 'PENDING'}"><span class="sd-badge-pill badge-pending">Pending</span></c:when>
                                            <c:when test="${app.status == 'ACCEPTED' or app.status == 'APPROVED' or app.status == 'ADMISSION_CONFIRMED'}"><span class="sd-badge-pill badge-accepted">Accepted</span></c:when>
                                            <c:when test="${app.status == 'REJECTED'}"><span class="sd-badge-pill badge-rejected">Rejected</span></c:when>
                                            <c:when test="${app.status == 'SHORTLISTED'}"><span class="sd-badge-pill badge-shortlisted">Shortlisted</span></c:when>
                                            <c:otherwise><span class="sd-badge-pill badge-review">${app.status}</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="color:#94a3b8;font-size:0.82rem;">${app.appliedAt.toLocalDate()}</td>
                                    <td>
                                        <c:if test="${not empty app.resumeUrl}">
                                            <a href="${app.resumeUrl}" target="_blank" style="font-size:0.78rem;background:#ede9fe;color:#6d28d9;padding:4px 10px;border-radius:20px;font-weight:600;text-decoration:none;">
                                                <i class="fas fa-file-pdf me-1"></i>CV
                                            </a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty applications}">
                                <tr><td colspan="6"><div class="empty-state">
                                    <i class="fas fa-inbox"></i>
                                    <p>You haven't applied to anything yet.</p>
                                    <button class="btn-sd-primary" onclick="window.location.href='/universities'">Explore Universities</button>
                                </div></td></tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- ─── APPLICATION TRACKING ─── -->
        <div class="sd-panel" id="panel-app-tracking">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-route"></i> Application Tracking</div>
                <c:choose>
                    <c:when test="${not empty applications}">
                        <c:forEach var="app" items="${applications}">
                            <div style="margin-bottom:28px;padding-bottom:24px;border-bottom:1px solid #f1f5f9;">
                                <div style="font-weight:700;color:#0f172a;margin-bottom:16px;font-size:0.95rem;">
                                    ${not empty app.job ? app.job.title : (not empty app.course ? app.course.name : 'Application')}
                                </div>
                                <div class="tracker-step">
                                    <div class="tracker-dot dot-done"><i class="fas fa-check"></i></div>
                                    <div>
                                        <div style="font-weight:600;font-size:0.88rem;color:#15803d;">Application Submitted</div>
                                        <div style="font-size:0.78rem;color:#94a3b8;">${app.appliedAt.toLocalDate()}</div>
                                    </div>
                                </div>
                                <div class="tracker-step">
                                    <div class="tracker-dot ${app.status != 'PENDING' ? 'dot-done' : 'dot-active'}">
                                        <c:choose>
                                            <c:when test="${app.status != 'PENDING'}"><i class="fas fa-check"></i></c:when>
                                            <c:otherwise><i class="fas fa-clock"></i></c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div>
                                        <div style="font-weight:600;font-size:0.88rem;color:#1e293b;">Under Review</div>
                                        <div style="font-size:0.78rem;color:#94a3b8;">Being reviewed by the provider</div>
                                    </div>
                                </div>
                                <div class="tracker-step">
                                    <div class="tracker-dot ${app.status == 'SHORTLISTED' or app.status == 'ACCEPTED' or app.status == 'APPROVED' ? 'dot-done' : 'dot-pending'}">
                                        <i class="fas ${app.status == 'SHORTLISTED' or app.status == 'ACCEPTED' or app.status == 'APPROVED' ? 'fa-check' : 'fa-star'}"></i>
                                    </div>
                                    <div>
                                        <div style="font-weight:600;font-size:0.88rem;color:#1e293b;">Shortlisted</div>
                                        <div style="font-size:0.78rem;color:#94a3b8;">Selected for next stage</div>
                                    </div>
                                </div>
                                <div class="tracker-step" style="padding-bottom:0;">
                                    <div class="tracker-dot ${app.status == 'ACCEPTED' or app.status == 'APPROVED' or app.status == 'ADMISSION_CONFIRMED' ? 'dot-done' : (app.status == 'REJECTED' ? 'dot-pending' : 'dot-pending')}">
                                        <i class="fas ${app.status == 'ACCEPTED' or app.status == 'APPROVED' ? 'fa-check' : (app.status == 'REJECTED' ? 'fa-times' : 'fa-trophy')}"></i>
                                    </div>
                                    <div>
                                        <div style="font-weight:600;font-size:0.88rem;color:#1e293b;">Final Decision</div>
                                        <div style="font-size:0.78rem;color:#94a3b8;">
                                            <c:choose>
                                                <c:when test="${app.status == 'ACCEPTED' or app.status == 'APPROVED'}"><span style="color:#15803d;font-weight:600;">✓ Accepted!</span></c:when>
                                                <c:when test="${app.status == 'REJECTED'}"><span style="color:#dc2626;font-weight:600;">✗ Not selected</span></c:when>
                                                <c:otherwise>Awaiting decision</c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <i class="fas fa-route"></i>
                            <p>No active applications to track.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- ─── OFFER LETTERS ─── -->
        <div class="sd-panel" id="panel-offer-letters">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-envelope-open-text"></i> Offer Letters</div>
                <div class="empty-state">
                    <i class="fas fa-envelope-open-text"></i>
                    <p>No offer letters yet. Keep applying!</p>
                </div>
            </div>
        </div>

        <!-- ─── SCHOLARSHIP RECOMMENDATIONS ─── -->
        <div class="sd-panel" id="panel-schol-recommendations">
            <div class="sd-card-title" style="padding:0 0 14px;"><i class="fas fa-star"></i> Scholarship Recommendations</div>
            <div style="display:flex;flex-direction:column;gap:14px;">
                <c:choose>
                    <c:when test="${not empty scholarships}">
                        <c:forEach var="s" items="${scholarships}">
                            <div class="schol-card">
                                <div class="schol-icon"><i class="fas fa-award"></i></div>
                                <div style="flex:1;">
                                    <div style="font-weight:700;color:#0f172a;margin-bottom:3px;">${s.name}</div>
                                    <div style="font-size:0.8rem;color:#64748b;margin-bottom:8px;">${not empty s.country ? s.country : 'International'} · ${not empty s.amount ? s.amount : 'Amount varies'}</div>
                                    <div style="font-size:0.82rem;color:#334155;">${not empty s.description ? (s.description.length() > 100 ? s.description.substring(0, 100).concat('...') : s.description) : ''}</div>
                                    <div style="margin-top:10px;display:flex;gap:8px;">
                                        <button class="btn-sd-primary" style="padding:6px 14px;font-size:0.78rem;">Apply Now</button>
                                        <button class="btn-sd-outline" style="padding:6px 14px;font-size:0.78rem;"><i class="fas fa-heart me-1"></i>Save</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="sd-card">
                            <div class="empty-state">
                                <i class="fas fa-star"></i>
                                <p>Scholarship recommendations will appear here based on your profile.</p>
                                <button class="btn-sd-primary" onclick="showPanel('my-profile', document.querySelector('[onclick*=my-profile]'))">Complete Your Profile</button>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- ─── SAVED SCHOLARSHIPS ─── -->
        <div class="sd-panel" id="panel-saved-scholarships">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-heart"></i> Saved Scholarships</div>
                <div class="empty-state">
                    <i class="fas fa-heart"></i>
                    <p>No saved scholarships yet.</p>
                    <button class="btn-sd-primary" onclick="showPanel('schol-recommendations', document.querySelector('[onclick*=schol-recommendations]'))">View Recommendations</button>
                </div>
            </div>
        </div>

        <!-- ─── MY ENQUIRIES ─── -->
        <div class="sd-panel" id="panel-enquiries">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-question-circle"></i> My Enquiries</div>
                
                <c:choose>
                    <c:when test="${not empty enquiries}">
                        <div class="table-responsive">
                            <table class="table sd-table mb-0">
                                <thead>
                                    <tr>
                                        <th>Type</th>
                                        <th>University</th>
                                        <th>Message Preview</th>
                                        <th>Status</th>
                                        <th>Date Sent</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="e" items="${enquiries}">
                                        <tr style="cursor: pointer;" onclick="toggleEnquiryReply(${e.id})">
                                            <td>
                                                <c:choose>
                                                    <c:when test="${e.type == 'Study'}"><span class="sd-badge-pill badge-course">Study</span></c:when>
                                                    <c:when test="${e.type == 'Job'}"><span class="sd-badge-pill badge-job">Job</span></c:when>
                                                    <c:otherwise><span class="sd-badge-pill badge-uni">General</span></c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="fw-semibold" style="color:#1e293b;">
                                                <c:choose>
                                                    <c:when test="${not empty e.university}">${e.university.name}</c:when>
                                                    <c:otherwise><span class="text-muted">General (Admin)</span></c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td style="color:#64748b; max-width: 200px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${e.message}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${e.status == 'New' || e.status == 'PENDING'}">
                                                        <span class="sd-badge-pill badge-pending">${e.status}</span>
                                                    </c:when>
                                                    <c:when test="${e.status == 'Replied'}">
                                                        <span class="sd-badge-pill badge-accepted">Replied</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="sd-badge-pill badge-review">${e.status}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td style="color:#64748b;">
                                                <c:if test="${not empty e.createdAt}">
                                                    ${e.createdAt.toLocalDate()}
                                                </c:if>
                                            </td>
                                            <td>
                                                <button class="btn-sd-primary" style="padding: 4px 10px; font-size: 0.75rem; border-radius: 6px;" onclick="event.stopPropagation(); toggleEnquiryReply(${e.id});">
                                                    <i class="fas fa-eye me-1"></i> View Details
                                                </button>
                                            </td>
                                        </tr>
                                        <!-- Collapsible Details Row -->
                                        <tr id="enquiry-details-${e.id}" style="display: none; background-color: #f8fafc;">
                                            <td colspan="6" style="padding: 16px 20px;">
                                                <div style="display: flex; flex-direction: column; gap: 12px; border-left: 3px solid #6366f1; padding-left: 15px;">
                                                    <div>
                                                        <span style="font-weight: 700; font-size: 0.8rem; color: #475569; text-transform: uppercase; display: block; margin-bottom: 4px;">Your Enquiry Message</span>
                                                        <p style="font-size: 0.88rem; color: #1e293b; margin: 0; white-space: pre-wrap;">${e.message}</p>
                                                    </div>
                                                    
                                                    <c:choose>
                                                        <c:when test="${not empty e.reply}">
                                                            <div style="background: #e0e7ff; border-radius: 8px; padding: 12px; margin-top: 4px; border: 1px solid #c7d2fe;">
                                                                <span style="font-weight: 700; font-size: 0.8rem; color: #4338ca; text-transform: uppercase; display: block; margin-bottom: 4px;"><i class="fas fa-reply me-1"></i> Provider Reply</span>
                                                                <p style="font-size: 0.88rem; color: #312e81; margin: 0; white-space: pre-wrap;">${e.reply}</p>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div style="background: #f1f5f9; border-radius: 8px; padding: 12px; margin-top: 4px; border: 1px dashed #cbd5e1; color: #64748b; font-size: 0.85rem;">
                                                                <i class="fas fa-hourglass-half me-1"></i> Awaiting reply from provider...
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <i class="fas fa-question-circle"></i>
                            <p>You haven't submitted any enquiries yet.</p>
                            <a href="/enquiry" class="btn-sd-primary" style="text-decoration:none; display:inline-block; line-height:2.4;">Submit New Enquiry</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- ─── NOTIFICATIONS ─── -->
        <div class="sd-panel" id="panel-notifications">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-bell"></i> Notifications</div>
                <div>
                    <c:forEach var="n" items="${notifications}">
                        <div class="notif-item">
                            <div class="notif-dot-icon ${n.read ? 'notif-read' : 'notif-unread'}">
                                <c:choose>
                                    <c:when test="${n.type == 'APPLICATION'}"><i class="fas fa-file-alt"></i></c:when>
                                    <c:when test="${n.type == 'SCHOLARSHIP'}"><i class="fas fa-star"></i></c:when>
                                    <c:when test="${n.type == 'ENQUIRY'}"><i class="fas fa-question-circle"></i></c:when>
                                    <c:otherwise><i class="fas fa-university"></i></c:otherwise>
                                </c:choose>
                            </div>
                            <div style="flex:1;">
                                <div style="font-weight:600;font-size:0.88rem;color:#1e293b;">${n.title}</div>
                                <div style="font-size:0.8rem;color:#64748b;margin-top:2px;">${n.message}</div>
                                <div class="notif-time" data-date="${n.createdAt}" style="font-size:0.74rem;color:#94a3b8;margin-top:4px;">
                                    <i class="fas fa-clock me-1"></i>Just now
                                </div>
                            </div>
                            <c:if test="${!n.read}">
                                <span class="sd-badge-pill badge-review" style="font-size:0.7rem;height:fit-content;">New</span>
                            </c:if>
                        </div>
                    </c:forEach>
                    <c:if test="${empty notifications}">
                        <div class="empty-state" style="padding: 40px 20px; text-align: center; color: #64748b;">
                            <i class="fas fa-bell-slash" style="font-size: 2.5rem; color: #cbd5e1; margin-bottom: 12px; display: block;"></i>
                            <p style="margin: 0; font-size: 0.9rem;">You have no notifications yet.</p>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- ─── HELP CENTER ─── -->
        <div class="sd-panel" id="panel-help-center">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-life-ring"></i> Help Center</div>
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:14px;">
                    <c:forEach var="faq" items="${[
                        'How do I apply to a university?',
                        'How do I track my application?',
                        'How do scholarships work?',
                        'How to upload documents?',
                        'Can I save multiple universities?',
                        'How to contact support?'
                    ]}">
                        <div style="padding:16px;background:#f8fafc;border-radius:12px;border:1px solid #e2e8f0;cursor:pointer;transition:all 0.2s;"
                             onmouseover="this.style.borderColor='#6366f1';this.style.background='#faf5ff'"
                             onmouseout="this.style.borderColor='#e2e8f0';this.style.background='#f8fafc'">
                            <div style="display:flex;align-items:center;gap:10px;">
                                <i class="fas fa-question-circle" style="color:#6366f1;"></i>
                                <span style="font-weight:600;font-size:0.86rem;color:#334155;">${faq}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div style="margin-top:20px;padding:20px;background:linear-gradient(135deg,#6366f1,#8b5cf6);border-radius:14px;color:#fff;text-align:center;">
                    <i class="fas fa-headset" style="font-size:2rem;margin-bottom:12px;display:block;"></i>
                    <div style="font-weight:700;font-size:1rem;margin-bottom:6px;">Need More Help?</div>
                    <div style="font-size:0.82rem;opacity:0.85;margin-bottom:14px;">Our support team is available Mon–Sat, 9AM–6PM IST</div>
                    <a href="/user/enquiry" style="background:#fff;color:#6366f1;padding:8px 22px;border-radius:50px;font-weight:700;font-size:0.85rem;text-decoration:none;">Contact Support</a>
                </div>
            </div>
        </div>

    </div><!-- end sd-content -->
</div><!-- end sd-main -->

<script>
    const pageMeta = {
        'overview':               ['Dashboard Overview',        'Welcome back, ${not empty sessionScope.loggedInUser.name ? sessionScope.loggedInUser.name : "Student"}!'],
        'my-profile':             ['My Profile',                'View and edit your personal information'],
        'education':              ['Education Details',         'Update your academic background'],
        'documents':              ['Documents',                 'Manage your uploaded documents'],
        'account-settings':       ['Account Settings',         'Manage security and preferences'],
        'search-universities':    ['Search Universities',       'Find your dream university abroad'],
        'browse-courses':         ['Browse Courses',            'Explore available courses worldwide'],
        'saved-universities':     ['Saved Universities',        'Universities you have bookmarked'],
        'saved-courses':          ['Saved Courses',             'Courses you have bookmarked'],
        'my-applications':        ['My Applications',           'All your submitted applications'],
        'app-tracking':           ['Application Tracking',      'Track the progress of each application'],
        'offer-letters':          ['Offer Letters',             'Your accepted offer letters'],
        'schol-recommendations':  ['Scholarship Recommendations','Scholarships matching your profile'],
        'saved-scholarships':     ['Saved Scholarships',        'Scholarships you have saved'],
        'notifications':          ['Notifications',             'Stay updated on your applications'],
        'enquiries':              ['My Enquiries',              'Track and view replies to your enquiries'],
        'help-center':            ['Help Center',               'FAQs and support resources'],
    };

    function toggleEnquiryReply(id) {
        const detailsRow = document.getElementById('enquiry-details-' + id);
        if (detailsRow) {
            if (detailsRow.style.display === 'none') {
                detailsRow.style.display = 'table-row';
            } else {
                detailsRow.style.display = 'none';
            }
        }
    }

    function showPanel(id, btn, isInitialLoad) {
        // Hide dashboard alerts on manual tab switch
        if (!isInitialLoad) {
            const alerts = document.getElementById('dashboardAlerts');
            if (alerts) alerts.style.display = 'none';
        }

        // Mark notifications read when panel is opened
        if (id === 'notifications') {
            fetch('/user/notifications/mark-read', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            }).then(response => {
                if (response.ok) {
                    document.querySelectorAll('.sd-badge, .sd-notif-dot').forEach(el => {
                        el.style.display = 'none';
                    });
                }
            }).catch(err => console.error('Error marking notifications read:', err));
        }

        // Hide all panels
        document.querySelectorAll('.sd-panel').forEach(p => p.classList.remove('active'));
        // Remove active from all nav links
        document.querySelectorAll('.sd-nav-link').forEach(l => l.classList.remove('active'));
        // Show target panel
        const panel = document.getElementById('panel-' + id);
        if (panel) panel.classList.add('active');
        // Set active nav link
        if (btn) btn.classList.add('active');
        // Update topbar
        if (pageMeta[id]) {
            document.getElementById('pageTitle').textContent = pageMeta[id][0];
            document.getElementById('pageSub').textContent = pageMeta[id][1];
        }
        // Close sidebar on mobile
        if (window.innerWidth <= 900) closeSidebar();
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    function toggleSidebar() {
        document.getElementById('sdSidebar').classList.toggle('open');
        document.getElementById('sdOverlay').classList.toggle('open');
    }
    function closeSidebar() {
        document.getElementById('sdSidebar').classList.remove('open');
        document.getElementById('sdOverlay').classList.remove('open');
    }

    function filterUniversities() {
        const q = document.getElementById('uniSearch').value.toLowerCase();
        const c = document.getElementById('countryFilter').value.toLowerCase();
        document.querySelectorAll('.uni-item').forEach(card => {
            const name = (card.dataset.name || '').toLowerCase();
            const country = (card.dataset.country || '').toLowerCase();
            card.style.display = (!q || name.includes(q)) && (!c || country.includes(c)) ? '' : 'none';
        });
    }

    // Auto-open panel based on query parameter
    window.addEventListener('DOMContentLoaded', () => {
        const urlParams = new URLSearchParams(window.location.search);
        const panelId = urlParams.get('panel');
        if (panelId && pageMeta[panelId]) {
            // Find nav button corresponding to this panel using attribute lookup
            const btn = Array.from(document.querySelectorAll('.sd-nav-link')).find(b => b.getAttribute('onclick')?.includes(panelId));
            showPanel(panelId, btn, true);
        }

        // Format relative times for notifications
        document.querySelectorAll('.notif-time').forEach(el => {
            const dateStr = el.getAttribute('data-date');
            if (!dateStr) return;
            const date = new Date(dateStr);
            const now = new Date();
            const diffMs = now - date;
            const diffMins = Math.floor(diffMs / 60000);
            const diffHours = Math.floor(diffMins / 60);
            const diffDays = Math.floor(diffHours / 24);

            if (isNaN(date.getTime())) return;

            if (diffMins < 1) {
                el.innerHTML = '<i class="fas fa-clock me-1"></i>Just now';
            } else if (diffMins < 60) {
                el.innerHTML = '<i class="fas fa-clock me-1"></i>' + diffMins + ' min' + (diffMins > 1 ? 's' : '') + ' ago';
            } else if (diffHours < 24) {
                el.innerHTML = '<i class="fas fa-clock me-1"></i>' + diffHours + ' hour' + (diffHours > 1 ? 's' : '') + ' ago';
            } else if (diffDays < 7) {
                el.innerHTML = '<i class="fas fa-clock me-1"></i>' + diffDays + ' day' + (diffDays > 1 ? 's' : '') + ' ago';
            } else {
                el.innerHTML = '<i class="fas fa-clock me-1"></i>' + date.toLocaleDateString();
            }
        });
    });

    function viewUniversityDetails(btn) {
        const card = btn.closest('.uni-item');
        if (!card) return;

        const ds = card.dataset;

        // Header image
        const headerEl = document.getElementById('uni-modal-header');
        if (ds.banner && ds.banner.startsWith('http')) {
            headerEl.style.background = `url('${ds.banner}') center/cover no-repeat`;
        } else if (ds.image && ds.image.startsWith('http')) {
            headerEl.style.background = `url('${ds.image}') center/cover no-repeat`;
        } else {
            headerEl.style.background = `linear-gradient(135deg, #6366f1, #8b5cf6)`;
        }

        document.getElementById('uni-modal-name').textContent = ds.name || 'University Details';
        document.getElementById('uni-modal-location').textContent = `${ds.city || ''}, ${ds.country || ''}`;
        
        // Quick Facts
        document.getElementById('uni-modal-type').textContent = ds.type || 'N/A';
        document.getElementById('uni-modal-ranking').textContent = ds.ranking ? `#${ds.ranking}` : 'N/A';
        document.getElementById('uni-modal-fees').textContent = ds.fees ? `$${ds.fees}` : 'N/A';
        document.getElementById('uni-modal-placement').textContent = ds.placement ? `${ds.placement}%` : 'N/A';
        document.getElementById('uni-modal-est').textContent = ds.established || 'N/A';
        document.getElementById('uni-modal-accreditation').textContent = ds.accreditation || 'N/A';
        
        const webLink = document.getElementById('uni-modal-website');
        if (ds.website) {
            webLink.href = ds.website;
            webLink.style.display = 'inline-flex';
        } else {
            webLink.style.display = 'none';
        }

        // About & Description
        document.getElementById('uni-modal-desc').textContent = ds.description || 'No description available.';
        document.getElementById('uni-modal-docs').textContent = ds.docs || 'No specific documents specified.';
        document.getElementById('uni-modal-recruiters').textContent = ds.recruiters || 'No recruiter details specified.';
        
        // Facilities
        const facilitiesList = document.getElementById('uni-modal-facilities');
        facilitiesList.innerHTML = '';
        const facilities = [
            { key: 'hasHostel', label: 'Hostel', icon: 'fa-bed' },
            { key: 'hasLibrary', label: 'Library', icon: 'fa-book' },
            { key: 'hasSports', label: 'Sports', icon: 'fa-volleyball-ball' },
            { key: 'hasPlacement', label: 'Placement Support', icon: 'fa-briefcase' },
            { key: 'hasTransport', label: 'Transport', icon: 'fa-bus' },
            { key: 'hasWifi', label: 'Wi-Fi', icon: 'fa-wifi' },
            { key: 'hasLabs', label: 'Laboratories', icon: 'fa-flask' },
            { key: 'hasCafeteria', label: 'Cafeteria', icon: 'fa-coffee' }
        ];
        let hasAnyFacility = false;
        facilities.forEach(f => {
            if (ds[f.key] === 'true') {
                hasAnyFacility = true;
                const span = document.createElement('span');
                span.className = 'facility-chip';
                span.innerHTML = `<i class="fas ${f.icon} text-primary"></i> ${f.label}`;
                facilitiesList.appendChild(span);
            }
        });
        if (!hasAnyFacility) {
            facilitiesList.innerHTML = '<span class="text-muted small">No campus facilities listed.</span>';
        }

        // Contact details
        document.getElementById('uni-modal-contact-name').textContent = ds.contactName || 'N/A';
        document.getElementById('uni-modal-contact-email').textContent = ds.contactEmail || 'N/A';
        document.getElementById('uni-modal-contact-email').href = ds.contactEmail ? `mailto:${ds.contactEmail}` : '#';
        document.getElementById('uni-modal-contact-phone').textContent = ds.contactPhone || 'N/A';
        document.getElementById('uni-modal-contact-whatsapp').textContent = ds.contactWhatsapp || 'N/A';

        // Show modal
        const modal = document.getElementById('uniDetailsModal');
        modal.style.display = 'flex';
        setTimeout(() => modal.classList.add('show'), 10);
    }

    function closeUniversityDetails() {
        const modal = document.getElementById('uniDetailsModal');
        modal.classList.remove('show');
        setTimeout(() => {
            modal.style.display = 'none';
        }, 300);
    }

    window.addEventListener('click', (e) => {
        const modal = document.getElementById('uniDetailsModal');
        if (e.target === modal) {
            closeUniversityDetails();
        }
    });
</script>

<!-- Custom University Details Modal -->
<div id="uniDetailsModal" class="custom-modal">
    <div class="custom-modal-content">
        <button class="custom-modal-close" onclick="closeUniversityDetails()">&times;</button>
        <div id="uni-modal-header" class="custom-modal-header">
            <div class="custom-modal-header-overlay"></div>
            <div class="custom-modal-header-text">
                <h2 id="uni-modal-name" class="fw-bold mb-1" style="font-size: 1.8rem; margin: 0;"></h2>
                <div id="uni-modal-location" class="small opacity-90"><i class="fas fa-map-marker-alt me-1 text-danger"></i></div>
            </div>
        </div>
        <div class="custom-modal-body">
            <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 24px;">
                <!-- Left Column -->
                <div style="display: flex; flex-direction: column; gap: 20px;">
                    <div>
                        <h4 style="font-size: 1.1rem; font-weight: 700; color: #1e293b; margin-bottom: 8px; border-bottom: 2px solid #f1f5f9; padding-bottom: 6px; display: flex; align-items: center; gap: 8px;"><i class="fas fa-info-circle text-primary"></i> About University</h4>
                        <p id="uni-modal-desc" style="font-size: 0.88rem; color: #475569; line-height: 1.6; white-space: pre-wrap; margin: 0;"></p>
                    </div>
                    <div>
                        <h4 style="font-size: 1.1rem; font-weight: 700; color: #1e293b; margin-bottom: 8px; border-bottom: 2px solid #f1f5f9; padding-bottom: 6px; display: flex; align-items: center; gap: 8px;"><i class="fas fa-university text-primary"></i> Campus Facilities</h4>
                        <div id="uni-modal-facilities" style="display: flex; flex-wrap: wrap; gap: 8px; margin-top: 8px;"></div>
                    </div>
                    <div>
                        <h4 style="font-size: 1.1rem; font-weight: 700; color: #1e293b; margin-bottom: 8px; border-bottom: 2px solid #f1f5f9; padding-bottom: 6px; display: flex; align-items: center; gap: 8px;"><i class="fas fa-file-signature text-primary"></i> Required Documents</h4>
                        <p id="uni-modal-docs" style="font-size: 0.88rem; color: #475569; line-height: 1.6; white-space: pre-wrap; margin: 0;"></p>
                    </div>
                    <div>
                        <h4 style="font-size: 1.1rem; font-weight: 700; color: #1e293b; margin-bottom: 8px; border-bottom: 2px solid #f1f5f9; padding-bottom: 6px; display: flex; align-items: center; gap: 8px;"><i class="fas fa-handshake text-primary"></i> Top Recruiters</h4>
                        <p id="uni-modal-recruiters" style="font-size: 0.88rem; color: #475569; line-height: 1.6; white-space: pre-wrap; margin: 0;"></p>
                    </div>
                </div>
                <!-- Right Column -->
                <div style="display: flex; flex-direction: column; gap: 16px;">
                    <div style="background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 12px; padding: 16px; display: flex; flex-direction: column; gap: 12px;">
                        <h5 style="font-size: 0.95rem; font-weight: 700; color: #0f172a; border-bottom: 1px solid #e2e8f0; padding-bottom: 6px; margin: 0;">Quick Facts</h5>
                        <div style="font-size: 0.82rem; color: #475569;">
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Type:</strong> <span id="uni-modal-type"></span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Ranking:</strong> <span id="uni-modal-ranking"></span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Avg Fees:</strong> <span id="uni-modal-fees"></span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Placement Rate:</strong> <span id="uni-modal-placement"></span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Established:</strong> <span id="uni-modal-est"></span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Accreditation:</strong> <span id="uni-modal-accreditation" style="text-align: right; max-width: 120px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"></span>
                            </div>
                        </div>
                        <a id="uni-modal-website" href="#" target="_blank" class="btn-sd-primary" style="font-size: 0.8rem; padding: 6px 12px; text-decoration: none; justify-content: center; align-items: center; gap: 4px; display: inline-flex;">
                            Visit Website <i class="fas fa-external-link-alt small"></i>
                        </a>
                    </div>

                    <div style="background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 12px; padding: 16px; display: flex; flex-direction: column; gap: 10px;">
                        <h5 style="font-size: 0.95rem; font-weight: 700; color: #0f172a; border-bottom: 1px solid #e2e8f0; padding-bottom: 6px; margin: 0;">Admission Contact</h5>
                        <div style="font-size: 0.82rem; color: #475569; display: flex; flex-direction: column; gap: 8px;">
                            <div><i class="fas fa-user text-primary me-2"></i> <span id="uni-modal-contact-name"></span></div>
                            <div><i class="fas fa-envelope text-primary me-2"></i> <a id="uni-modal-contact-email" href="#" style="text-decoration: none; color: inherit;"></a></div>
                            <div><i class="fas fa-phone-alt text-primary me-2"></i> <span id="uni-modal-contact-phone"></span></div>
                            <div><i class="fab fa-whatsapp text-success me-2"></i> <span id="uni-modal-contact-whatsapp"></span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
