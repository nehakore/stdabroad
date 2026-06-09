<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Admin Dashboard - Study & Jobs Abroad" />
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
        background: #111827; /* Dark elegant background */
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

    /* Modal Styling */
    .document-preview-modal .modal-content {
        border-radius: 16px;
        border: none;
    }
    .document-preview-modal .modal-header {
        background: #f8f9fa;
        border-radius: 16px 16px 0 0;
        border-bottom: 1px solid #e5e7eb;
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
            <button class="nav-link active" data-bs-toggle="pill" data-bs-target="#approvals"><i class="fas fa-clock"></i> Pending Providers</button>
            <button class="nav-link" data-bs-toggle="pill" data-bs-target="#approved-providers"><i class="fas fa-check-double"></i> Approved Providers</button>
            
            <div class="text-uppercase small text-muted px-3 mb-2 mt-4 fw-bold">Listings</div>
            <button class="nav-link" data-bs-toggle="pill" data-bs-target="#job-approvals"><i class="fas fa-briefcase"></i> Pending Jobs</button>
            <button class="nav-link" data-bs-toggle="pill" data-bs-target="#uni-approvals"><i class="fas fa-university"></i> Pending Universities</button>
            <button class="nav-link" data-bs-toggle="pill" data-bs-target="#manage-jobs"><i class="fas fa-list-alt"></i> Manage Jobs</button>
            <button class="nav-link" data-bs-toggle="pill" data-bs-target="#manage-universities"><i class="fas fa-graduation-cap"></i> Manage Universities</button>
            
            <div class="text-uppercase small text-muted px-3 mb-2 mt-4 fw-bold">Management</div>
            <button class="nav-link" data-bs-toggle="pill" data-bs-target="#manage-users"><i class="fas fa-users"></i> Manage Users</button>
            <button class="nav-link" data-bs-toggle="pill" data-bs-target="#manage-countries"><i class="fas fa-globe-americas"></i> Manage Countries</button>
            <button class="nav-link" data-bs-toggle="pill" data-bs-target="#manage-scholarships"><i class="fas fa-award"></i> Scholarships</button>
            <button class="nav-link" data-bs-toggle="pill" data-bs-target="#manage-visa-guides"><i class="fas fa-passport"></i> Visa Guides</button>
            <button class="nav-link" data-bs-toggle="pill" data-bs-target="#enquiries"><i class="fas fa-headset"></i> User Enquiries</button>
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

        <div class="tab-content" data-aos="fade-up">
            
            <!-- PENDING PROVIDERS TAB -->
            <div class="tab-pane fade show active" id="approvals">
                <div class="dashboard-card">
                    <h5 class="fw-bold mb-4 border-bottom pb-3"><i class="fas fa-clock text-warning me-2"></i> Pending Provider Applications</h5>
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Organization / Agency</th>
                                    <th>Contact Details</th>
                                    <th>Location</th>
                                    <th>Documents</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="provider" items="${unapprovedProviders}">
                                    <tr>
                                        <td>
                                            <div class="fw-bold text-dark">${provider.organizationName}</div>
                                            <div class="small text-muted"><i class="fas fa-briefcase me-1"></i> ${provider.designation}</div>
                                            <div class="small text-muted"><i class="fas fa-history me-1"></i> ${provider.experience} years exp.</div>
                                        </td>
                                        <td>
                                            <div class="fw-medium">${provider.contactName}</div>
                                            <div class="small text-muted"><i class="fas fa-envelope me-1"></i> ${provider.email}</div>
                                            <div class="small text-muted"><i class="fas fa-phone me-1"></i> ${provider.mobile}</div>
                                        </td>
                                        <td>
                                            <div>${provider.city}, ${provider.state}</div>
                                            <div class="small text-muted fw-bold">${provider.country}</div>
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary rounded-pill shadow-sm" onclick="viewDocuments('${provider.govIdUrl}', '${provider.businessCertUrl}')">
                                                <i class="fas fa-file-search me-1"></i> View Docs
                                            </button>
                                        </td>
                                        <td>
                                            <div class="d-flex justify-content-end gap-2">
                                                <form action="/admin/approve-provider" method="POST" class="m-0">
                                                    <input type="hidden" name="id" value="${provider.id}">
                                                    <button type="submit" class="btn btn-success btn-sm rounded-pill shadow-sm px-3"><i class="fas fa-check me-1"></i> Approve</button>
                                                </form>
                                                <form action="/admin/reject-provider" method="POST" class="m-0" onsubmit="return confirm('Are you sure you want to reject and delete this provider application?');">
                                                    <input type="hidden" name="id" value="${provider.id}">
                                                    <button type="submit" class="btn btn-danger btn-sm rounded-pill shadow-sm px-3"><i class="fas fa-times me-1"></i> Reject</button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty unapprovedProviders}">
                                    <tr><td colspan="5" class="text-center text-muted py-5"><i class="fas fa-check-circle fs-2 text-success mb-2 d-block"></i> No pending applications. You are all caught up!</td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- APPROVED PROVIDERS TAB -->
            <div class="tab-pane fade" id="approved-providers">
                <div class="dashboard-card">
                    <h5 class="fw-bold mb-4 border-bottom pb-3"><i class="fas fa-check-double text-success me-2"></i> Approved Providers Network</h5>
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Organization / Agency</th>
                                    <th>Contact Name</th>
                                    <th>Email & Mobile</th>
                                    <th>Location</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="provider" items="${approvedProviders}">
                                    <tr>
                                        <td>
                                            <div class="fw-bold text-dark">${provider.organizationName}</div>
                                            <div class="small text-muted">${provider.website}</div>
                                        </td>
                                        <td class="fw-medium">${provider.contactName}</td>
                                        <td>
                                            <div>${provider.email}</div>
                                            <div class="small text-muted">${provider.mobile}</div>
                                        </td>
                                        <td>${provider.city}, ${provider.country}</td>
                                        <td><span class="badge bg-success rounded-pill px-3 py-2"><i class="fas fa-check me-1"></i> Active</span></td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty approvedProviders}">
                                    <tr><td colspan="5" class="text-center text-muted py-5">No approved providers found in the system.</td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <!-- Job Approvals Tab -->
            <div class="tab-pane fade" id="job-approvals">
                <div class="dashboard-card">
                    <h5 class="fw-bold mb-4">Pending Job Listings</h5>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Title</th>
                                    <th>Provider</th>
                                    <th>Country</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="job" items="${unapprovedJobs}">
                                    <tr>
                                        <td class="fw-medium">${job.title}</td>
                                        <td>${job.provider.organizationName}</td>
                                        <td>${job.country.name}</td>
                                        <td>
                                            <form action="/admin/approve-job" method="POST">
                                                <input type="hidden" name="id" value="${job.id}">
                                                <button type="submit" class="btn btn-sm btn-success rounded-pill px-3">Approve Listing</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty unapprovedJobs}">
                                    <tr><td colspan="4" class="text-center text-muted py-4">No pending job listings.</td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- University Approvals Tab -->
            <div class="tab-pane fade" id="uni-approvals">
                <div class="dashboard-card">
                    <h5 class="fw-bold mb-4">Pending University Listings</h5>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Name</th>
                                    <th>Provider</th>
                                    <th>Country</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="uni" items="${unapprovedUniversities}">
                                    <tr>
                                        <td class="fw-medium">${uni.name}</td>
                                        <td>${uni.provider.organizationName}</td>
                                        <td>${uni.country.name}</td>
                                        <td>
                                            <form action="/admin/approve-university" method="POST">
                                                <input type="hidden" name="id" value="${uni.id}">
                                                <button type="submit" class="btn btn-sm btn-success rounded-pill px-3">Approve University</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty unapprovedUniversities}">
                                    <tr><td colspan="4" class="text-center text-muted py-4">No pending university listings.</td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <!-- Enquiries Tab -->
            <div class="tab-pane fade" id="enquiries">
                <div class="dashboard-card">
                    <h5 class="fw-bold mb-4">User Enquiries Dashboard</h5>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>User Info</th>
                                    <th>Type</th>
                                    <th>Message Details</th>
                                    <th>Status Manager</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="enq" items="${enquiries}">
                                    <tr>
                                        <td>
                                            <div class="fw-bold">${enq.name}</div>
                                            <div class="small text-muted"><a href="mailto:${enq.email}">${enq.email}</a></div>
                                        </td>
                                        <td><span class="badge bg-primary shadow-sm">${enq.type}</span></td>
                                        <td><div style="max-width:300px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${enq.message}</div></td>
                                        <td>
                                            <form action="/admin/update-enquiry-status" method="POST" class="d-flex gap-2">
                                                <input type="hidden" name="id" value="${enq.id}">
                                                <select name="status" class="form-select form-select-sm rounded-pill" style="width: 140px;">
                                                    <option value="New" ${enq.status == 'New' ? 'selected' : ''}>New</option>
                                                    <option value="Contacted" ${enq.status == 'Contacted' ? 'selected' : ''}>Contacted</option>
                                                    <option value="In Progress" ${enq.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                                                    <option value="Closed" ${enq.status == 'Closed' ? 'selected' : ''}>Closed</option>
                                                </select>
                                                <button type="submit" class="btn btn-sm btn-dark rounded-pill px-3">Update</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty enquiries}">
                                    <tr><td colspan="4" class="text-center text-muted py-4">No user enquiries found.</td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Manage Users Tab -->
            <div class="tab-pane fade" id="manage-users">
                <div class="dashboard-card">
                    <h5 class="fw-bold mb-4">Manage Users</h5>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Role</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="u" items="${users}">
                                    <tr>
                                        <td>${u.id}</td>
                                        <td class="fw-medium">${u.name}</td>
                                        <td>${u.email}</td>
                                        <td>${u.phone}</td>
                                        <td><span class="badge bg-primary px-2 py-1 rounded-pill">${u.role}</span></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Manage Countries Tab -->
            <div class="tab-pane fade" id="manage-countries">
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="dashboard-card h-100">
                            <h5 class="fw-bold mb-3">Add New Country</h5>
                            <form action="/admin/add-country" method="POST">
                                <div class="mb-3">
                                    <label class="form-label fw-medium">Country Name</label>
                                    <input type="text" name="name" class="form-control rounded-pill" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-medium">Image URL</label>
                                    <input type="url" name="imageUrl" class="form-control rounded-pill">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-medium">Description</label>
                                    <textarea name="description" class="form-control" rows="3" style="border-radius:12px;"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary w-100 rounded-pill">Add Country</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="dashboard-card h-100">
                            <h5 class="fw-bold mb-3">Existing Countries</h5>
                            <div class="table-responsive">
                                <table class="table align-middle">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Name</th>
                                            <th>Description</th>
                                            <th class="text-end">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="country" items="${countries}">
                                            <tr>
                                                <td class="fw-medium">${country.name}</td>
                                                <td>${country.description}</td>
                                                <td class="text-end">
                                                    <button class="btn btn-sm btn-outline-danger rounded-pill"><i class="fas fa-trash"></i></button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty countries}">
                                            <tr><td colspan="3" class="text-center text-muted py-4">No countries added yet.</td></tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Manage Scholarships Tab -->
            <div class="tab-pane fade" id="manage-scholarships">
                <div class="dashboard-card">
                    <h5 class="fw-bold mb-4">Manage Scholarships</h5>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Title</th>
                                    <th>Provider</th>
                                    <th>Amount</th>
                                    <th>Country</th>
                                    <th>Deadline</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="scholarship" items="${scholarships}">
                                    <tr>
                                        <td class="fw-medium">${scholarship.title}</td>
                                        <td>${scholarship.provider}</td>
                                        <td><span class="badge bg-success px-2 py-1 rounded-pill">${scholarship.amount}</span></td>
                                        <td>${scholarship.country.name}</td>
                                        <td>${scholarship.deadline}</td>
                                        <td class="text-end">
                                            <button class="btn btn-sm btn-outline-danger rounded-pill"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty scholarships}">
                                    <tr><td colspan="6" class="text-center py-4 text-muted">No scholarships found.</td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Manage Visa Guides Tab -->
            <div class="tab-pane fade" id="manage-visa-guides">
                <div class="dashboard-card">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold m-0">Manage Visa Guides</h5>
                        <button class="btn btn-primary btn-sm rounded-pill px-3 shadow-sm" data-bs-toggle="modal" data-bs-target="#addVisaGuideModal">
                            <i class="fas fa-plus me-2"></i> Add Guide
                        </button>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Country</th>
                                    <th>Visa Type</th>
                                    <th>Processing Time</th>
                                    <th>Fee</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="guide" items="${visaGuides}">
                                    <tr>
                                        <td class="fw-medium">${guide.country.name}</td>
                                        <td>${guide.visaType}</td>
                                        <td>${guide.processingTime}</td>
                                        <td>${guide.fee}</td>
                                        <td class="text-end">
                                            <button class="btn btn-sm btn-outline-danger rounded-pill"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty visaGuides}">
                                    <tr><td colspan="5" class="text-center py-4 text-muted">No visa guides found.</td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Manage Jobs Tab -->
            <div class="tab-pane fade" id="manage-jobs">
                <div class="dashboard-card">
                    <h5 class="fw-bold mb-4">Active Jobs Database</h5>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Job Title</th>
                                    <th>Company</th>
                                    <th>Location</th>
                                    <th>Salary</th>
                                    <th>Posted Date</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="job" items="${approvedJobs}">
                                    <tr>
                                        <td class="fw-medium">${job.title}</td>
                                        <td>${job.provider.organizationName}</td>
                                        <td>${job.location}, ${job.country.name}</td>
                                        <td>${job.salary}</td>
                                        <td>${job.postedDate}</td>
                                        <td class="text-end">
                                            <button class="btn btn-sm btn-outline-danger rounded-pill shadow-sm"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty approvedJobs}">
                                    <tr><td colspan="6" class="text-center py-4 text-muted">No active jobs found.</td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Manage Universities Tab -->
            <div class="tab-pane fade" id="manage-universities">
                <div class="dashboard-card">
                    <h5 class="fw-bold mb-4">Active Universities Database</h5>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>University Name</th>
                                    <th>Provider Agency</th>
                                    <th>Location</th>
                                    <th>Ranking</th>
                                    <th class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="uni" items="${approvedUniversities}">
                                    <tr>
                                        <td class="fw-medium">${uni.name}</td>
                                        <td>${uni.provider.organizationName}</td>
                                        <td>${uni.location}, ${uni.country.name}</td>
                                        <td>${uni.ranking}</td>
                                        <td class="text-end">
                                            <button class="btn btn-sm btn-outline-danger rounded-pill shadow-sm"><i class="fas fa-trash"></i></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty approvedUniversities}">
                                    <tr><td colspan="5" class="text-center py-4 text-muted">No active universities found.</td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </main>
