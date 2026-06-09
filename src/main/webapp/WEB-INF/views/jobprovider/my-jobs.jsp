<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="jobprovider-sidebar.jsp" />

<c:if test="${not empty successMsg}">
    <div class="success-toast"><i class="fas fa-check-circle fs-5"></i> ${successMsg}</div>
</c:if>
<c:if test="${not empty errorMsg}">
    <div class="success-toast" style="background:linear-gradient(135deg,#ef4444,#dc2626);">
        <i class="fas fa-exclamation-circle fs-5"></i> ${errorMsg}
    </div>
</c:if>

<!-- Header Row -->
<div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
    <div>
        <h5 class="fw-bold m-0" style="color:#0f172a;">My Job Listings</h5>
        <p class="text-muted m-0" style="font-size:0.82rem;">Manage all your overseas job postings</p>
    </div>
    <a href="/jobprovider/post-job" class="btn-jp-primary btn">
        <i class="fas fa-plus me-2"></i> Post New Job
    </a>
</div>

<!-- Filter Bar -->
<div class="jp-card mb-4">
    <div class="row g-3 align-items-center">
        <div class="col-md-5">
            <div style="position:relative;">
                <i class="fas fa-search" style="position:absolute;left:14px;top:50%;transform:translateY(-50%);color:#94a3b8;"></i>
                <input type="text" id="jobSearch" class="form-control" placeholder="Search by job title or country..." style="padding-left:38px;">
            </div>
        </div>
        <div class="col-md-3">
            <select id="statusFilter" class="form-select">
                <option value="">All Statuses</option>
                <option value="DRAFT">Draft</option>
                <option value="PUBLISHED">Published</option>
                <option value="CLOSED">Closed</option>
            </select>
        </div>
        <div class="col-md-2">
            <select id="typeFilter" class="form-select">
                <option value="">All Types</option>
                <option value="Full Time">Full Time</option>
                <option value="Part Time">Part Time</option>
                <option value="Contract">Contract</option>
                <option value="Internship">Internship</option>
            </select>
        </div>
        <div class="col-md-2 text-end">
            <span class="fw-semibold" style="color:#64748b; font-size:0.85rem;">
                <span id="jobCount">${jobs.size()}</span> jobs
            </span>
        </div>
    </div>
</div>

