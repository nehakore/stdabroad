<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="jobprovider-sidebar.jsp" />

<!-- Pending Approval Banner -->
<c:if test="${not provider.approved}">
<div style="background:linear-gradient(135deg,#f59e0b,#d97706);color:#fff;border-radius:14px;padding:16px 22px;margin-bottom:24px;display:flex;align-items:center;gap:14px;">
    <i class="fas fa-clock" style="font-size:1.4rem;flex-shrink:0;"></i>
    <div>
        <div style="font-weight:700;font-size:0.95rem;">Account Pending Approval</div>
        <div style="font-size:0.82rem;opacity:0.9;">Your account is under review. You can explore the dashboard but job posts will go live after admin approves your account.</div>
    </div>
</div>
</c:if>


<div class="row g-3 mb-4">
    <div class="col-sm-6 col-xl-3">
        <div class="stat-card">
            <div class="stat-icon" style="background:#dbeafe;">
                <i class="fas fa-briefcase" style="color:#3b82f6;"></i>
            </div>
            <div>
                <div class="stat-number">${totalJobs}</div>
                <div class="stat-label">Total Jobs Posted</div>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-xl-3">
        <div class="stat-card">
            <div class="stat-icon" style="background:#dcfce7;">
                <i class="fas fa-check-circle" style="color:#16a34a;"></i>
            </div>
            <div>
                <div class="stat-number">${activeJobs}</div>
                <div class="stat-label">Active Listings</div>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-xl-3">
        <div class="stat-card">
            <div class="stat-icon" style="background:#ede9fe;">
                <i class="fas fa-file-alt" style="color:#7c3aed;"></i>
            </div>
            <div>
                <div class="stat-number">${totalApplications}</div>
                <div class="stat-label">Total Applications</div>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-xl-3">
        <div class="stat-card">
            <div class="stat-icon" style="background:#fef9c3;">
                <i class="fas fa-globe" style="color:#ca8a04;"></i>
            </div>
            <div>
                <div class="stat-number">${provider.country != null ? provider.country : '—'}</div>
                <div class="stat-label">Based In</div>
            </div>
        </div>
    </div>
</div>

<div class="row g-4">
    <!-- Recent Jobs -->
    <div class="col-lg-7">
        <div class="jp-card">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h6 class="fw-bold m-0" style="color:#0f172a;"><i class="fas fa-list-ul me-2 text-primary"></i> Recent Job Posts</h6>
                <a href="/jobprovider/my-jobs" class="btn-jp-outline btn" style="font-size:0.8rem; padding:6px 14px;">View All</a>
            </div>
            <div class="table-responsive">
                <table class="table jp-table mb-0">
                    <thead>
                        <tr>
                            <th>Job Title</th>
                            <th>Country</th>
                            <th>Status</th>
                            <th>Posted</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="job" items="${myJobs}">
                            <tr>
                                <td>
                                    <a href="/jobprovider/job/${job.id}" class="fw-semibold text-decoration-none" style="color:#1e293b;">${job.title}</a>
                                    <div style="font-size:0.75rem; color:#94a3b8;">${job.jobType} · ${job.industry}</div>
                                </td>
                                <td>${not empty job.country ? job.country.name : '—'}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${job.status == 'PUBLISHED' or job.approved}"><span class="jp-badge jp-badge-success">Published</span></c:when>
                                        <c:when test="${job.status == 'CLOSED'}"><span class="jp-badge jp-badge-danger">Closed</span></c:when>
                                        <c:otherwise><span class="jp-badge jp-badge-warning">Draft</span></c:otherwise>
                                    </c:choose>
                                </td>
                                <td style="font-size:0.8rem; color:#94a3b8;">
                                    <c:if test="${not empty job.postedDate}">${job.postedDate}</c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty myJobs}">
                            <tr><td colspan="4" class="text-center py-4" style="color:#94a3b8;">
                                <i class="fas fa-inbox fs-2 d-block mb-2"></i>
                                No jobs posted yet. <a href="/jobprovider/post-job" class="text-primary fw-bold">Post your first job!</a>
                            </td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Recent Applications -->
    <div class="col-lg-5">
        <div class="jp-card h-100">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h6 class="fw-bold m-0" style="color:#0f172a;"><i class="fas fa-user-check me-2 text-purple" style="color:#7c3aed;"></i> Recent Applications</h6>
                <a href="/jobprovider/applications" class="btn-jp-outline btn" style="font-size:0.8rem; padding:6px 14px;">View All</a>
            </div>
            <c:forEach var="app" items="${recentApplications}">
                <div style="display:flex; align-items:center; gap:12px; padding:12px 0; border-bottom:1px solid #f1f5f9;">
                    <div style="width:38px;height:38px;border-radius:50%;background:linear-gradient(135deg,#6366f1,#8b5cf6);display:flex;align-items:center;justify-content:center;color:#fff;font-weight:700;font-size:0.95rem;flex-shrink:0;">
                        ${not empty app.user ? app.user.name.substring(0,1).toUpperCase() : '?'}
                    </div>
                    <div style="flex:1;min-width:0;">
                        <div style="font-size:0.88rem;font-weight:600;color:#1e293b;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
                            ${not empty app.user ? app.user.name : 'Candidate'}
                        </div>
                        <div style="font-size:0.75rem;color:#94a3b8;">
                            ${not empty app.job ? app.job.title : 'Unknown Job'}
                        </div>
                    </div>
                    <span class="jp-badge jp-badge-info">${app.status}</span>
                </div>
            </c:forEach>
            <c:if test="${empty recentApplications}">
                <div class="text-center py-4" style="color:#94a3b8;">
                    <i class="fas fa-inbox fs-2 d-block mb-2"></i> No applications yet.
                </div>
            </c:if>
        </div>
    </div>
</div>

<!-- Quick Actions -->
<div class="row g-3 mt-2">
    <div class="col-12">
        <div class="jp-card">
            <h6 class="fw-bold mb-3" style="color:#0f172a;"><i class="fas fa-bolt me-2 text-warning"></i> Quick Actions</h6>
            <div class="d-flex flex-wrap gap-2">
                <a href="/jobprovider/post-job" class="btn-jp-primary btn"><i class="fas fa-plus me-2"></i> Post New Job</a>
                <a href="/jobprovider/my-jobs" class="btn-jp-outline btn"><i class="fas fa-list me-2"></i> View My Jobs</a>
                <a href="/jobprovider/applications" class="btn-jp-outline btn"><i class="fas fa-file-alt me-2"></i> View Applications</a>
                <a href="/jobprovider/profile" class="btn-jp-outline btn"><i class="fas fa-cog me-2"></i> Profile Settings</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="jobprovider-footer.jsp" />
