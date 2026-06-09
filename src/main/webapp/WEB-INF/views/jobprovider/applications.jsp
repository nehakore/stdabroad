<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="jobprovider-sidebar.jsp" />

<!-- Header -->
<div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
    <div>
        <h5 class="fw-bold m-0" style="color:#0f172a;">Job Applications</h5>
        <p class="text-muted m-0" style="font-size:0.82rem;">Review and manage candidates who applied for your jobs</p>
    </div>
    <span class="jp-badge jp-badge-info" style="font-size:0.9rem; padding:8px 18px;">
        <i class="fas fa-users me-2"></i>${applications.size()} Total Applications
    </span>
</div>

<!-- Stats Row -->
<div class="row g-3 mb-4">
    <c:set var="pending" value="0"/>
    <c:set var="accepted" value="0"/>
    <c:set var="rejected" value="0"/>
    <c:forEach var="app" items="${applications}">
        <c:if test="${app.status == 'PENDING'}"><c:set var="pending" value="${pending + 1}"/></c:if>
        <c:if test="${app.status == 'ACCEPTED' or app.status == 'APPROVED'}"><c:set var="accepted" value="${accepted + 1}"/></c:if>
        <c:if test="${app.status == 'REJECTED'}"><c:set var="rejected" value="${rejected + 1}"/></c:if>
    </c:forEach>
    <div class="col-sm-4">
        <div class="stat-card">
            <div class="stat-icon" style="background:#fef9c3;"><i class="fas fa-clock" style="color:#ca8a04;"></i></div>
            <div>
                <div class="stat-number">${pending}</div>
                <div class="stat-label">Pending Review</div>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="stat-card">
            <div class="stat-icon" style="background:#dcfce7;"><i class="fas fa-check-circle" style="color:#16a34a;"></i></div>
            <div>
                <div class="stat-number">${accepted}</div>
                <div class="stat-label">Accepted</div>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="stat-card">
            <div class="stat-icon" style="background:#fee2e2;"><i class="fas fa-times-circle" style="color:#dc2626;"></i></div>
            <div>
                <div class="stat-number">${rejected}</div>
                <div class="stat-label">Rejected</div>
            </div>
        </div>
    </div>
</div>

<!-- Filter Bar -->
<div class="jp-card mb-4">
    <div class="row g-3 align-items-center">
        <div class="col-md-5">
            <div style="position:relative;">
                <i class="fas fa-search" style="position:absolute;left:14px;top:50%;transform:translateY(-50%);color:#94a3b8;"></i>
                <input type="text" id="appSearch" class="form-control" placeholder="Search by candidate name or job title..." style="padding-left:38px;">
            </div>
        </div>
        <div class="col-md-3">
            <select id="appStatusFilter" class="form-select">
                <option value="">All Statuses</option>
                <option value="PENDING">Pending</option>
                <option value="ACCEPTED">Accepted</option>
                <option value="REJECTED">Rejected</option>
                <option value="SHORTLISTED">Shortlisted</option>
            </select>
        </div>
        <div class="col-md-4 text-end">
            <span class="fw-semibold" style="color:#64748b; font-size:0.85rem;">
                <span id="appCount">${applications.size()}</span> applications
            </span>
        </div>
    </div>
</div>