<!-- Jobs Table -->
<div class="jp-card p-0">
    <div class="table-responsive">
        <table class="table jp-table mb-0" id="jobsTable">
            <thead>
                <tr>
                    <th style="width:35%;">Job Title</th>
                    <th>Country</th>
                    <th>Type</th>
                    <th>Salary</th>
                    <th>Status</th>
                    <th>Posted</th>
                    <th class="text-center">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="job" items="${jobs}">
                    <tr class="job-row"
                        data-title="${job.title}"
                        data-country="${not empty job.country ? job.country.name : ''}"
                        data-status="${job.status}"
                        data-type="${job.jobType}">
                        <td>
                            <div class="fw-semibold" style="color:#1e293b;">${job.title}</div>
                            <div style="font-size:0.75rem; color:#94a3b8; margin-top:2px;">
                                <i class="fas fa-industry me-1"></i>${not empty job.industry ? job.industry : 'General'}
                                <c:if test="${not empty job.city}"> · ${job.city}</c:if>
                            </div>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty job.country}">
                                    <span class="fw-medium">${job.country.name}</span>
                                </c:when>
                                <c:otherwise><span class="text-muted">—</span></c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${not empty job.jobType}">
                                <span class="jp-badge jp-badge-info">${job.jobType}</span>
                            </c:if>
                        </td>
                        <td style="font-size:0.85rem;">
                            <c:choose>
                                <c:when test="${not empty job.expectedSalary}">${job.expectedSalary}</c:when>
                                <c:when test="${not empty job.minSalary and not empty job.maxSalary}">
                                    ${job.currency} ${job.minSalary}–${job.maxSalary}
                                </c:when>
                                <c:otherwise><span class="text-muted">—</span></c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${job.status == 'PUBLISHED' or job.approved}">
                                    <span class="jp-badge jp-badge-success">
                                        <i class="fas fa-circle me-1" style="font-size:6px;"></i> Published
                                    </span>
                                </c:when>
                                <c:when test="${job.status == 'CLOSED'}">
                                    <span class="jp-badge jp-badge-danger">
                                        <i class="fas fa-circle me-1" style="font-size:6px;"></i> Closed
                                    </span>
                                </c:when>
                                <c:when test="${job.approved}">
                                    <span class="jp-badge jp-badge-success">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="jp-badge jp-badge-warning">
                                        <i class="fas fa-clock me-1" style="font-size:9px;"></i> Draft
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td style="font-size:0.8rem; color:#64748b;">
                            <c:if test="${not empty job.postedDate}">
                                <fmt:parseDate value="${job.postedDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both"/>
                                <fmt:formatDate value="${parsedDate}" pattern="dd MMM yyyy"/>
                            </c:if>
                        </td>
                        <td class="text-center">
                            <div class="d-flex gap-1 justify-content-center">
                                <a href="/jobprovider/job/${job.id}"
                                   class="btn btn-sm"
                                   style="background:#dbeafe;color:#1d4ed8;border-radius:8px;padding:6px 10px;"
                                   title="View">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <form action="/jobprovider/delete-job" method="POST" style="display:inline;"
                                      onsubmit="return confirm('Delete this job posting?');">
                                    <input type="hidden" name="id" value="${job.id}">
                                    <button type="submit"
                                            class="btn btn-sm"
                                            style="background:#fee2e2;color:#dc2626;border-radius:8px;padding:6px 10px;"
                                            title="Delete">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty jobs}">
                    <tr id="emptyRow">
                        <td colspan="7" class="text-center py-5" style="color:#94a3b8;">
                            <i class="fas fa-briefcase fs-1 d-block mb-3" style="color:#e2e8f0;"></i>
                            <div class="fw-semibold mb-1">No jobs posted yet</div>
                            <div style="font-size:0.85rem;">
                                <a href="/jobprovider/post-job" class="text-primary fw-bold">Post your first job</a> to start recruiting overseas talent.
                            </div>
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<!-- Empty search state -->
<div id="noResultsRow" class="jp-card text-center py-5 mt-3" style="display:none;">
    <i class="fas fa-search fs-1 mb-3" style="color:#e2e8f0;"></i>
    <div class="fw-semibold text-muted">No jobs match your search.</div>
</div>

<script>
(function() {
    const searchInput = document.getElementById('jobSearch');
    const statusFilter = document.getElementById('statusFilter');
    const typeFilter = document.getElementById('typeFilter');
    const rows = document.querySelectorAll('.job-row');
    const noResults = document.getElementById('noResultsRow');
    const countEl = document.getElementById('jobCount');

    function filterJobs() {
        const q = searchInput.value.toLowerCase();
        const status = statusFilter.value.toLowerCase();
        const type = typeFilter.value.toLowerCase();
        let visible = 0;
        rows.forEach(row => {
            const title = (row.dataset.title || '').toLowerCase();
            const country = (row.dataset.country || '').toLowerCase();
            const rowStatus = (row.dataset.status || '').toLowerCase();
            const rowType = (row.dataset.type || '').toLowerCase();
            const matchQ = !q || title.includes(q) || country.includes(q);
            const matchStatus = !status || rowStatus === status;
            const matchType = !type || rowType === type;
            if (matchQ && matchStatus && matchType) {
                row.style.display = '';
                visible++;
            } else {
                row.style.display = 'none';
            }
        });
        if (countEl) countEl.textContent = visible;
        if (noResults) noResults.style.display = (visible === 0 && rows.length > 0) ? '' : 'none';
    }

    if (searchInput) searchInput.addEventListener('input', filterJobs);
    if (statusFilter) statusFilter.addEventListener('change', filterJobs);
    if (typeFilter) typeFilter.addEventListener('change', filterJobs);
})();
</script>

<jsp:include page="jobprovider-footer.jsp" />
