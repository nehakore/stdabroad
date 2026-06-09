<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Job Provider Portal" />
</jsp:include>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>
    * { box-sizing: border-box; }
    body {
        font-family: 'Inter', sans-serif;
        background: #f1f5f9;
        margin: 0;
        padding-top: 0 !important;
        overflow-x: hidden;
    }
    .jp-wrapper {
        display: flex;
        min-height: 100vh;
    }

    /* ── Sidebar ── */
    .jp-sidebar {
        width: 270px;
        background: linear-gradient(180deg, #0f172a 0%, #1e293b 100%);
        color: #fff;
        display: flex;
        flex-direction: column;
        flex-shrink: 0;
        position: fixed;
        height: 100vh;
        z-index: 100;
        overflow-y: auto;
        scrollbar-width: thin;
        scrollbar-color: rgba(255,255,255,0.1) transparent;
    }
    .jp-sidebar::-webkit-scrollbar { width: 4px; }
    .jp-sidebar::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.15); border-radius: 4px; }

    .jp-sidebar-header {
        padding: 22px 20px;
        border-bottom: 1px solid rgba(255,255,255,0.08);
        background: rgba(0,0,0,0.2);
    }
    .jp-sidebar-header h5 {
        margin: 0;
        font-size: 1.1rem;
        font-weight: 700;
        color: #fff;
        letter-spacing: -0.3px;
    }
    .jp-sidebar-header .brand-tag {
        font-size: 0.7rem;
        color: #64748b;
        font-weight: 500;
        text-transform: uppercase;
        letter-spacing: 1px;
        margin-top: 2px;
    }

    .jp-provider-info {
        padding: 16px 20px;
        border-bottom: 1px solid rgba(255,255,255,0.06);
        display: flex;
        align-items: center;
        gap: 12px;
    }
    .jp-provider-avatar {
        width: 44px; height: 44px;
        border-radius: 12px;
        background: linear-gradient(135deg, #3b82f6, #8b5cf6);
        display: flex; align-items: center; justify-content: center;
        font-size: 1.3rem; font-weight: 700; color: #fff; flex-shrink: 0;
    }
    .jp-provider-name { font-size: 0.88rem; font-weight: 600; color: #e2e8f0; }
    .jp-provider-type { font-size: 0.72rem; color: #64748b; margin-top: 2px; }

    .jp-nav { padding: 16px 12px; flex: 1; }

    .jp-nav-label {
        font-size: 0.65rem;
        font-weight: 700;
        color: #475569;
        text-transform: uppercase;
        letter-spacing: 1.2px;
        padding: 10px 10px 6px;
        margin-top: 8px;
    }

    .jp-nav-link {
        display: flex;
        align-items: center;
        padding: 10px 14px;
        border-radius: 10px;
        color: #94a3b8;
        text-decoration: none;
        font-size: 0.88rem;
        font-weight: 500;
        transition: all 0.2s;
        margin-bottom: 2px;
        gap: 11px;
    }
    .jp-nav-link i { width: 18px; text-align: center; font-size: 0.95rem; flex-shrink: 0; }
    .jp-nav-link:hover { background: rgba(255,255,255,0.06); color: #e2e8f0; }
    .jp-nav-link.active {
        background: linear-gradient(135deg, #3b82f6, #6366f1);
        color: #fff;
        box-shadow: 0 4px 14px rgba(59,130,246,0.35);
    }
    .jp-nav-link .badge-dot {
        margin-left: auto;
        width: 7px; height: 7px;
        background: #22c55e;
        border-radius: 50%;
        flex-shrink: 0;
    }

    .jp-sidebar-footer {
        padding: 16px 12px;
        border-top: 1px solid rgba(255,255,255,0.06);
    }

    /* ── Main Content ── */
    .jp-main {
        flex-grow: 1;
        margin-left: 270px;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    /* ── Top Bar ── */
    .jp-topbar {
        background: #fff;
        padding: 16px 32px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        border-bottom: 1px solid #e2e8f0;
        position: sticky; top: 0; z-index: 50;
        box-shadow: 0 1px 3px rgba(0,0,0,0.05);
    }
    .jp-topbar h4 { margin: 0; font-size: 1.15rem; font-weight: 700; color: #0f172a; }
    .jp-topbar p { margin: 0; font-size: 0.8rem; color: #94a3b8; }

    /* ── Content Area ── */
    .jp-content { padding: 28px 32px; flex: 1; }

    /* ── Cards ── */
    .jp-card {
        background: #fff;
        border-radius: 16px;
        padding: 24px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.04), 0 4px 16px rgba(0,0,0,0.04);
        border: 1px solid #f1f5f9;
    }

    /* ── Stat Cards ── */
    .stat-card {
        background: #fff;
        border-radius: 16px;
        padding: 22px 24px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.04), 0 4px 16px rgba(0,0,0,0.04);
        border: 1px solid #f1f5f9;
        display: flex; align-items: center; gap: 18px;
        transition: transform 0.2s, box-shadow 0.2s;
    }
    .stat-card:hover { transform: translateY(-3px); box-shadow: 0 8px 28px rgba(0,0,0,0.08); }
    .stat-icon {
        width: 56px; height: 56px;
        border-radius: 14px;
        display: flex; align-items: center; justify-content: center;
        font-size: 1.4rem; flex-shrink: 0;
    }
    .stat-number { font-size: 1.8rem; font-weight: 800; color: #0f172a; line-height: 1; }
    .stat-label { font-size: 0.8rem; color: #64748b; font-weight: 500; margin-top: 4px; }

    /* ── Tables ── */
    .jp-table th {
        font-weight: 600; font-size: 0.75rem; color: #64748b;
        text-transform: uppercase; letter-spacing: 0.6px;
        border-bottom: 2px solid #f1f5f9; padding: 10px 16px;
        background: #f8fafc;
    }
    .jp-table td { padding: 14px 16px; vertical-align: middle; font-size: 0.9rem; color: #334155; border-bottom: 1px solid #f1f5f9; }
    .jp-table tr:last-child td { border-bottom: none; }
    .jp-table tr:hover td { background: #f8fafc; }

    /* ── Badges ── */
    .jp-badge {
        display: inline-flex; align-items: center;
        padding: 4px 12px; border-radius: 50px; font-size: 0.75rem; font-weight: 600;
    }
    .jp-badge-success { background: #dcfce7; color: #15803d; }
    .jp-badge-warning { background: #fef9c3; color: #a16207; }
    .jp-badge-danger  { background: #fee2e2; color: #b91c1c; }
    .jp-badge-info    { background: #dbeafe; color: #1d4ed8; }
    .jp-badge-gray    { background: #f1f5f9; color: #475569; }
    .jp-badge-purple  { background: #ede9fe; color: #6d28d9; }

    /* ── Forms ── */
    .jp-form-section {
        background: #f8fafc;
        border-radius: 12px;
        padding: 22px;
        margin-bottom: 20px;
        border: 1px solid #e2e8f0;
    }
    .jp-form-section-title {
        font-size: 0.85rem; font-weight: 700; color: #3b82f6;
        text-transform: uppercase; letter-spacing: 0.8px;
        margin-bottom: 16px; padding-bottom: 10px;
        border-bottom: 2px solid #dbeafe;
        display: flex; align-items: center; gap: 8px;
    }
    .form-control, .form-select {
        border-radius: 9px; border: 1px solid #e2e8f0;
        padding: 10px 14px; font-size: 0.9rem;
        background: #fff; transition: all 0.2s;
    }
    .form-control:focus, .form-select:focus {
        border-color: #3b82f6; box-shadow: 0 0 0 3px rgba(59,130,246,0.15); outline: none;
    }
    .form-label { font-weight: 600; font-size: 0.85rem; color: #374151; margin-bottom: 5px; }

    /* ── Buttons ── */
    .btn-jp-primary {
        background: linear-gradient(135deg, #3b82f6, #6366f1);
        color: #fff; border: none; border-radius: 10px;
        padding: 10px 22px; font-weight: 600; font-size: 0.9rem;
        transition: all 0.2s; cursor: pointer;
    }
    .btn-jp-primary:hover { transform: translateY(-1px); box-shadow: 0 6px 20px rgba(59,130,246,0.3); color: #fff; }
    .btn-jp-outline {
        background: transparent; border: 1.5px solid #e2e8f0;
        color: #475569; border-radius: 10px; padding: 9px 18px;
        font-weight: 600; font-size: 0.9rem; transition: all 0.2s;
    }
    .btn-jp-outline:hover { border-color: #3b82f6; color: #3b82f6; }

    .success-toast {
        background: linear-gradient(135deg, #10b981, #059669);
        color: #fff; border-radius: 12px; padding: 16px 22px;
        margin-bottom: 20px; display: flex; align-items: center; gap: 12px;
        animation: slideDown 0.4s ease;
    }
    @keyframes slideDown { from { opacity:0; transform: translateY(-12px); } to { opacity:1; transform: translateY(0); } }

    @media (max-width: 768px) {
        .jp-sidebar { transform: translateX(-100%); }
        .jp-main { margin-left: 0; }
        .jp-content { padding: 16px; }
        .jp-topbar { padding: 12px 16px; }
    }
</style>

<div class="jp-wrapper">
    <!-- ── Sidebar ── -->
    <aside class="jp-sidebar">
        <div class="jp-sidebar-header">
            <h5><i class="fas fa-briefcase text-blue-400 me-2" style="color:#60a5fa;"></i> Job Provider</h5>
            <div class="brand-tag">Recruitment Portal</div>
        </div>

        <div class="jp-provider-info">
            <div class="jp-provider-avatar">
                ${not empty provider ? provider.organizationName.substring(0,1).toUpperCase() : 'P'}
            </div>
            <div>
                <div class="jp-provider-name">${not empty provider ? provider.organizationName : 'Provider'}</div>
                <div class="jp-provider-type"><i class="fas fa-circle" style="font-size:6px; color:#22c55e;"></i> Active Account</div>
            </div>
        </div>

        <nav class="jp-nav">
            <div class="jp-nav-label">Overview</div>
            <a href="/jobprovider/dashboard" class="jp-nav-link ${activeMenu == 'dashboard' ? 'active' : ''}">
                <i class="fas fa-chart-line"></i> Dashboard
            </a>

            <div class="jp-nav-label">Job Management</div>
            <a href="/jobprovider/post-job" class="jp-nav-link ${activeMenu == 'post-job' ? 'active' : ''}">
                <i class="fas fa-plus-circle"></i> Post New Job
            </a>
            <a href="/jobprovider/my-jobs" class="jp-nav-link ${activeMenu == 'my-jobs' ? 'active' : ''}">
                <i class="fas fa-list-ul"></i> My Jobs
            </a>

            <div class="jp-nav-label">Recruitment</div>
            <a href="/jobprovider/applications" class="jp-nav-link ${activeMenu == 'applications' ? 'active' : ''}">
                <i class="fas fa-file-alt"></i> Job Applications
            </a>

            <div class="jp-nav-label">Account</div>
            <a href="/jobprovider/profile" class="jp-nav-link ${activeMenu == 'profile' ? 'active' : ''}">
                <i class="fas fa-user-cog"></i> Profile Settings
            </a>
        </nav>

        <div class="jp-sidebar-footer">
            <a href="/jobprovider/logout" class="btn btn-outline-danger w-100 rounded-pill" style="font-size:0.85rem;">
                <i class="fas fa-sign-out-alt me-2"></i> Sign Out
            </a>
        </div>
    </aside>

    <!-- ── Main Content ── -->
    <div class="jp-main">
        <!-- Top Bar -->
        <div class="jp-topbar">
            <div>
                <h4 id="jp-page-title">Job Provider Portal</h4>
                <p id="jp-page-sub">Manage your overseas job listings and recruitment pipeline</p>
            </div>
            <div class="d-flex align-items-center gap-2">
                <a href="/jobprovider/post-job" class="btn-jp-primary btn d-none d-md-inline-flex" style="font-size:0.85rem; padding:8px 18px;">
                    <i class="fas fa-plus me-2"></i> Post New Job
                </a>
                <span class="badge rounded-pill" style="background:#f1f5f9; color:#475569; padding:8px 14px; font-size:0.8rem;">
                    <i class="fas fa-building me-1"></i> ${not empty provider ? provider.organizationName : ''}
                </span>
            </div>
        </div>

        <!-- Page Content -->
        <div class="jp-content">
