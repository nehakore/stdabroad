<%@ tag pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Provider Dashboard" />
</jsp:include>

<style>
    body {
        background-color: #f8f9fa;
        overflow-x: hidden;
        padding-top: 0 !important;
    }
    #sidebar-wrapper {
        min-height: 100vh;
        margin-left: -15rem;
        transition: margin 0.25s ease-out;
        background-color: #1E3A8A; /* Primary Blue */
        width: 15rem;
        position: fixed;
        z-index: 1000;
    }
    #sidebar-wrapper .sidebar-heading {
        padding: 1.5rem 1.25rem;
        font-size: 1.2rem;
        color: white;
        font-weight: bold;
        border-bottom: 1px solid rgba(255,255,255,0.1);
    }
    #sidebar-wrapper .list-group {
        width: 15rem;
    }
    #sidebar-wrapper .list-group-item {
        background-color: transparent;
        color: rgba(255,255,255,0.8);
        border: none;
        padding: 1rem 1.25rem;
        transition: all 0.2s;
    }
    #sidebar-wrapper .list-group-item:hover, #sidebar-wrapper .list-group-item.active {
        color: white;
        background-color: rgba(255,255,255,0.1);
        border-left: 4px solid #38BDF8; /* Sky Blue Accent */
    }
    #page-content-wrapper {
        min-width: 100vw;
        transition: margin 0.25s ease-out;
        margin-left: 0;
    }
    #wrapper.toggled #sidebar-wrapper {
        margin-left: 0;
    }
    
    @media (min-width: 768px) {
        #sidebar-wrapper {
            margin-left: 0;
        }
        #page-content-wrapper {
            min-width: 0;
            width: 100%;
            margin-left: 15rem;
        }
        #wrapper.toggled #sidebar-wrapper {
            margin-left: -15rem;
        }
        #wrapper.toggled #page-content-wrapper {
            margin-left: 0;
        }
    }
    
    /* Top Navbar inside content wrapper */
    .dashboard-nav {
        background: white;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        padding: 1rem 1.5rem;
    }
</style>

<div class="d-flex" id="wrapper">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <div class="sidebar-heading">
            <i class="fas fa-globe-americas me-2 text-info"></i> Study&Jobs
        </div>
        <div class="list-group list-group-flush mt-3">
            <a href="/provider/dashboard" class="list-group-item list-group-item-action ${activePage == 'dashboard' ? 'active' : ''}">
                <i class="fas fa-tachometer-alt me-2 width-20"></i> Dashboard
            </a>
            <a href="/provider/universities/add" class="list-group-item list-group-item-action ${activePage == 'add-university' ? 'active' : ''}">
                <i class="fas fa-plus-circle me-2 width-20"></i> Add University
            </a>
            <a href="/provider/universities" class="list-group-item list-group-item-action ${activePage == 'my-universities' ? 'active' : ''}">
                <i class="fas fa-university me-2 width-20"></i> My Universities
            </a>
            <a href="/provider/scholarships" class="list-group-item list-group-item-action ${activePage == 'scholarships' ? 'active' : ''}">
                <i class="fas fa-award me-2 width-20"></i> Scholarships
            </a>
            <a href="/provider/enquiries" class="list-group-item list-group-item-action ${activePage == 'enquiries' ? 'active' : ''}">
                <i class="fas fa-envelope-open-text me-2 width-20"></i> Enquiries
            </a>

            <a href="/provider/leads" class="list-group-item list-group-item-action ${activePage == 'leads' ? 'active' : ''}">
                <i class="fas fa-bullseye me-2 width-20"></i> Leads
            </a>
            <a href="/provider/applications" class="list-group-item list-group-item-action ${activePage == 'applications' ? 'active' : ''}">
                <i class="fas fa-file-alt me-2 width-20"></i> Applications
            </a>
            <a href="/provider/logout" class="list-group-item list-group-item-action text-danger mt-5">
                <i class="fas fa-sign-out-alt me-2 width-20"></i> Logout
            </a>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <!-- Top Nav -->
        <nav class="navbar navbar-expand-lg navbar-light dashboard-nav d-flex justify-content-between align-items-center">
            <button class="btn btn-outline-primary d-md-none" id="menu-toggle">
                <i class="fas fa-bars"></i>
            </button>
            <div class="d-none d-md-block fs-5 fw-bold text-dark">
                Welcome, ${provider.organizationName}
            </div>
            <div>
                <a href="/" class="btn btn-sm btn-light border shadow-sm"><i class="fas fa-home"></i> Main Site</a>
            </div>
        </nav>

        <div class="container-fluid p-4">
            <!-- Content Injected Here -->
            <jsp:doBody/>
        </div>
    </div>
    <!-- /#page-content-wrapper -->
</div>

<!-- Simple script for sidebar toggle -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var toggle = document.getElementById("menu-toggle");
        if(toggle) {
            toggle.addEventListener("click", function(e) {
                e.preventDefault();
                document.getElementById("wrapper").classList.toggle("toggled");
            });
        }
    });
</script>

<jsp:include page="../common/footer.jsp">
    <jsp:param name="hideFooter" value="true" />
</jsp:include>