</div>

<!-- Document Viewer Modal -->
<div class="modal fade document-preview-modal" id="docModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content shadow-lg">
            <div class="modal-header">
                <h5 class="modal-title fw-bold"><i class="fas fa-file-search me-2"></i> Provider Verification Documents</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body p-4 bg-light">
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header bg-white fw-bold text-center py-3">Government ID Proof</div>
                            <div class="card-body p-0 d-flex justify-content-center align-items-center" style="min-height: 400px; background: #f3f4f6;">
                                <div id="govIdContainer" class="w-100 h-100 text-center p-3">
                                    <div class="spinner-border text-primary my-5" role="status"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header bg-white fw-bold text-center py-3">Business Registration Certificate</div>
                            <div class="card-body p-0 d-flex justify-content-center align-items-center" style="min-height: 400px; background: #f3f4f6;">
                                <div id="businessCertContainer" class="w-100 h-100 text-center p-3">
                                    <div class="spinner-border text-primary my-5" role="status"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer bg-white border-top-0">
                <button type="button" class="btn btn-secondary rounded-pill px-4" data-bs-dismiss="modal">Close Viewer</button>
            </div>
        </div>
    </div>
</div>

<!-- Add Visa Guide Modal -->
<div class="modal fade" id="addVisaGuideModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content shadow-lg border-0" style="border-radius: 16px;">
            <div class="modal-header bg-light" style="border-radius: 16px 16px 0 0;">
                <h5 class="modal-title fw-bold">Add New Visa Guide</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="/admin/add-visa-guide" method="POST">
                <div class="modal-body p-4">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Country</label>
                            <select name="country.id" class="form-select rounded-pill" required>
                                <c:forEach var="c" items="${countries}">
                                    <option value="${c.id}">${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Visa Type</label>
                            <input type="text" name="visaType" class="form-control rounded-pill" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Application Fee</label>
                            <input type="text" name="fee" class="form-control rounded-pill" placeholder="e.g., $160" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Average Processing Time</label>
                            <input type="text" name="processingTime" class="form-control rounded-pill" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-medium">Overview / Description</label>
                            <textarea name="description" class="form-control" rows="3" style="border-radius:12px;" required></textarea>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-medium">Required Documents (Use lists)</label>
                            <textarea name="requiredDocuments" class="form-control" rows="3" style="border-radius:12px;" required></textarea>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-medium">Step-by-Step Application Process</label>
                            <textarea name="applicationProcess" class="form-control" rows="3" style="border-radius:12px;" required></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer bg-light" style="border-radius: 0 0 16px 16px;">
                    <button type="button" class="btn btn-secondary rounded-pill px-4" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary rounded-pill px-4">Save Visa Guide</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function renderDocument(url, containerId) {
        const container = document.getElementById(containerId);
        container.innerHTML = ''; // clear

        if (!url || url === 'null' || url === '') {
            container.innerHTML = '<div class="d-flex flex-column align-items-center justify-content-center h-100 py-5 text-muted"><i class="fas fa-file-times fs-1 mb-3"></i><p>Document not uploaded</p></div>';
            return;
        }

        const ext = url.split('.').pop().toLowerCase();
        
        if (ext === 'pdf') {
            container.innerHTML = '<iframe src="' + url + '" width="100%" height="400px" style="border:none;"></iframe>';
        } else if (['jpg', 'jpeg', 'png', 'gif'].includes(ext)) {
            container.innerHTML = '<img src="' + url + '" style="max-width:100%; max-height:400px; object-fit:contain; border-radius:8px;">';
        } else {
            container.innerHTML = '<div class="text-center py-5"><a href="' + url + '" target="_blank" class="btn btn-primary rounded-pill"><i class="fas fa-download me-2"></i>Download Document</a></div>';
        }
    }

    function viewDocuments(govIdUrl, businessCertUrl) {
        // Show modal
        var myModal = new bootstrap.Modal(document.getElementById('docModal'));
        myModal.show();
        
        // Render files
        renderDocument(govIdUrl, 'govIdContainer');
        renderDocument(businessCertUrl, 'businessCertContainer');
    }
</script>

<jsp:include page="../common/footer.jsp">
    <jsp:param name="hideFooter" value="true" />
</jsp:include>
