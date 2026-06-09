<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Seeker Dashboard | STD Abroad</title>
    <meta name="description" content="Manage your international career - search jobs, track applications, and manage resume.">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Inter', sans-serif;
            background: #f8fafc;
            display: flex;
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* ══════════════════════════════════
           SIDEBAR
        ══════════════════════════════════ */
        .js-sidebar {
            width: 270px;
            background: linear-gradient(180deg, #111827 0%, #1f2937 100%);
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
        .js-sidebar::-webkit-scrollbar { width: 4px; }
        .js-sidebar::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.12); border-radius: 4px; }

        /* Brand */
        .js-brand {
            padding: 22px 20px 18px;
            border-bottom: 1px solid rgba(255,255,255,0.08);
            display: flex; align-items: center; gap: 12px;
        }
        .js-brand-icon {
            width: 44px; height: 44px; border-radius: 12px;
            background: linear-gradient(135deg, #0ea5e9, #3b82f6);
            display: flex; align-items: center; justify-content: center;
            font-size: 1.15rem; color: #fff; flex-shrink: 0;
            box-shadow: 0 4px 12px rgba(14,165,233,0.3);
        }
        .js-brand h5 { font-size: 1.05rem; font-weight: 700; color: #f8fafc; margin: 0; }
        .js-brand span { font-size: 0.7rem; color: #94a3b8; text-transform: uppercase; letter-spacing: 1px; font-weight: 500; }

        /* User Info */
        .js-user {
            padding: 16px 20px;
            border-bottom: 1px solid rgba(255,255,255,0.06);
            display: flex; align-items: center; gap: 12px;
        }
        .js-avatar {
            width: 42px; height: 42px; border-radius: 50%;
            background: linear-gradient(135deg, #0ea5e9, #6366f1);
            display: flex; align-items: center; justify-content: center;
            font-weight: 700; font-size: 1.1rem; color: #fff; flex-shrink: 0;
        }
        .js-user-name { font-size: 0.88rem; font-weight: 600; color: #f1f5f9; }
        .js-user-role { font-size: 0.72rem; color: #94a3b8; margin-top: 2px; }

        /* Nav */
        .js-nav { padding: 14px 12px; flex: 1; }
        .js-nav-label {
            font-size: 0.65rem; font-weight: 700; color: #4b5563;
            text-transform: uppercase; letter-spacing: 1.2px;
            padding: 12px 12px 6px; margin-top: 8px;
        }
        .js-nav-link {
            display: flex; align-items: center; gap: 12px;
            padding: 10px 14px; border-radius: 10px;
            color: #9ca3af; text-decoration: none;
            font-size: 0.88rem; font-weight: 500;
            transition: all 0.2s; margin-bottom: 3px; cursor: pointer;
            background: none; border: none; width: 100%; text-align: left;
        }
        .js-nav-link i { width: 18px; text-align: center; font-size: 0.95rem; flex-shrink: 0; transition: color 0.2s; }
        .js-nav-link:hover { background: rgba(255,255,255,0.05); color: #f3f4f6; }
        .js-nav-link.active {
            background: linear-gradient(135deg, #0ea5e9, #3b82f6);
            color: #fff;
            box-shadow: 0 4px 14px rgba(14,165,233,0.3);
            font-weight: 600;
        }
        .js-nav-link.active i { color: #fff; }
        .js-badge {
            margin-left: auto; background: #ef4444; color: #fff;
            font-size: 0.65rem; font-weight: 700;
            padding: 2px 8px; border-radius: 50px; flex-shrink: 0;
        }

        .js-sidebar-footer {
            padding: 16px 12px;
            border-top: 1px solid rgba(255,255,255,0.06);
        }

        /* ══════════════════════════════════
           MAIN CONTENT
        ══════════════════════════════════ */
        .js-main {
            margin-left: 270px;
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Top Bar */
        .js-topbar {
            background: #fff;
            padding: 16px 32px;
            display: flex; align-items: center; justify-content: space-between;
            border-bottom: 1px solid #e2e8f0;
            position: sticky; top: 0; z-index: 100;
            box-shadow: 0 1px 4px rgba(0,0,0,0.02);
        }
        .js-topbar-title { font-size: 1.15rem; font-weight: 700; color: #1e293b; }
        .js-topbar-sub { font-size: 0.8rem; color: #64748b; margin-top: 2px; }
        .js-topbar-actions { display: flex; align-items: center; gap: 14px; }
        
        .js-action-btn {
            width: 40px; height: 40px; border-radius: 12px;
            background: #f1f5f9; border: none; cursor: pointer;
            display: flex; align-items: center; justify-content: center;
            color: #475569; font-size: 1rem; position: relative;
            transition: all 0.2s;
        }
        .js-action-btn:hover { background: #e2e8f0; color: #0f172a; transform: translateY(-1px); }
        .js-notif-dot {
            position: absolute; top: 8px; right: 8px;
            width: 8px; height: 8px; background: #ef4444;
            border-radius: 50%; border: 2px solid #fff;
        }
        .js-hamburger {
            display: none; background: none; border: none;
            font-size: 1.3rem; color: #475569; cursor: pointer;
        }

        /* Content Area */
        .js-content { padding: 30px 32px; flex: 1; }
        .js-panel { display: none; animation: fadeIn 0.3s ease; }
        .js-panel.active { display: block; }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(5px); } to { opacity: 1; transform: translateY(0); } }

        /* ══════════════════════════════════
           UI COMPONENTS
        ══════════════════════════════════ */
        .js-card {
            background: #fff; border-radius: 16px; padding: 24px;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05), 0 2px 4px -1px rgba(0,0,0,0.03);
            border: 1px solid #f1f5f9; margin-bottom: 24px;
        }
        .js-card-title {
            font-size: 0.9rem; font-weight: 700; color: #0ea5e9;
            text-transform: uppercase; letter-spacing: 0.8px;
            padding-bottom: 14px; margin-bottom: 20px;
            border-bottom: 2px solid #e0f2fe;
            display: flex; align-items: center; gap: 10px;
        }

        /* Stat Cards */
        .stat-grid { display: grid; grid-template-columns: repeat(5, 1fr); gap: 16px; margin-bottom: 28px; }
        .stat-card {
            background: #fff; border-radius: 16px; padding: 20px;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
            border: 1px solid #f1f5f9;
            display: flex; flex-direction: column; gap: 12px;
            transition: all 0.25s; cursor: pointer; position: relative; overflow: hidden;
        }
        .stat-card::before {
            content: ''; position: absolute; top: 0; left: 0; width: 100%; height: 4px;
            background: var(--sc-color, #0ea5e9); opacity: 0; transition: opacity 0.2s;
        }
        .stat-card:hover { transform: translateY(-4px); box-shadow: 0 10px 15px -3px rgba(0,0,0,0.08); }
        .stat-card:hover::before { opacity: 1; }
        
        .stat-header { display: flex; align-items: center; justify-content: space-between; }
        .stat-icon {
            width: 46px; height: 46px; border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.25rem;
        }
        .stat-num { font-size: 1.8rem; font-weight: 800; color: #0f172a; line-height: 1; margin-top: 4px; }
        .stat-lbl { font-size: 0.8rem; color: #64748b; font-weight: 500; margin-top: 4px; }

        /* Tables */
        .js-table { width: 100%; border-collapse: separate; border-spacing: 0; }
        .js-table th {
            font-size: 0.75rem; font-weight: 700; color: #64748b;
            text-transform: uppercase; letter-spacing: 0.6px;
            padding: 12px 18px; background: #f8fafc;
            border-bottom: 2px solid #e2e8f0; text-align: left;
        }
        .js-table th:first-child { border-top-left-radius: 10px; }
        .js-table th:last-child { border-top-right-radius: 10px; }
        .js-table td { padding: 16px 18px; font-size: 0.9rem; color: #334155; border-bottom: 1px solid #f1f5f9; vertical-align: middle; }
        .js-table tr:last-child td { border-bottom: none; }
        .js-table tr:hover td { background: #f8fafc; }

        /* Badges */
        .js-badge-pill {
            display: inline-flex; align-items: center;
            padding: 4px 12px; border-radius: 50px; font-size: 0.75rem; font-weight: 600;
        }
        .bg-blue   { background: #e0f2fe; color: #0284c7; }
        .bg-green  { background: #dcfce7; color: #15803d; }
        .bg-amber  { background: #fef3c7; color: #b45309; }
        .bg-red    { background: #fee2e2; color: #b91c1c; }
        .bg-purple { background: #f3e8ff; color: #7e22ce; }
        .bg-gray   { background: #f1f5f9; color: #475569; }

        /* Empty state */
        .empty-state { text-align: center; padding: 60px 20px; color: #94a3b8; }
        .empty-state i { font-size: 3rem; margin-bottom: 18px; color: #cbd5e1; display: block; }
        .empty-state p { margin-bottom: 20px; font-size: 0.95rem; }

        /* Form styles */
        .form-group { margin-bottom: 20px; }
        .form-label-js { font-size: 0.85rem; font-weight: 600; color: #374151; margin-bottom: 8px; display: block; }
        .form-input {
            width: 100%; padding: 12px 16px; border: 1px solid #cbd5e1;
            border-radius: 10px; font-size: 0.95rem; font-family: 'Inter',sans-serif;
            color: #0f172a; background: #fff; transition: all 0.2s; outline: none;
            box-shadow: 0 1px 2px rgba(0,0,0,0.03) inset;
        }
        .form-input:focus { border-color: #0ea5e9; box-shadow: 0 0 0 3px rgba(14,165,233,0.15); }
        textarea.form-input { min-height: 100px; resize: vertical; }

        /* Buttons */
        .btn-js-primary {
            background: linear-gradient(135deg, #0ea5e9, #3b82f6);
            color: #fff; border: none; border-radius: 10px;
            padding: 12px 24px; font-weight: 600; font-size: 0.9rem;
            cursor: pointer; transition: all 0.2s; font-family: 'Inter',sans-serif;
            display: inline-flex; align-items: center; justify-content: center; gap: 8px;
        }
        .btn-js-primary:hover { transform: translateY(-2px); box-shadow: 0 8px 20px rgba(14,165,233,0.3); }
        .btn-js-outline {
            background: transparent; border: 1.5px solid #cbd5e1;
            color: #475569; border-radius: 10px; padding: 11px 22px;
            font-weight: 600; font-size: 0.9rem; cursor: pointer;
            transition: all 0.2s; font-family: 'Inter',sans-serif;
            display: inline-flex; align-items: center; justify-content: center; gap: 8px;
        }
        .btn-js-outline:hover { border-color: #0ea5e9; color: #0ea5e9; background: #f0f9ff; }

        /* Job Cards */
        .job-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: 20px; }
        .job-card {
            background: #fff; border-radius: 16px; padding: 22px;
            border: 1px solid #e2e8f0; transition: all 0.25s;
            box-shadow: 0 2px 4px rgba(0,0,0,0.02);
            display: flex; flex-direction: column; height: 100%;
        }
        .job-card:hover { transform: translateY(-4px); box-shadow: 0 12px 24px rgba(0,0,0,0.06); border-color: #bae6fd; }
        .job-company-logo {
            width: 52px; height: 52px; border-radius: 12px; background: #f1f5f9;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.5rem; color: #0ea5e9; margin-bottom: 16px;
        }
        .job-title { font-size: 1.05rem; font-weight: 700; color: #0f172a; margin-bottom: 6px; }
        .job-company { font-size: 0.88rem; color: #64748b; margin-bottom: 14px; font-weight: 500; }
        .job-tags { display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 16px; }
        .job-tag { background: #f1f5f9; color: #475569; padding: 4px 10px; border-radius: 6px; font-size: 0.75rem; font-weight: 500; }
        .job-footer { margin-top: auto; padding-top: 16px; border-top: 1px solid #f1f5f9; display: flex; justify-content: space-between; align-items: center; }

        /* Application Timeline Tracker */
        .track-timeline { padding-left: 10px; }
        .track-step { display: flex; gap: 20px; padding-bottom: 28px; position: relative; }
        .track-step:not(:last-child)::before {
            content: ''; position: absolute; left: 19px; top: 40px;
            width: 2px; height: calc(100% - 16px); background: #e2e8f0;
        }
        .track-icon {
            width: 40px; height: 40px; border-radius: 50%; flex-shrink: 0;
            display: flex; align-items: center; justify-content: center;
            font-size: 0.9rem; font-weight: 700; position: relative; z-index: 2;
        }
        .track-done { background: #dcfce7; color: #15803d; }
        .track-active { background: linear-gradient(135deg,#0ea5e9,#3b82f6); color: #fff; box-shadow: 0 4px 12px rgba(14,165,233,0.3); }
        .track-wait { background: #f1f5f9; color: #94a3b8; }
        
        .track-content { padding-top: 8px; }
        .track-title { font-weight: 700; font-size: 0.95rem; color: #0f172a; margin-bottom: 4px; }
        .track-desc { font-size: 0.85rem; color: #64748b; }

        /* Mobile overlay */
        .js-overlay {
            display: none; position: fixed; inset: 0;
            background: rgba(15,23,42,0.6); backdrop-filter: blur(2px); z-index: 190;
        }

        @media (max-width: 1024px) {
            .stat-grid { grid-template-columns: repeat(3, 1fr); }
        }
        @media (max-width: 900px) {
            .js-sidebar { transform: translateX(-100%); }
            .js-sidebar.open { transform: translateX(0); }
            .js-main { margin-left: 0; }
            .js-overlay.open { display: block; }
            .js-hamburger { display: flex; }
            .js-content { padding: 20px; }
            .js-topbar { padding: 14px 20px; }
            .stat-grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 600px) {
            .stat-grid { grid-template-columns: 1fr; }
            .job-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

<!-- Mobile overlay -->
<div class="js-overlay" id="jsOverlay" onclick="closeSidebar()"></div>

<!-- ══ SIDEBAR ══ -->
<aside class="js-sidebar" id="jsSidebar">
    <!-- Brand -->
    <div class="js-brand">
        <div class="js-brand-icon"><i class="fas fa-briefcase"></i></div>
        <div>
            <h5>STD Abroad</h5>
            <span>Careers Portal</span>
        </div>
    </div>

    <!-- User Info -->
    <div class="js-user">
        <div class="js-avatar">
            ${not empty sessionScope.loggedInUser.name ? sessionScope.loggedInUser.name.substring(0,1).toUpperCase() : 'J'}
        </div>
        <div>
            <div class="js-user-name">${not empty sessionScope.loggedInUser.name ? sessionScope.loggedInUser.name : 'Job Seeker'}</div>
            <div class="js-user-role"><i class="fas fa-circle" style="font-size:6px;color:#10b981;vertical-align:middle;margin-right:4px;"></i>Seeking Jobs</div>
        </div>
    </div>

    <!-- Navigation -->
    <nav class="js-nav">

        <!-- Overview -->
        <div class="js-nav-label">Overview</div>
        <button class="js-nav-link active" onclick="showPanel('overview', this)">
            <i class="fas fa-chart-pie"></i> Dashboard
        </button>

        <!-- Profile Management -->
        <div class="js-nav-label">Profile Management</div>
        <button class="js-nav-link" onclick="showPanel('my-profile', this)">
            <i class="fas fa-user-circle"></i> My Profile
        </button>
        <button class="js-nav-link" onclick="showPanel('work-experience', this)">
            <i class="fas fa-history"></i> Work Experience
        </button>
        <button class="js-nav-link" onclick="showPanel('skills-certs', this)">
            <i class="fas fa-certificate"></i> Skills & Certifications
        </button>
        <button class="js-nav-link" onclick="showPanel('resume-manager', this)">
            <i class="fas fa-file-invoice"></i> Resume Manager
        </button>
        <button class="js-nav-link" onclick="showPanel('account-settings', this)">
            <i class="fas fa-sliders-h"></i> Account Settings
        </button>

        <!-- Jobs -->
        <div class="js-nav-label">Jobs</div>
        <button class="js-nav-link" onclick="showPanel('search-jobs', this)">
            <i class="fas fa-search-location"></i> Search Jobs
        </button>
        <button class="js-nav-link" onclick="showPanel('recommended-jobs', this)">
            <i class="fas fa-magic"></i> Recommended Jobs
        </button>
        <button class="js-nav-link" onclick="showPanel('saved-jobs', this)">
            <i class="fas fa-bookmark"></i> Saved Jobs
        </button>

        <!-- Applications -->
        <div class="js-nav-label">Applications</div>
        <button class="js-nav-link" onclick="showPanel('applied-jobs', this)">
            <i class="fas fa-paper-plane"></i> Applied Jobs
            <c:if test="${not empty applications}"><span class="js-badge">${applications.size()}</span></c:if>
        </button>
        <button class="js-nav-link" onclick="showPanel('app-tracking', this)">
            <i class="fas fa-tasks"></i> Application Tracking
        </button>
        <button class="js-nav-link" onclick="showPanel('interview-schedule', this)">
            <i class="fas fa-calendar-check"></i> Interview Schedule
        </button>

        <!-- Career Tools -->
        <div class="js-nav-label">Career Tools</div>
        <button class="js-nav-link" onclick="showPanel('resume-upload', this)">
            <i class="fas fa-upload"></i> Resume Upload
        </button>
        <button class="js-nav-link" onclick="showPanel('resume-builder', this)">
            <i class="fas fa-tools"></i> Resume Builder
        </button>
        <button class="js-nav-link" onclick="showPanel('job-alerts', this)">
            <i class="fas fa-bell-slash"></i> Job Alerts
        </button>

        <!-- Support -->
        <div class="js-nav-label">Support</div>
        <button class="js-nav-link" onclick="showPanel('notifications', this)">
            <i class="fas fa-bell"></i> Notifications
            <span class="js-badge">2</span>
        </button>
        <button class="js-nav-link" onclick="showPanel('help-center', this)">
            <i class="fas fa-question-circle"></i> Help Center
        </button>

    </nav>

    <!-- Footer -->
    <div class="js-sidebar-footer">
        <a href="/logout" style="display:flex;align-items:center;gap:10px;padding:10px 14px;border-radius:10px;color:#f87171;text-decoration:none;font-size:0.88rem;font-weight:600;transition:all 0.2s;"
           onmouseover="this.style.background='rgba(239,68,68,0.1)';this.style.color='#ef4444'" onmouseout="this.style.background='none';this.style.color='#f87171'">
            <i class="fas fa-sign-out-alt"></i> Sign Out
        </a>
    </div>
</aside>

<!-- ══ MAIN ══ -->
<div class="js-main">

    <!-- Top Bar -->
    <div class="js-topbar">
        <div style="display:flex;align-items:center;gap:16px;">
            <button class="js-hamburger" id="hamburgerBtn" onclick="toggleSidebar()">
                <i class="fas fa-bars"></i>
            </button>
            <div>
                <div class="js-topbar-title" id="pageTitle">Dashboard Overview</div>
                <div class="js-topbar-sub" id="pageSub">Welcome to your international career hub</div>
            </div>
        </div>
        <div class="js-topbar-actions">
            <button class="js-action-btn" onclick="showPanel('notifications', document.querySelector('[onclick*=notifications]'))" title="Notifications">
                <i class="fas fa-bell"></i>
                <span class="js-notif-dot"></span>
            </button>
            <button class="js-action-btn" onclick="showPanel('my-profile', document.querySelector('[onclick*=my-profile]'))" title="Settings">
                <i class="fas fa-cog"></i>
            </button>
            <div style="width:42px;height:42px;border-radius:12px;background:linear-gradient(135deg,#0ea5e9,#3b82f6);display:flex;align-items:center;justify-content:center;color:#fff;font-weight:700;font-size:1.1rem;box-shadow:0 2px 8px rgba(14,165,233,0.25);cursor:pointer;" onclick="showPanel('my-profile', document.querySelector('[onclick*=my-profile]'))">
                ${not empty sessionScope.loggedInUser.name ? sessionScope.loggedInUser.name.substring(0,1).toUpperCase() : 'J'}
            </div>
        </div>
    </div>

    <!-- ══ CONTENT PANELS ══ -->
    <div class="js-content">

        <!-- ─── OVERVIEW ─── -->
        <div class="js-panel active" id="panel-overview">
            
            <!-- Stat Cards -->
            <div class="stat-grid">
                <div class="stat-card" style="--sc-color:#0ea5e9;" onclick="showPanel('applied-jobs', document.querySelector('[onclick*=applied-jobs]'))">
                    <div class="stat-header">
                        <div class="stat-icon" style="background:#e0f2fe;color:#0284c7;"><i class="fas fa-paper-plane"></i></div>
                    </div>
                    <div>
                        <div class="stat-num">${not empty applications ? applications.size() : 0}</div>
                        <div class="stat-lbl">Jobs Applied</div>
                    </div>
                </div>
                <div class="stat-card" style="--sc-color:#8b5cf6;" onclick="showPanel('saved-jobs', document.querySelector('[onclick*=saved-jobs]'))">
                    <div class="stat-header">
                        <div class="stat-icon" style="background:#f3e8ff;color:#7e22ce;"><i class="fas fa-bookmark"></i></div>
                    </div>
                    <div>
                        <div class="stat-num">0</div>
                        <div class="stat-lbl">Saved Jobs</div>
                    </div>
                </div>
                <div class="stat-card" style="--sc-color:#10b981;" onclick="showPanel('resume-manager', document.querySelector('[onclick*=resume-manager]'))">
                    <div class="stat-header">
                        <div class="stat-icon" style="background:#dcfce7;color:#15803d;"><i class="fas fa-file-invoice"></i></div>
                        <span class="js-badge-pill bg-green" style="font-size:0.65rem;">Updated</span>
                    </div>
                    <div>
                        <div class="stat-num">100%</div>
                        <div class="stat-lbl">Resume Status</div>
                    </div>
                </div>
                <div class="stat-card" style="--sc-color:#f59e0b;" onclick="showPanel('interview-schedule', document.querySelector('[onclick*=interview-schedule]'))">
                    <div class="stat-header">
                        <div class="stat-icon" style="background:#fef3c7;color:#b45309;"><i class="fas fa-calendar-check"></i></div>
                    </div>
                    <div>
                        <div class="stat-num">0</div>
                        <div class="stat-lbl">Interview Invites</div>
                    </div>
                </div>
                <div class="stat-card" style="--sc-color:#f43f5e;" onclick="showPanel('job-alerts', document.querySelector('[onclick*=job-alerts]'))">
                    <div class="stat-header">
                        <div class="stat-icon" style="background:#ffe4e6;color:#e11d48;"><i class="fas fa-bell"></i></div>
                        <span class="js-badge-pill bg-red" style="font-size:0.65rem;">Active</span>
                    </div>
                    <div>
                        <div class="stat-num">2</div>
                        <div class="stat-lbl">Job Alerts</div>
                    </div>
                </div>
            </div>

            <div style="display:grid;grid-template-columns:2fr 1fr;gap:24px;margin-bottom:24px;">
                <!-- Recent Applications Table -->
                <div class="js-card" style="margin-bottom:0;">
                    <div class="js-card-title">
                        <div><i class="fas fa-history"></i> Recent Applications</div>
                        <button class="btn-js-outline" style="padding:4px 12px;font-size:0.75rem;margin-left:auto;" onclick="showPanel('applied-jobs', document.querySelector('[onclick*=applied-jobs]'))">View All</button>
                    </div>
                    
                    <c:choose>
                        <c:when test="${not empty applications}">
                            <div style="overflow-x:auto;">
                                <table class="js-table">
                                    <thead><tr><th>Job Role</th><th>Company / Location</th><th>Status</th><th>Applied Date</th></tr></thead>
                                    <tbody>
                                        <c:forEach var="app" items="${applications}" end="3">
                                            <tr>
                                                <td style="font-weight:600;color:#0f172a;">${app.job.title}</td>
                                                <td>
                                                    <div style="font-weight:500;">${app.job.provider.organizationName}</div>
                                                    <div style="font-size:0.75rem;color:#64748b;">${app.job.city}, ${app.job.country.name}</div>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${app.status == 'PENDING'}"><span class="js-badge-pill bg-amber">Under Review</span></c:when>
                                                        <c:when test="${app.status == 'SHORTLISTED'}"><span class="js-badge-pill bg-blue">Shortlisted</span></c:when>
                                                        <c:when test="${app.status == 'INTERVIEW_SCHEDULED'}"><span class="js-badge-pill bg-purple">Interview</span></c:when>
                                                        <c:when test="${app.status == 'ACCEPTED' or app.status == 'HIRED'}"><span class="js-badge-pill bg-green">Hired!</span></c:when>
                                                        <c:when test="${app.status == 'REJECTED'}"><span class="js-badge-pill bg-red">Not Selected</span></c:when>
                                                        <c:otherwise><span class="js-badge-pill bg-gray">${app.status}</span></c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td style="color:#64748b;font-size:0.85rem;">${app.appliedAt.toLocalDate()}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state" style="padding:40px 20px;">
                                <i class="fas fa-paper-plane"></i>
                                <p>You haven't applied to any jobs yet.</p>
                                <button class="btn-js-primary" onclick="showPanel('search-jobs', document.querySelector('[onclick*=search-jobs]'))">Browse International Jobs</button>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Profile Strength -->
                <div class="js-card" style="margin-bottom:0;">
                    <div class="js-card-title"><i class="fas fa-tachometer-alt"></i> Profile Strength</div>
                    
                    <div style="text-align:center;padding:20px 0;">
                        <!-- Simple circular progress representation using CSS -->
                        <div style="width:140px;height:140px;border-radius:50%;background:conic-gradient(#0ea5e9 75%, #f1f5f9 0);display:flex;align-items:center;justify-content:center;margin:0 auto 20px;position:relative;">
                            <div style="width:120px;height:120px;border-radius:50%;background:#fff;display:flex;flex-direction:column;align-items:center;justify-content:center;">
                                <span style="font-size:2rem;font-weight:800;color:#0f172a;line-height:1;">75%</span>
                                <span style="font-size:0.75rem;color:#64748b;font-weight:600;">Good</span>
                            </div>
                        </div>
                        
                        <div style="font-weight:600;color:#1e293b;margin-bottom:6px;">Complete your profile</div>
                        <div style="font-size:0.85rem;color:#64748b;margin-bottom:20px;padding:0 10px;">A complete profile increases your chances of getting shortlisted by 80%.</div>
                        
                        <div style="display:flex;flex-direction:column;gap:10px;text-align:left;">
                            <div style="display:flex;align-items:center;gap:10px;font-size:0.85rem;color:#15803d;font-weight:500;">
                                <i class="fas fa-check-circle"></i> Personal Information
                            </div>
                            <div style="display:flex;align-items:center;gap:10px;font-size:0.85rem;color:#15803d;font-weight:500;">
                                <i class="fas fa-check-circle"></i> Resume Uploaded
                            </div>
                            <div style="display:flex;align-items:center;gap:10px;font-size:0.85rem;color:#94a3b8;font-weight:500;cursor:pointer;" onclick="showPanel('work-experience', document.querySelector('[onclick*=work-experience]'))">
                                <i class="far fa-circle"></i> Add Work Experience
                            </div>
                            <div style="display:flex;align-items:center;gap:10px;font-size:0.85rem;color:#94a3b8;font-weight:500;cursor:pointer;" onclick="showPanel('skills-certs', document.querySelector('[onclick*=skills-certs]'))">
                                <i class="far fa-circle"></i> Add Certifications
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recommended Jobs -->
            <div class="js-card">
                <div class="js-card-title">
                    <div><i class="fas fa-magic"></i> Jobs Recommended For You</div>
                    <button class="btn-js-outline" style="padding:4px 12px;font-size:0.75rem;margin-left:auto;" onclick="showPanel('recommended-jobs', document.querySelector('[onclick*=recommended-jobs]'))">View All</button>
                </div>
                
                <div class="job-grid">
                    <c:forEach var="job" items="${jobs}" end="2">
                        <div class="job-card">
                            <div style="display:flex;justify-content:space-between;align-items:flex-start;">
                                <div class="job-company-logo">
                                    ${job.provider.organizationName.substring(0,1).toUpperCase()}
                                </div>
                                <button style="background:none;border:none;color:#cbd5e1;font-size:1.2rem;cursor:pointer;transition:color 0.2s;" onmouseover="this.style.color='#f43f5e'" onmouseout="this.style.color='#cbd5e1'">
                                    <i class="far fa-bookmark"></i>
                                </button>
                            </div>
                            <div class="job-title">${job.title}</div>
                            <div class="job-company">${job.provider.organizationName}</div>
                            <div class="job-tags">
                                <span class="job-tag"><i class="fas fa-map-marker-alt me-1"></i>${job.city}, ${job.country.name}</span>
                                <span class="job-tag"><i class="fas fa-briefcase me-1"></i>${job.jobType}</span>
                                <c:if test="${job.hasVisaSponsorship}"><span class="job-tag" style="background:#e0f2fe;color:#0284c7;"><i class="fas fa-passport me-1"></i>Visa Sponsored</span></c:if>
                            </div>
                            <div class="job-footer">
                                <div style="font-weight:700;color:#0f172a;">${job.currency} ${job.minSalary} - ${job.maxSalary}</div>
                                <a href="/user/jobs/${job.id}" class="btn-js-primary" style="padding:8px 16px;font-size:0.8rem;">View Job</a>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty jobs}">
                        <div class="empty-state" style="grid-column:1/-1;">
                            <i class="fas fa-search-location"></i>
                            <p>No job recommendations right now.</p>
                        </div>
                    </c:if>
                </div>
            </div>
            
        </div>

        <!-- ─── MY PROFILE ─── -->
        <div class="js-panel" id="panel-my-profile">
            <div class="js-card">
                <div class="js-card-title"><i class="fas fa-user-circle"></i> Personal Information</div>
                <div style="display:flex;align-items:center;gap:24px;margin-bottom:30px;padding-bottom:24px;border-bottom:1px solid #f1f5f9;">
                    <div style="width:84px;height:84px;border-radius:50%;background:linear-gradient(135deg,#0ea5e9,#3b82f6);display:flex;align-items:center;justify-content:center;color:#fff;font-size:2.2rem;font-weight:800;box-shadow:0 8px 16px rgba(14,165,233,0.25);">
                        ${not empty sessionScope.loggedInUser.name ? sessionScope.loggedInUser.name.substring(0,1).toUpperCase() : 'J'}
                    </div>
                    <div>
                        <div style="font-size:1.4rem;font-weight:800;color:#0f172a;">${sessionScope.loggedInUser.name}</div>
                        <div style="font-size:0.95rem;color:#64748b;margin-bottom:6px;">${sessionScope.loggedInUser.email}</div>
                        <span class="js-badge-pill bg-green"><i class="fas fa-check-circle me-1"></i>Open to work</span>
                    </div>
                    <button class="btn-js-outline" style="margin-left:auto;"><i class="fas fa-camera me-2"></i>Change Photo</button>
                </div>
                
                <form action="/jobseeker/update-profile" method="POST">
                    <div style="display:grid;grid-template-columns:1fr 1fr;gap:20px;">
                        <div class="form-group">
                            <label class="form-label-js">Full Name</label>
                            <input type="text" name="name" class="form-input" value="${sessionScope.loggedInUser.name}">
                        </div>
                        <div class="form-group">
                            <label class="form-label-js">Email Address</label>
                            <input type="email" class="form-input" value="${sessionScope.loggedInUser.email}" disabled style="background:#f8fafc;color:#94a3b8;cursor:not-allowed;">
                        </div>
                        <div class="form-group">
                            <label class="form-label-js">Phone Number</label>
                            <input type="text" name="phone" class="form-input" value="${sessionScope.loggedInUser.phone}">
                        </div>
                        <div class="form-group">
                            <label class="form-label-js">Preferred Job Country</label>
                            <input type="text" name="preferredCountry" class="form-input" value="${sessionScope.loggedInUser.preferredCountry}" placeholder="e.g. Canada, Germany">
                        </div>
                        <div class="form-group">
                            <label class="form-label-js">Expected Salary (Annual)</label>
                            <input type="text" name="expectedSalary" class="form-input" value="${sessionScope.loggedInUser.expectedSalary}" placeholder="e.g. $80,000 USD">
                        </div>
                        <div class="form-group">
                            <label class="form-label-js">Total Experience</label>
                            <select class="form-input" name="experience">
                                <option value="Fresher" ${sessionScope.loggedInUser.experience == 'Fresher' ? 'selected' : ''}>Fresher (0 years)</option>
                                <option value="1-3 Years" ${sessionScope.loggedInUser.experience == '1-3 Years' ? 'selected' : ''}>1-3 Years</option>
                                <option value="3-5 Years" ${sessionScope.loggedInUser.experience == '3-5 Years' ? 'selected' : ''}>3-5 Years</option>
                                <option value="5-10 Years" ${sessionScope.loggedInUser.experience == '5-10 Years' ? 'selected' : ''}>5-10 Years</option>
                                <option value="10+ Years" ${sessionScope.loggedInUser.experience == '10+ Years' ? 'selected' : ''}>10+ Years</option>
                            </select>
                        </div>
                    </div>
                    <div style="margin-top:20px;text-align:right;">
                        <button type="submit" class="btn-js-primary"><i class="fas fa-save me-2"></i>Save Profile Details</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- ─── WORK EXPERIENCE ─── -->
        <div class="js-panel" id="panel-work-experience">
            <div class="js-card">
                <div class="js-card-title">
                    <div><i class="fas fa-history"></i> Work Experience</div>
                    <button class="btn-js-primary" style="margin-left:auto;padding:6px 14px;font-size:0.8rem;"><i class="fas fa-plus me-1"></i>Add Experience</button>
                </div>
                
                <div class="empty-state">
                    <i class="fas fa-briefcase"></i>
                    <p>Highlight your professional journey to attract international employers.</p>
                    <button class="btn-js-primary"><i class="fas fa-plus me-2"></i>Add Your First Role</button>
                </div>
            </div>
        </div>

        <!-- ─── SKILLS & CERTIFICATIONS ─── -->
        <div class="js-panel" id="panel-skills-certs">
            <div class="js-card">
                <div class="js-card-title"><i class="fas fa-certificate"></i> Skills & Certifications</div>
                <div class="form-group">
                    <label class="form-label-js">Key Professional Skills (Comma separated)</label>
                    <input type="text" class="form-input" value="${sessionScope.loggedInUser.skills}" placeholder="e.g. Java, Project Management, Agile, Communication">
                </div>
                <button class="btn-js-primary"><i class="fas fa-save me-2"></i>Save Skills</button>
                
                <hr style="border-color:#f1f5f9;margin:30px 0;">
                
                <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;">
                    <div style="font-weight:700;color:#1e293b;">Certifications</div>
                    <button class="btn-js-outline" style="padding:6px 14px;font-size:0.8rem;"><i class="fas fa-plus me-1"></i>Add Certification</button>
                </div>
                <div class="empty-state" style="padding:30px 20px;">
                    <p style="margin-bottom:0;">No certifications added yet. Include global certifications (PMP, AWS, IELTS) to stand out.</p>
                </div>
            </div>
        </div>

        <!-- ─── RESUME MANAGER ─── -->
        <div class="js-panel" id="panel-resume-manager">
            <div class="js-card">
                <div class="js-card-title"><i class="fas fa-file-invoice"></i> Resume Manager</div>
                
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:24px;">
                    <!-- Current Resume -->
                    <div style="border:1px solid #e2e8f0;border-radius:12px;padding:24px;text-align:center;">
                        <div style="width:60px;height:60px;border-radius:14px;background:#e0f2fe;color:#0ea5e9;display:flex;align-items:center;justify-content:center;font-size:1.8rem;margin:0 auto 16px;">
                            <i class="fas fa-file-pdf"></i>
                        </div>
                        <div style="font-weight:700;color:#0f172a;margin-bottom:6px;">Current Resume</div>
                        
                        <c:choose>
                            <c:when test="${not empty sessionScope.loggedInUser.resumeUrl}">
                                <div style="font-size:0.85rem;color:#10b981;font-weight:600;margin-bottom:16px;"><i class="fas fa-check-circle me-1"></i>Uploaded successfully</div>
                                <div style="display:flex;gap:10px;justify-content:center;">
                                    <a href="${sessionScope.loggedInUser.resumeUrl}" target="_blank" class="btn-js-primary" style="padding:8px 16px;"><i class="fas fa-eye me-2"></i>View</a>
                                    <button class="btn-js-outline" style="padding:8px 16px;color:#ef4444;border-color:#fca5a5;"><i class="fas fa-trash"></i></button>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div style="font-size:0.85rem;color:#ef4444;font-weight:600;margin-bottom:16px;"><i class="fas fa-exclamation-circle me-1"></i>No resume uploaded</div>
                                <label class="btn-js-primary" style="cursor:pointer;padding:8px 16px;">
                                    <i class="fas fa-upload me-2"></i>Upload Now
                                    <input type="file" style="display:none;" accept=".pdf,.doc,.docx">
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    
                    <!-- Cover Letter -->
                    <div style="border:1px solid #e2e8f0;border-radius:12px;padding:24px;text-align:center;">
                        <div style="width:60px;height:60px;border-radius:14px;background:#f3e8ff;color:#9333ea;display:flex;align-items:center;justify-content:center;font-size:1.8rem;margin:0 auto 16px;">
                            <i class="fas fa-file-signature"></i>
                        </div>
                        <div style="font-weight:700;color:#0f172a;margin-bottom:6px;">Cover Letter</div>
                        <div style="font-size:0.85rem;color:#64748b;margin-bottom:16px;">Create a generic cover letter for quick applications.</div>
                        <button class="btn-js-outline" style="padding:8px 16px;"><i class="fas fa-edit me-2"></i>Write Cover Letter</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- ─── ACCOUNT SETTINGS ─── -->
        <div class="js-panel" id="panel-account-settings">
            <div class="js-card">
                <div class="js-card-title"><i class="fas fa-sliders-h"></i> Account Settings</div>
                <div style="max-width:600px;">
                    <div style="margin-bottom:30px;">
                        <h6 style="font-weight:700;color:#1e293b;margin-bottom:12px;">Change Password</h6>
                        <form action="/user/change-password" method="POST">
                            <div class="form-group"><input type="password" name="currentPassword" class="form-input" placeholder="Current Password"></div>
                            <div class="form-group"><input type="password" name="newPassword" class="form-input" placeholder="New Password"></div>
                            <div class="form-group"><input type="password" name="confirmPassword" class="form-input" placeholder="Confirm New Password"></div>
                            <button type="submit" class="btn-js-primary">Update Password</button>
                        </form>
                    </div>
                    
                    <hr style="border-color:#f1f5f9;margin-bottom:30px;">
                    
                    <div>
                        <h6 style="font-weight:700;color:#ef4444;margin-bottom:12px;">Danger Zone</h6>
                        <p style="font-size:0.85rem;color:#64748b;margin-bottom:16px;">Once you delete your account, there is no going back. Please be certain.</p>
                        <button class="btn-js-outline" style="color:#ef4444;border-color:#fca5a5;" onclick="return confirm('Are you absolutely sure?')">Delete Account</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- ─── SEARCH JOBS ─── -->
        <div class="js-panel" id="panel-search-jobs">
            <div class="js-card" style="background:linear-gradient(135deg, #0f172a, #1e293b);border:none;color:#fff;">
                <h4 style="font-weight:800;margin-bottom:8px;">Find Your Next International Job</h4>
                <p style="color:#94a3b8;font-size:0.95rem;margin-bottom:24px;">Search thousands of jobs with visa sponsorship across the globe.</p>
                
                <div style="display:flex;gap:12px;background:#fff;padding:8px;border-radius:12px;">
                    <div style="flex:1;display:flex;align-items:center;padding:0 14px;border-right:1px solid #e2e8f0;">
                        <i class="fas fa-search" style="color:#94a3b8;font-size:1.1rem;margin-right:12px;"></i>
                        <input type="text" id="jobSearch" placeholder="Job title, keywords, or company" style="width:100%;border:none;outline:none;font-size:0.95rem;font-family:'Inter';padding:10px 0;">
                    </div>
                    <div style="flex:1;display:flex;align-items:center;padding:0 14px;">
                        <i class="fas fa-map-marker-alt" style="color:#94a3b8;font-size:1.1rem;margin-right:12px;"></i>
                        <select id="jobCountryFilter" style="width:100%;border:none;outline:none;font-size:0.95rem;font-family:'Inter';padding:10px 0;color:#64748b;background:transparent;">
                            <option value="">Any Location</option>
                            <c:forEach var="c" items="${countries}">
                                <option value="${c.name}">${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button class="btn-js-primary" style="padding:12px 32px;" onclick="filterJobs()">Find Jobs</button>
                </div>
            </div>
            
            <div style="margin-bottom:16px;display:flex;justify-content:space-between;align-items:center;">
                <h5 style="font-weight:700;color:#1e293b;margin:0;">All International Jobs</h5>
                <div style="font-size:0.85rem;color:#64748b;">Showing ${jobs.size()} jobs</div>
            </div>
            
            <div class="job-grid" id="jobGrid">
                <c:forEach var="job" items="${jobs}">
                    <div class="job-card job-item" data-title="${job.title}" data-company="${job.provider.organizationName}" data-country="${job.country.name}">
                        <div style="display:flex;justify-content:space-between;align-items:flex-start;">
                            <div class="job-company-logo">
                                ${job.provider.organizationName.substring(0,1).toUpperCase()}
                            </div>
                            <button style="background:none;border:none;color:#cbd5e1;font-size:1.2rem;cursor:pointer;"><i class="far fa-bookmark"></i></button>
                        </div>
                        <div class="job-title">${job.title}</div>
                        <div class="job-company">${job.provider.organizationName}</div>
                        <div class="job-tags">
                            <span class="job-tag"><i class="fas fa-map-marker-alt me-1"></i>${job.city}, ${job.country.name}</span>
                            <span class="job-tag"><i class="fas fa-briefcase me-1"></i>${job.jobType}</span>
                            <c:if test="${job.hasVisaSponsorship}"><span class="job-tag" style="background:#e0f2fe;color:#0284c7;"><i class="fas fa-passport me-1"></i>Visa Sponsored</span></c:if>
                        </div>
                        <div class="job-footer">
                            <div style="font-weight:700;color:#0f172a;">${job.currency} ${job.minSalary} - ${job.maxSalary}</div>
                            <a href="/user/jobs/${job.id}" class="btn-js-primary" style="padding:8px 16px;font-size:0.8rem;">Apply Now</a>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty jobs}">
                    <div class="empty-state" style="grid-column:1/-1;">
                        <i class="fas fa-briefcase"></i>
                        <p>No jobs found in the database.</p>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- ─── RECOMMENDED JOBS ─── -->
        <div class="js-panel" id="panel-recommended-jobs">
            <div class="js-card">
                <div class="js-card-title"><i class="fas fa-magic"></i> Recommended Jobs</div>
                <div class="empty-state">
                    <i class="fas fa-magic"></i>
                    <p>Recommendations are generated based on your skills and preferences. <br>Update your profile to get matched!</p>
                    <button class="btn-js-primary" onclick="showPanel('my-profile', document.querySelector('[onclick*=my-profile]'))">Update Profile</button>
                </div>
            </div>
        </div>

        <!-- ─── SAVED JOBS ─── -->
        <div class="js-panel" id="panel-saved-jobs">
            <div class="js-card">
                <div class="js-card-title"><i class="fas fa-bookmark"></i> Saved Jobs</div>
                <div class="empty-state">
                    <i class="far fa-bookmark"></i>
                    <p>You haven't saved any jobs yet.</p>
                    <button class="btn-js-primary" onclick="showPanel('search-jobs', document.querySelector('[onclick*=search-jobs]'))">Explore Jobs</button>
                </div>
            </div>
        </div>

        <!-- ─── APPLIED JOBS ─── -->
        <div class="js-panel" id="panel-applied-jobs">
            <div class="js-card p-0">
                <div style="padding:24px 24px 0;"><div class="js-card-title"><i class="fas fa-paper-plane"></i> Applied Jobs</div></div>
                <div class="table-responsive">
                    <table class="js-table">
                        <thead><tr><th>Job Title</th><th>Company</th><th>Location</th><th>Status</th><th>Applied On</th><th>Action</th></tr></thead>
                        <tbody>
                            <c:forEach var="app" items="${applications}">
                                <tr>
                                    <td style="font-weight:700;color:#0f172a;">${app.job.title}</td>
                                    <td style="font-weight:500;">${app.job.provider.organizationName}</td>
                                    <td style="color:#64748b;">${app.job.city}, ${app.job.country.name}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${app.status == 'PENDING'}"><span class="js-badge-pill bg-amber">Under Review</span></c:when>
                                            <c:when test="${app.status == 'SHORTLISTED'}"><span class="js-badge-pill bg-blue">Shortlisted</span></c:when>
                                            <c:when test="${app.status == 'INTERVIEW_SCHEDULED'}"><span class="js-badge-pill bg-purple">Interview</span></c:when>
                                            <c:when test="${app.status == 'ACCEPTED' or app.status == 'HIRED'}"><span class="js-badge-pill bg-green">Hired!</span></c:when>
                                            <c:when test="${app.status == 'REJECTED'}"><span class="js-badge-pill bg-red">Not Selected</span></c:when>
                                            <c:otherwise><span class="js-badge-pill bg-gray">${app.status}</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="color:#64748b;font-size:0.85rem;">${app.appliedAt.toLocalDate()}</td>
                                    <td>
                                        <button class="btn-js-outline" style="padding:6px 12px;font-size:0.75rem;" onclick="showPanel('app-tracking', document.querySelector('[onclick*=app-tracking]'))">Track</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty applications}">
                                <tr><td colspan="6"><div class="empty-state" style="padding:40px 20px;"><i class="fas fa-inbox"></i><p>No job applications yet.</p></div></td></tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- ─── APPLICATION TRACKING ─── -->
        <div class="js-panel" id="panel-app-tracking">
            <div class="js-card">
                <div class="js-card-title"><i class="fas fa-tasks"></i> Application Tracking Timeline</div>
                
                <c:choose>
                    <c:when test="${not empty applications}">
                        <c:forEach var="app" items="${applications}">
                            <div style="border:1px solid #e2e8f0;border-radius:12px;padding:24px;margin-bottom:20px;">
                                <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:24px;">
                                    <div>
                                        <h5 style="font-weight:800;color:#0f172a;margin-bottom:4px;">${app.job.title}</h5>
                                        <div style="font-size:0.9rem;color:#64748b;font-weight:500;"><i class="fas fa-building me-1"></i>${app.job.provider.organizationName}</div>
                                    </div>
                                    <span class="js-badge-pill bg-gray" style="font-size:0.75rem;">Applied: ${app.appliedAt.toLocalDate()}</span>
                                </div>

                                <div class="track-timeline">
                                    <!-- Step 1 -->
                                    <div class="track-step">
                                        <div class="track-icon track-done"><i class="fas fa-check"></i></div>
                                        <div class="track-content">
                                            <div class="track-title">Application Submitted</div>
                                            <div class="track-desc">Your resume and application were sent to the employer.</div>
                                        </div>
                                    </div>
                                    <!-- Step 2 -->
                                    <div class="track-step">
                                        <div class="track-icon ${app.status != 'PENDING' ? 'track-done' : 'track-active'}">
                                            <c:choose><c:when test="${app.status != 'PENDING'}"><i class="fas fa-check"></i></c:when><c:otherwise><i class="fas fa-spinner fa-spin"></i></c:otherwise></c:choose>
                                        </div>
                                        <div class="track-content">
                                            <div class="track-title">Application Under Review</div>
                                            <div class="track-desc">Employer is currently reviewing your profile.</div>
                                        </div>
                                    </div>
                                    <!-- Step 3 -->
                                    <div class="track-step">
                                        <div class="track-icon ${app.status == 'SHORTLISTED' or app.status == 'INTERVIEW_SCHEDULED' or app.status == 'ACCEPTED' or app.status == 'HIRED' ? 'track-done' : 'track-wait'}">
                                            <i class="fas ${app.status == 'SHORTLISTED' or app.status == 'INTERVIEW_SCHEDULED' or app.status == 'ACCEPTED' or app.status == 'HIRED' ? 'fa-check' : 'fa-list-ol'}"></i>
                                        </div>
                                        <div class="track-content">
                                            <div class="track-title">Shortlisted</div>
                                            <div class="track-desc">You have been shortlisted for the next round.</div>
                                        </div>
                                    </div>
                                    <!-- Step 4 -->
                                    <div class="track-step">
                                        <div class="track-icon ${app.status == 'INTERVIEW_SCHEDULED' or app.status == 'ACCEPTED' or app.status == 'HIRED' ? 'track-done' : 'track-wait'}">
                                            <i class="fas ${app.status == 'INTERVIEW_SCHEDULED' or app.status == 'ACCEPTED' or app.status == 'HIRED' ? 'fa-check' : 'fa-comments'}"></i>
                                        </div>
                                        <div class="track-content">
                                            <div class="track-title">Interview</div>
                                            <div class="track-desc">Interview scheduled with the hiring manager.</div>
                                        </div>
                                    </div>
                                    <!-- Step 5 -->
                                    <div class="track-step" style="padding-bottom:0;">
                                        <div class="track-icon ${app.status == 'ACCEPTED' or app.status == 'HIRED' ? 'track-done' : (app.status == 'REJECTED' ? 'track-wait' : 'track-wait')}">
                                            <i class="fas ${app.status == 'ACCEPTED' or app.status == 'HIRED' ? 'fa-check' : (app.status == 'REJECTED' ? 'fa-times' : 'fa-flag-checkered')}"></i>
                                        </div>
                                        <div class="track-content">
                                            <div class="track-title">Final Decision</div>
                                            <div class="track-desc">
                                                <c:choose>
                                                    <c:when test="${app.status == 'ACCEPTED' or app.status == 'HIRED'}"><span style="color:#15803d;font-weight:700;">Congratulations! You're Hired.</span></c:when>
                                                    <c:when test="${app.status == 'REJECTED'}"><span style="color:#ef4444;font-weight:700;">Not selected this time.</span></c:when>
                                                    <c:otherwise>Awaiting final results.</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <i class="fas fa-tasks"></i>
                            <p>Apply for jobs to start tracking your application progress here.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- ─── INTERVIEW SCHEDULE ─── -->
        <div class="js-panel" id="panel-interview-schedule">
            <div class="js-card">
                <div class="js-card-title"><i class="fas fa-calendar-check"></i> Interview Schedule</div>
                <div class="empty-state">
                    <i class="far fa-calendar-alt"></i>
                    <p>No upcoming interviews scheduled.</p>
                </div>
            </div>
        </div>

        <!-- ─── RESUME UPLOAD ─── -->
        <div class="js-panel" id="panel-resume-upload">
            <div class="js-card">
                <div class="js-card-title"><i class="fas fa-upload"></i> Resume Upload</div>
                <div style="border:2px dashed #cbd5e1;border-radius:16px;padding:60px 20px;text-align:center;background:#f8fafc;">
                    <i class="fas fa-cloud-upload-alt" style="font-size:3rem;color:#0ea5e9;margin-bottom:16px;"></i>
                    <h5 style="font-weight:700;color:#1e293b;margin-bottom:8px;">Drag & Drop your resume here</h5>
                    <p style="font-size:0.9rem;color:#64748b;margin-bottom:24px;">Supported formats: PDF, DOC, DOCX. Max size: 5MB</p>
                    <button class="btn-js-primary"><i class="fas fa-folder-open me-2"></i>Browse Files</button>
                </div>
            </div>
        </div>

        <!-- ─── RESUME BUILDER ─── -->
        <div class="js-panel" id="panel-resume-builder">
            <div class="js-card" style="text-align:center;padding:60px 20px;">
                <div style="width:80px;height:80px;border-radius:20px;background:linear-gradient(135deg,#0ea5e9,#3b82f6);color:#fff;display:flex;align-items:center;justify-content:center;font-size:2.5rem;margin:0 auto 20px;box-shadow:0 10px 25px rgba(14,165,233,0.3);">
                    <i class="fas fa-tools"></i>
                </div>
                <h4 style="font-weight:800;color:#0f172a;margin-bottom:12px;">Smart Resume Builder</h4>
                <p style="font-size:1rem;color:#64748b;max-width:500px;margin:0 auto 30px;">Create an ATS-friendly international resume in minutes based on your profile data.</p>
                <button class="btn-js-primary" style="padding:14px 30px;font-size:1rem;"><i class="fas fa-magic me-2"></i>Generate My Resume</button>
            </div>
        </div>

        <!-- ─── JOB ALERTS ─── -->
        <div class="js-panel" id="panel-job-alerts">
            <div class="js-card">
                <div class="js-card-title">
                    <div><i class="fas fa-bell"></i> Manage Job Alerts</div>
                    <button class="btn-js-primary" style="margin-left:auto;padding:6px 14px;font-size:0.8rem;"><i class="fas fa-plus me-1"></i>Create Alert</button>
                </div>
                
                <div style="border:1px solid #e2e8f0;border-radius:12px;padding:20px;display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;">
                    <div>
                        <div style="font-weight:700;color:#0f172a;font-size:1.05rem;">Software Engineer Jobs in Canada</div>
                        <div style="font-size:0.85rem;color:#64748b;margin-top:4px;">Frequency: Daily via Email</div>
                    </div>
                    <div style="display:flex;align-items:center;gap:16px;">
                        <span style="font-weight:600;font-size:0.85rem;color:#10b981;">Active</span>
                        <button class="btn-js-outline" style="padding:6px 12px;color:#ef4444;border-color:#fca5a5;"><i class="fas fa-trash"></i></button>
                    </div>
                </div>
                
                <div style="border:1px solid #e2e8f0;border-radius:12px;padding:20px;display:flex;justify-content:space-between;align-items:center;">
                    <div>
                        <div style="font-weight:700;color:#0f172a;font-size:1.05rem;">Remote IT Jobs</div>
                        <div style="font-size:0.85rem;color:#64748b;margin-top:4px;">Frequency: Weekly via Email</div>
                    </div>
                    <div style="display:flex;align-items:center;gap:16px;">
                        <span style="font-weight:600;font-size:0.85rem;color:#10b981;">Active</span>
                        <button class="btn-js-outline" style="padding:6px 12px;color:#ef4444;border-color:#fca5a5;"><i class="fas fa-trash"></i></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- ─── NOTIFICATIONS ─── -->
        <div class="js-panel" id="panel-notifications">
            <div class="js-card">
                <div class="js-card-title"><i class="fas fa-bell"></i> Notifications</div>
                <div style="display:flex;flex-direction:column;gap:16px;">
                    <div style="display:flex;gap:16px;padding:16px;background:#f0f9ff;border-radius:12px;border:1px solid #bae6fd;">
                        <div style="width:40px;height:40px;border-radius:10px;background:#0ea5e9;color:#fff;display:flex;align-items:center;justify-content:center;font-size:1.1rem;flex-shrink:0;">
                            <i class="fas fa-briefcase"></i>
                        </div>
                        <div>
                            <div style="font-weight:700;color:#0f172a;">New Job Matches Found</div>
                            <div style="font-size:0.85rem;color:#475569;margin-top:4px;">We found 5 new jobs matching your profile in Germany.</div>
                            <div style="font-size:0.75rem;color:#94a3b8;margin-top:6px;"><i class="fas fa-clock me-1"></i>2 hours ago</div>
                        </div>
                        <span style="width:8px;height:8px;border-radius:50%;background:#ef4444;margin-left:auto;margin-top:6px;"></span>
                    </div>
                    
                    <div style="display:flex;gap:16px;padding:16px;background:#f8fafc;border-radius:12px;border:1px solid #e2e8f0;">
                        <div style="width:40px;height:40px;border-radius:10px;background:#64748b;color:#fff;display:flex;align-items:center;justify-content:center;font-size:1.1rem;flex-shrink:0;">
                            <i class="fas fa-user-check"></i>
                        </div>
                        <div>
                            <div style="font-weight:700;color:#0f172a;">Welcome to STD Abroad</div>
                            <div style="font-size:0.85rem;color:#475569;margin-top:4px;">Your job seeker account is active. Complete your profile to get discovered by international employers!</div>
                            <div style="font-size:0.75rem;color:#94a3b8;margin-top:6px;"><i class="fas fa-clock me-1"></i>Yesterday</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ─── HELP CENTER ─── -->
        <div class="js-panel" id="panel-help-center">
            <div class="js-card">
                <div class="js-card-title"><i class="fas fa-question-circle"></i> Help Center</div>
                
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:20px;margin-bottom:30px;">
                    <c:forEach var="faq" items="${[
                        'How do I apply for visa-sponsored jobs?',
                        'How does the application tracking work?',
                        'What should I include in my international resume?',
                        'How to handle international interviews?',
                        'How do job alerts work?',
                        'Is my data shared with all employers?'
                    ]}">
                        <div style="padding:18px;border:1px solid #e2e8f0;border-radius:12px;cursor:pointer;transition:all 0.2s;"
                             onmouseover="this.style.borderColor='#0ea5e9';this.style.boxShadow='0 4px 12px rgba(14,165,233,0.1)'"
                             onmouseout="this.style.borderColor='#e2e8f0';this.style.boxShadow='none'">
                            <div style="display:flex;align-items:center;gap:12px;">
                                <div style="width:32px;height:32px;border-radius:8px;background:#f1f5f9;color:#0ea5e9;display:flex;align-items:center;justify-content:center;"><i class="fas fa-lightbulb"></i></div>
                                <div style="font-weight:600;font-size:0.9rem;color:#1e293b;">${faq}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                <div style="background:linear-gradient(135deg,#0ea5e9,#3b82f6);border-radius:16px;padding:30px;color:#fff;text-align:center;">
                    <h5 style="font-weight:800;margin-bottom:10px;">Still need assistance?</h5>
                    <p style="opacity:0.9;margin-bottom:20px;">Our career advisors are here to help you navigate international job opportunities.</p>
                    <button class="btn-js-primary" style="background:#fff;color:#0ea5e9;padding:12px 30px;"><i class="fas fa-headset me-2"></i>Contact Support</button>
                </div>
            </div>
        </div>

    </div><!-- end js-content -->
</div><!-- end js-main -->

<script>
    const pageMeta = {
        'overview':             ['Dashboard Overview',      'Welcome to your international career hub'],
        'my-profile':           ['My Profile',              'Manage your personal details'],
        'work-experience':      ['Work Experience',         'Add your professional history'],
        'skills-certs':         ['Skills & Certifications', 'Highlight your key skills'],
        'resume-manager':       ['Resume Manager',          'Manage your CVs and cover letters'],
        'account-settings':     ['Account Settings',        'Security and preferences'],
        'search-jobs':          ['Search Jobs',             'Find visa-sponsored jobs globally'],
        'recommended-jobs':     ['Recommended Jobs',        'Jobs tailored to your profile'],
        'saved-jobs':           ['Saved Jobs',              'Jobs you have bookmarked'],
        'applied-jobs':         ['Applied Jobs',            'Jobs you have applied for'],
        'app-tracking':         ['Application Tracking',    'Monitor your job applications'],
        'interview-schedule':   ['Interview Schedule',      'Your upcoming interviews'],
        'resume-upload':        ['Resume Upload',           'Upload a new resume'],
        'resume-builder':       ['Resume Builder',          'Create an ATS friendly resume'],
        'job-alerts':           ['Job Alerts',              'Manage your email job alerts'],
        'notifications':        ['Notifications',           'Recent activities and updates'],
        'help-center':          ['Help Center',             'FAQs and support']
    };

    function showPanel(id, btn) {
        document.querySelectorAll('.js-panel').forEach(p => p.classList.remove('active'));
        document.querySelectorAll('.js-nav-link').forEach(l => l.classList.remove('active'));
        
        const panel = document.getElementById('panel-' + id);
        if (panel) panel.classList.add('active');
        if (btn) btn.classList.add('active');
        
        if (pageMeta[id]) {
            document.getElementById('pageTitle').textContent = pageMeta[id][0];
            document.getElementById('pageSub').textContent = pageMeta[id][1];
        }
        
        if (window.innerWidth <= 900) closeSidebar();
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    function toggleSidebar() {
        document.getElementById('jsSidebar').classList.toggle('open');
        document.getElementById('jsOverlay').classList.toggle('open');
    }
    function closeSidebar() {
        document.getElementById('jsSidebar').classList.remove('open');
        document.getElementById('jsOverlay').classList.remove('open');
    }

    function filterJobs() {
        const q = document.getElementById('jobSearch').value.toLowerCase();
        const c = document.getElementById('jobCountryFilter').value.toLowerCase();
        
        document.querySelectorAll('.job-item').forEach(card => {
            const title = (card.dataset.title || '').toLowerCase();
            const company = (card.dataset.company || '').toLowerCase();
            const country = (card.dataset.country || '').toLowerCase();
            
            const matchesQ = !q || title.includes(q) || company.includes(q);
            const matchesC = !c || country.includes(c);
            
            card.style.display = matchesQ && matchesC ? '' : 'none';
        });
    }
</script>

</body>
</html>