<!-- Applications List -->
<div class="jp-card p-0">
    <div class="table-responsive">
        <table class="table jp-table mb-0" id="appsTable">
            <thead>
                <tr>
                    <th>Candidate</th>
                    <th>Applied For</th>
                    <th>Applied On</th>
                    <th>Resume</th>
                    <th>Status</th>
                    <th class="text-center">Update Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="app" items="${applications}">
                    <tr class="app-row"
                        data-name="${not empty app.user ? app.user.name : ''}"
                        data-job="${not empty app.job ? app.job.title : ''}"
                        data-status="${app.status}">
                        <td>
                            <div class="d-flex align-items-center gap-2">
                                <div style="width:38px;height:38px;border-radius:50%;background:linear-gradient(135deg,#6366f1,#8b5cf6);display:flex;align-items:center;justify-content:center;color:#fff;font-weight:700;font-size:0.95rem;flex-shrink:0;">
                                    ${not empty app.user ? app.user.name.substring(0,1).toUpperCase() : '?'}
                                </div>
                                <div>
                                    <div class="fw-semibold" style="color:#1e293b;">${not empty app.user ? app.user.name : 'N/A'}</div>
                                    <div style="font-size:0.75rem; color:#94a3b8;">${not empty app.user ? app.user.email : ''}</div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="fw-medium" style="color:#334155;">${not empty app.job ? app.job.title : 'N/A'}</div>
                            <div style="font-size:0.75rem; color:#94a3b8;">
                                ${not empty app.job and not empty app.job.country ? app.job.country.name : ''}
                            </div>
                        </td>
                        <td style="font-size:0.82rem; color:#64748b;">
                            <c:if test="${not empty app.appliedAt}">
                                ${app.appliedAt.toLocalDate()}
                            </c:if>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty app.resumeUrl}">
                                    <a href="${app.resumeUrl}" target="_blank" class="btn btn-sm"
                                       style="background:#ede9fe;color:#6d28d9;border-radius:8px;font-size:0.78rem;padding:5px 12px;">
                                        <i class="fas fa-file-pdf me-1"></i>View CV
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-muted" style="font-size:0.82rem;">Not uploaded</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${app.status == 'PENDING'}">
                                    <span class="jp-badge jp-badge-warning"><i class="fas fa-clock me-1" style="font-size:8px;"></i>Pending</span>
                                </c:when>
                                <c:when test="${app.status == 'ACCEPTED' or app.status == 'APPROVED'}">
                                    <span class="jp-badge jp-badge-success"><i class="fas fa-check me-1" style="font-size:8px;"></i>Accepted</span>
                                </c:when>
                                <c:when test="${app.status == 'REJECTED'}">
                                    <span class="jp-badge jp-badge-danger"><i class="fas fa-times me-1" style="font-size:8px;"></i>Rejected</span>
                                </c:when>
                                <c:when test="${app.status == 'SHORTLISTED'}">
                                    <span class="jp-badge jp-badge-purple"><i class="fas fa-star me-1" style="font-size:8px;"></i>Shortlisted</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="jp-badge jp-badge-gray">${app.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="text-center">
                            <div class="d-flex gap-1 justify-content-center flex-wrap">
                                <form action="/jobprovider/update-application-status" method="POST" class="d-inline">
                                    <input type="hidden" name="id" value="${app.id}">
                                    <input type="hidden" name="status" value="SHORTLISTED">
                                    <button type="submit" class="btn btn-sm"
                                            style="background:#ede9fe;color:#6d28d9;border-radius:8px;padding:5px 10px;font-size:0.78rem;"
                                            title="Shortlist">
                                        <i class="fas fa-star me-1"></i>Shortlist
                                    </button>
                                </form>
                                <form action="/jobprovider/update-application-status" method="POST" class="d-inline">
                                    <input type="hidden" name="id" value="${app.id}">
                                    <input type="hidden" name="status" value="ACCEPTED">
                                    <button type="submit" class="btn btn-sm"
                                            style="background:#dcfce7;color:#15803d;border-radius:8px;padding:5px 10px;font-size:0.78rem;"
                                            title="Accept">
                                        <i class="fas fa-check me-1"></i>Accept
                                    </button>
                                </form>
                                <form action="/jobprovider/update-application-status" method="POST" class="d-inline">
                                    <input type="hidden" name="id" value="${app.id}">
                                    <input type="hidden" name="status" value="REJECTED">
                                    <button type="submit" class="btn btn-sm"
                                            style="background:#fee2e2;color:#dc2626;border-radius:8px;padding:5px 10px;font-size:0.78rem;"
                                            title="Reject"
                                            onclick="return confirm('Reject this application?');">
                                        <i class="fas fa-times me-1"></i>Reject
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty applications}">
                    <tr>
                        <td colspan="6" class="text-center py-5" style="color:#94a3b8;">
                            <i class="fas fa-users fs-1 d-block mb-3" style="color:#e2e8f0;"></i>
                            <div class="fw-semibold mb-1">No applications yet</div>
                            <div style="font-size:0.85rem;">Applications will appear here when candidates apply for your jobs.</div>
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<div id="noAppResults" class="jp-card text-center py-5 mt-3" style="display:none;">
    <i class="fas fa-search fs-1 mb-3" style="color:#e2e8f0;"></i>
    <div class="fw-semibold text-muted">No applications match your search.</div>
</div>

<script>
(function() {
    const searchInput = document.getElementById('appSearch');
    const statusFilter = document.getElementById('appStatusFilter');
    const rows = document.querySelectorAll('.app-row');
    const noResults = document.getElementById('noAppResults');
    const countEl = document.getElementById('appCount');

    function filterApps() {
        const q = searchInput.value.toLowerCase();
        const status = statusFilter.value.toLowerCase();
        let visible = 0;
        rows.forEach(row => {
            const name = (row.dataset.name || '').toLowerCase();
            const job = (row.dataset.job || '').toLowerCase();
            const rowStatus = (row.dataset.status || '').toLowerCase();
            const matchQ = !q || name.includes(q) || job.includes(q);
            const matchStatus = !status || rowStatus === status;
            if (matchQ && matchStatus) { row.style.display = ''; visible++; }
            else row.style.display = 'none';
        });
        if (countEl) countEl.textContent = visible;
        if (noResults) noResults.style.display = (visible === 0 && rows.length > 0) ? '' : 'none';
    }

    if (searchInput) searchInput.addEventListener('input', filterApps);
    if (statusFilter) statusFilter.addEventListener('change', filterApps);
})();
</script>

<jsp:include page="jobprovider-footer.jsp" />
