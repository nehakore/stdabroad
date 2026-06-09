<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Admin Portal - Study & Jobs Abroad" />
</jsp:include>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Inter', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding-top: 0 !important;
        overflow-x: hidden;
    }
    
    /* Layout */
    .dashboard-wrapper {
        display: flex;
        min-height: 100vh;
    }
    
    /* Neat Full-height Sidebar */
    .admin-sidebar {
        width: 280px;
        background: #111827;
        color: #fff;
        display: flex;
        flex-direction: column;
        flex-shrink: 0;
        position: fixed;
        height: 100vh;
        z-index: 100;
        overflow-y: auto;
    }
    
    .sidebar-header {
        padding: 24px 20px;
        border-bottom: 1px solid rgba(255,255,255,0.1);
    }
    
    .admin-sidebar .nav-pills {
        padding: 20px 10px;
    }
    
    .admin-sidebar .nav-link {
        color: #9ca3af;
        border-radius: 8px;
        padding: 12px 20px;
        margin-bottom: 8px;
        font-weight: 500;
        transition: all 0.3s;
        display: flex;
        align-items: center;
        text-decoration: none;
    }
    
    .admin-sidebar .nav-link i {
        width: 24px;
        font-size: 1.1rem;
        margin-right: 10px;
        text-align: center;
    }
    
    .admin-sidebar .nav-link:hover {
        background: rgba(255,255,255,0.05);
        color: #fff;
    }
    
    .admin-sidebar .nav-link.active {
        background: #3b82f6;
        color: #fff;
        box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
    }
    
    .sidebar-footer {
        margin-top: auto;
        padding: 20px;
        border-top: 1px solid rgba(255,255,255,0.1);
    }
    
    /* Main Content Area */
    .main-content {
        flex-grow: 1;
        margin-left: 280px;
        padding: 40px;
        width: calc(100% - 280px);
    }
    
    .content-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }
    
    .dashboard-card {
        background: #fff;
        border-radius: 16px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.03);
        border: none;
        padding: 24px;
    }
    
    .table th {
        font-weight: 600;
        color: #4b5563;
        border-bottom-width: 2px;
        text-transform: uppercase;
        font-size: 0.8rem;
        letter-spacing: 0.5px;
    }
    
    .table td {
        vertical-align: middle;
        color: #374151;
        font-size: 0.95rem;
    }
</style>

<div class="dashboard-wrapper">
    
    <!-- Neat Sidebar -->
    <aside class="admin-sidebar shadow-lg">
        <div class="sidebar-header">
            <h4 class="fw-bolder m-0 text-white"><i class="fas fa-shield-alt text-primary me-2"></i> Admin Portal</h4>
        </div>
        
        <div class="nav flex-column nav-pills" role="tablist">
            <div class="text-uppercase small text-muted px-3 mb-2 mt-2 fw-bold">Approvals</div>
            <a href="/admin/pending-providers" class="nav-link ${activeMenu == 'pending-providers' ? 'active' : ''}"><i class="fas fa-clock"></i> Pending Providers</a>
            <a href="/admin/approved-providers" class="nav-link ${activeMenu == 'approved-providers' ? 'active' : ''}"><i class="fas fa-check-double"></i> Approved Providers</a>
            
            <div class="text-uppercase small text-muted px-3 mb-2 mt-4 fw-bold">Listings</div>
            <a href="/admin/pending-jobs" class="nav-link ${activeMenu == 'pending-jobs' ? 'active' : ''}"><i class="fas fa-briefcase"></i> Pending Jobs</a>
            <a href="/admin/pending-universities" class="nav-link ${activeMenu == 'pending-universities' ? 'active' : ''}"><i class="fas fa-university"></i> Pending Universities</a>
            <a href="/admin/manage-jobs" class="nav-link ${activeMenu == 'manage-jobs' ? 'active' : ''}"><i class="fas fa-list-alt"></i> Manage Jobs</a>
            <a href="/admin/manage-universities" class="nav-link ${activeMenu == 'manage-universities' ? 'active' : ''}"><i class="fas fa-graduation-cap"></i> Manage Universities</a>
            
            <div class="text-uppercase small text-muted px-3 mb-2 mt-4 fw-bold">Management</div>
            <a href="/admin/manage-users" class="nav-link ${activeMenu == 'manage-users' ? 'active' : ''}"><i class="fas fa-users"></i> Manage Users</a>
            <a href="/admin/manage-countries" class="nav-link ${activeMenu == 'manage-countries' ? 'active' : ''}"><i class="fas fa-globe-americas"></i> Manage Countries</a>
            <a href="/admin/manage-scholarships" class="nav-link ${activeMenu == 'manage-scholarships' ? 'active' : ''}"><i class="fas fa-award"></i> Scholarships</a>
            <a href="/admin/manage-visa-guides" class="nav-link ${activeMenu == 'manage-visa-guides' ? 'active' : ''}"><i class="fas fa-passport"></i> Visa Guides</a>
            <a href="/admin/enquiries" class="nav-link ${activeMenu == 'enquiries' ? 'active' : ''}"><i class="fas fa-headset"></i> User Enquiries</a>
        </div>
        
        <div class="sidebar-footer">
            <a href="/logout" class="btn btn-outline-danger w-100 rounded-pill"><i class="fas fa-sign-out-alt me-2"></i> Logout System</a>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <div class="content-header" data-aos="fade-down">
            <div>
                <h2 class="fw-bold text-dark m-0">Platform Overview</h2>
                <p class="text-muted m-0">Review pending applications and manage platform data.</p>
            </div>
            <div class="d-flex align-items-center gap-3">
                <span class="badge bg-primary px-3 py-2 rounded-pill fs-6 shadow-sm"><i class="fas fa-user-shield me-2"></i> Super Admin</span>
            </div>
        </div>
        
        <div data-aos="fade-up">
