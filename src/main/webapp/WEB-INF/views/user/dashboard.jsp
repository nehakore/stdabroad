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
        <button class="sd-nav-link" onclick="showPanel('browse-courses', this)">
            <i class="fas fa-book-open"></i> Browse Courses
        </button>
        <button class="sd-nav-link" onclick="showPanel('saved-universities', this)">
            <i class="fas fa-university"></i> Saved Universities
        </button>
        <button class="sd-nav-link" onclick="showPanel('saved-courses', this)">
            <i class="fas fa-bookmark"></i> Saved Courses
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
        <button class="sd-nav-link" onclick="showPanel('notifications', this)">
            <i class="fas fa-bell"></i> Notifications
            <span class="sd-badge">3</span>
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
                <span class="sd-notif-dot"></span>
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

        <!-- ─── OVERVIEW ─── -->
        <div class="sd-panel active" id="panel-overview">
            <!-- Stat Cards -->
            <div class="stat-grid">
                <div class="stat-card" onclick="showPanel('saved-universities', document.querySelector('[onclick*=saved-universities]'))">
                    <div class="stat-icon" style="background:#dbeafe;">
                        <i class="fas fa-university" style="color:#3b82f6;"></i>
                    </div>
                    <div>
                        <div class="stat-num">0</div>
                        <div class="stat-lbl">Saved Universities</div>
                    </div>
                </div>
                <div class="stat-card" onclick="showPanel('saved-courses', document.querySelector('[onclick*=saved-courses]'))">
                    <div class="stat-icon" style="background:#dcfce7;">
                        <i class="fas fa-book-open" style="color:#16a34a;"></i>
                    </div>
                    <div>
                        <div class="stat-num">0</div>
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
                                <button class="btn-sd-primary" onclick="showPanel('search-universities', document.querySelector('[onclick*=search-universities]'))">Explore Universities</button>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Quick Actions -->
                <div class="sd-card">
                    <div class="sd-card-title"><i class="fas fa-bolt"></i> Quick Actions</div>
                    <div style="display:flex;flex-direction:column;gap:10px;">
                        <button class="btn-sd-primary" style="width:100%;display:flex;align-items:center;gap:10px;" onclick="showPanel('search-universities', document.querySelector('[onclick*=search-universities]'))">
                            <i class="fas fa-search"></i> Search Universities
                        </button>
                        <button class="btn-sd-outline" style="width:100%;display:flex;align-items:center;gap:10px;" onclick="showPanel('browse-courses', document.querySelector('[onclick*=browse-courses]'))">
                            <i class="fas fa-book-open"></i> Browse Courses
                        </button>
                        <button class="btn-sd-outline" style="width:100%;display:flex;align-items:center;gap:10px;" onclick="showPanel('schol-recommendations', document.querySelector('[onclick*=schol-recommendations]'))">
                            <i class="fas fa-star"></i> View Scholarships
                        </button>
                        <button class="btn-sd-outline" style="width:100%;display:flex;align-items:center;gap:10px;" onclick="showPanel('my-profile', document.querySelector('[onclick*=my-profile]'))">
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
                                <tr><td colspan="5" class="text-center py-4" style="color:#94a3b8;">No applications yet. <button class="btn-sd-primary" style="margin-left:8px;padding:5px 14px;font-size:0.78rem;" onclick="showPanel('search-universities', document.querySelector('[onclick*=search-universities]'))">Start Exploring</button></td></tr>
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
                                <option>10th / High School</option>
                                <option>12th / Higher Secondary</option>
                                <option>Diploma</option>
                                <option>Bachelor's Degree</option>
                                <option>Master's Degree</option>
                                <option>PhD</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">Field of Study</label>
                            <input type="text" name="fieldOfStudy" class="form-input" value="${sessionScope.loggedInUser.courseInterest}" placeholder="e.g. Computer Science">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">Graduation Year</label>
                            <input type="text" name="gradYear" class="form-input" placeholder="e.g. 2024">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">GPA / Percentage</label>
                            <input type="text" name="gpa" class="form-input" placeholder="e.g. 3.8 / 85%">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">English Test Score</label>
                            <input type="text" name="englishScore" class="form-input" placeholder="e.g. IELTS 7.0 / TOEFL 100">
                        </div>
                        <div class="form-group">
                            <label class="form-label-sd">Skills</label>
                            <input type="text" name="skills" class="form-input" value="${sessionScope.loggedInUser.skills}" placeholder="e.g. Python, Communication">
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
                    </c:forEach>
                    <c:if test="${not empty sessionScope.loggedInUser.resumeUrl}">
                        <div style="border:2px solid #dcfce7;border-radius:12px;padding:18px;text-align:center;background:#f0fdf4;">
                            <i class="fas fa-file-pdf" style="font-size:1.6rem;color:#16a34a;margin-bottom:10px;display:block;"></i>
                            <div style="font-size:0.82rem;font-weight:600;color:#334155;margin-bottom:8px;">Resume / CV</div>
                            <a href="${sessionScope.loggedInUser.resumeUrl}" target="_blank"
                               style="font-size:0.75rem;background:#dcfce7;color:#15803d;padding:4px 12px;border-radius:20px;font-weight:600;text-decoration:none;">
                                <i class="fas fa-eye me-1"></i>View
                            </a>
                        </div>
                    </c:if>
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
                        <button class="btn-sd-outline" style="color:#dc2626;border-color:#fca5a5;" onclick="return confirm('Are you sure? This cannot be undone.')">
                            <i class="fas fa-trash me-2"></i>Delete My Account
                        </button>
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
                            <div class="item-card uni-item" data-name="${uni.name}" data-country="${not empty uni.country ? uni.country.name : ''}">
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
                                    <a href="/user/enquire-uni?id=${uni.id}" style="display:block;margin-top:10px;text-align:center;" class="btn-sd-primary" style="font-size:0.8rem;padding:7px 14px;">Enquire Now</a>
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
                <div class="empty-state">
                    <i class="fas fa-book-open"></i>
                    <p>Course browsing is coming soon.</p>
                    <a href="/universities" class="btn-sd-primary">Browse Universities Instead</a>
                </div>
            </div>
        </div>

        <!-- ─── SAVED UNIVERSITIES ─── -->
        <div class="sd-panel" id="panel-saved-universities">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-university"></i> Saved Universities</div>
                <div class="empty-state">
                    <i class="fas fa-university"></i>
                    <p>You haven't saved any universities yet.</p>
                    <button class="btn-sd-primary" onclick="showPanel('search-universities', document.querySelector('[onclick*=search-universities]'))">
                        Search Universities
                    </button>
                </div>
            </div>
        </div>

        <!-- ─── SAVED COURSES ─── -->
        <div class="sd-panel" id="panel-saved-courses">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-bookmark"></i> Saved Courses</div>
                <div class="empty-state">
                    <i class="fas fa-bookmark"></i>
                    <p>No saved courses yet.</p>
                    <button class="btn-sd-primary" onclick="showPanel('browse-courses', document.querySelector('[onclick*=browse-courses]'))">Browse Courses</button>
                </div>
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
                                    <button class="btn-sd-primary" onclick="showPanel('search-universities', document.querySelector('[onclick*=search-universities]'))">Explore Universities</button>
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
                                    <div style="font-size:0.82rem;color:#334155;">${not empty s.description ? s.description.substring(0, [s.description.length(), 100].min()) : ''}</div>
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

        <!-- ─── NOTIFICATIONS ─── -->
        <div class="sd-panel" id="panel-notifications">
            <div class="sd-card">
                <div class="sd-card-title"><i class="fas fa-bell"></i> Notifications</div>
                <div>
                    <div class="notif-item">
                        <div class="notif-dot-icon notif-unread"><i class="fas fa-file-alt"></i></div>
                        <div style="flex:1;">
                            <div style="font-weight:600;font-size:0.88rem;color:#1e293b;">Application Update</div>
                            <div style="font-size:0.8rem;color:#64748b;margin-top:2px;">Your application has been received and is under review.</div>
                            <div style="font-size:0.74rem;color:#94a3b8;margin-top:4px;"><i class="fas fa-clock me-1"></i>Just now</div>
                        </div>
                        <span class="sd-badge-pill badge-review" style="font-size:0.7rem;height:fit-content;">New</span>
                    </div>
                    <div class="notif-item">
                        <div class="notif-dot-icon notif-unread"><i class="fas fa-star"></i></div>
                        <div style="flex:1;">
                            <div style="font-weight:600;font-size:0.88rem;color:#1e293b;">New Scholarship Available</div>
                            <div style="font-size:0.8rem;color:#64748b;margin-top:2px;">A new scholarship matching your profile is now available.</div>
                            <div style="font-size:0.74rem;color:#94a3b8;margin-top:4px;"><i class="fas fa-clock me-1"></i>2 hours ago</div>
                        </div>
                        <span class="sd-badge-pill badge-review" style="font-size:0.7rem;height:fit-content;">New</span>
                    </div>
                    <div class="notif-item">
                        <div class="notif-dot-icon notif-read"><i class="fas fa-university"></i></div>
                        <div>
                            <div style="font-weight:600;font-size:0.88rem;color:#1e293b;">Welcome to STD Abroad!</div>
                            <div style="font-size:0.8rem;color:#64748b;margin-top:2px;">Your account has been created. Start exploring universities and courses.</div>
                            <div style="font-size:0.74rem;color:#94a3b8;margin-top:4px;"><i class="fas fa-clock me-1"></i>Today</div>
                        </div>
                    </div>
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
        'help-center':            ['Help Center',               'FAQs and support resources'],
    };

    function showPanel(id, btn) {
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
</script>

</body>
</html>
