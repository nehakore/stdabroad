<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="jobprovider-sidebar.jsp" />

<div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
    <div>
        <h5 class="fw-bold m-0" style="color:#0f172a;">Job Details</h5>
        <p class="text-muted m-0" style="font-size:0.82rem;">
            <a href="/jobprovider/my-jobs" class="text-primary text-decoration-none">
                <i class="fas fa-arrow-left me-1"></i>Back to My Jobs
            </a>
        </p>
    </div>
    <div class="d-flex gap-2 flex-wrap">
        <form action="/jobprovider/delete-job" method="POST" onsubmit="return confirm('Delete this job?');">
            <input type="hidden" name="id" value="${job.id}">
            <button type="submit" class="btn-jp-outline btn" style="color:#dc2626; border-color:#fca5a5;">
                <i class="fas fa-trash me-2"></i>Delete Job
            </button>
        </form>
        <a href="/jobprovider/post-job" class="btn-jp-primary btn">
            <i class="fas fa-plus me-2"></i>Post New Job
        </a>
    </div>
</div>

<div class="row g-4">
    <!-- Left Column: Job Info -->
    <div class="col-lg-8">
        <!-- Job Header -->
        <div class="jp-card mb-4">
            <div class="d-flex justify-content-between align-items-start flex-wrap gap-3">
                <div>
                    <h4 class="fw-bold m-0" style="color:#0f172a;">${job.title}</h4>
                    <div class="mt-2 d-flex flex-wrap gap-2">
                        <c:if test="${not empty job.country}">
                            <span class="jp-badge jp-badge-info"><i class="fas fa-map-marker-alt me-1"></i>${job.country.name}</span>
                        </c:if>
                        <c:if test="${not empty job.jobType}">
                            <span class="jp-badge jp-badge-gray">${job.jobType}</span>
                        </c:if>
                        <c:if test="${not empty job.industry}">
                            <span class="jp-badge jp-badge-gray">${job.industry}</span>
                        </c:if>
                        <c:choose>
                            <c:when test="${job.status == 'PUBLISHED' or job.approved}">
                                <span class="jp-badge jp-badge-success"><i class="fas fa-circle me-1" style="font-size:6px;"></i>Published</span>
                            </c:when>
                            <c:when test="${job.status == 'CLOSED'}">
                                <span class="jp-badge jp-badge-danger">Closed</span>
                            </c:when>
                            <c:otherwise>
                                <span class="jp-badge jp-badge-warning">Draft</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="text-end">
                    <div class="fw-bold" style="font-size:1.2rem; color:#3b82f6;">
                        <c:choose>
                            <c:when test="${not empty job.expectedSalary}">${job.expectedSalary}</c:when>
                            <c:when test="${not empty job.minSalary}">${job.currency} ${job.minSalary}–${job.maxSalary}/mo</c:when>
                            <c:otherwise>Salary TBD</c:otherwise>
                        </c:choose>
                    </div>
                    <div style="font-size:0.78rem; color:#94a3b8;">Compensation</div>
                </div>
            </div>
        </div>

        <!-- Description -->
        <c:if test="${not empty job.jobSummary}">
        <div class="jp-card mb-4">
            <div class="jp-form-section-title"><i class="fas fa-info-circle"></i> Job Summary</div>
            <p style="color:#334155; line-height:1.7;">${job.jobSummary}</p>
        </div>
        </c:if>

        <div class="row g-4 mb-4">
            <c:if test="${not empty job.responsibilities}">
            <div class="col-md-6">
                <div class="jp-card h-100">
                    <div class="jp-form-section-title"><i class="fas fa-tasks"></i> Responsibilities</div>
                    <p style="color:#334155; line-height:1.7; white-space:pre-line;">${job.responsibilities}</p>
                </div>
            </div>
            </c:if>
            <c:if test="${not empty job.requiredSkills}">
            <div class="col-md-6">
                <div class="jp-card h-100">
                    <div class="jp-form-section-title"><i class="fas fa-tools"></i> Required Skills</div>
                    <p style="color:#334155; line-height:1.7; white-space:pre-line;">${job.requiredSkills}</p>
                </div>
            </div>
            </c:if>
        </div>

        <!-- Applications for this job -->
        <div class="jp-card">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h6 class="fw-bold m-0" style="color:#0f172a;">
                    <i class="fas fa-users me-2 text-primary"></i>Candidates Applied
                    <span class="jp-badge jp-badge-info ms-2">${applications.size()}</span>
                </h6>
                <a href="/jobprovider/applications" class="btn-jp-outline btn" style="font-size:0.8rem; padding:6px 14px;">View All</a>
            </div>
            <div class="table-responsive">
                <table class="table jp-table mb-0">
                    <thead>
                        <tr>
                            <th>Candidate</th>
                            <th>Applied On</th>
                            <th>Resume</th>
                            <th>Status</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${applications}">
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center gap-2">
                                        <div style="width:34px;height:34px;border-radius:50%;background:linear-gradient(135deg,#6366f1,#8b5cf6);display:flex;align-items:center;justify-content:center;color:#fff;font-weight:700;font-size:0.88rem;flex-shrink:0;">
                                            ${not empty app.user ? app.user.name.substring(0,1).toUpperCase() : '?'}
                                        </div>
                                        <div>
                                            <div class="fw-semibold" style="font-size:0.88rem;">${not empty app.user ? app.user.name : 'N/A'}</div>
                                            <div style="font-size:0.73rem;color:#94a3b8;">${not empty app.user ? app.user.email : ''}</div>
                                        </div>
                                    </div>
                                </td>
                                <td style="font-size:0.8rem;color:#64748b;">${not empty app.appliedAt ? app.appliedAt.toLocalDate() : ''}</td>
                                <td>
                                    <c:if test="${not empty app.resumeUrl}">
                                        <a href="${app.resumeUrl}" target="_blank" class="btn btn-sm"
                                           style="background:#ede9fe;color:#6d28d9;border-radius:8px;font-size:0.75rem;padding:4px 10px;">
                                            <i class="fas fa-file-pdf me-1"></i>CV
                                        </a>
                                    </c:if>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${app.status == 'PENDING'}"><span class="jp-badge jp-badge-warning">Pending</span></c:when>
                                        <c:when test="${app.status == 'ACCEPTED' or app.status == 'APPROVED'}"><span class="jp-badge jp-badge-success">Accepted</span></c:when>
                                        <c:when test="${app.status == 'REJECTED'}"><span class="jp-badge jp-badge-danger">Rejected</span></c:when>
                                        <c:when test="${app.status == 'SHORTLISTED'}"><span class="jp-badge jp-badge-purple">Shortlisted</span></c:when>
                                        <c:otherwise><span class="jp-badge jp-badge-gray">${app.status}</span></c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-center">
                                    <div class="d-flex gap-1 justify-content-center">
                                        <form action="/jobprovider/update-application-status" method="POST" class="d-inline">
                                            <input type="hidden" name="id" value="${app.id}">
                                            <input type="hidden" name="status" value="SHORTLISTED">
                                            <button class="btn btn-sm" style="background:#ede9fe;color:#6d28d9;border-radius:7px;padding:4px 9px;font-size:0.75rem;" title="Shortlist"><i class="fas fa-star"></i></button>
                                        </form>
                                        <form action="/jobprovider/update-application-status" method="POST" class="d-inline">
                                            <input type="hidden" name="id" value="${app.id}">
                                            <input type="hidden" name="status" value="ACCEPTED">
                                            <button class="btn btn-sm" style="background:#dcfce7;color:#15803d;border-radius:7px;padding:4px 9px;font-size:0.75rem;" title="Accept"><i class="fas fa-check"></i></button>
                                        </form>
                                        <form action="/jobprovider/update-application-status" method="POST" class="d-inline">
                                            <input type="hidden" name="id" value="${app.id}">
                                            <input type="hidden" name="status" value="REJECTED">
                                            <button class="btn btn-sm" style="background:#fee2e2;color:#dc2626;border-radius:7px;padding:4px 9px;font-size:0.75rem;" onclick="return confirm('Reject?')" title="Reject"><i class="fas fa-times"></i></button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty applications}">
                            <tr>
                                <td colspan="5" class="text-center py-4" style="color:#94a3b8;">
                                    No applications for this job yet.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Right Column: Quick Info -->
    <div class="col-lg-4">
        <!-- Job Details Summary -->
        <div class="jp-card mb-4">
            <div class="jp-form-section-title"><i class="fas fa-clipboard-list"></i> Job Details</div>
            <ul class="list-unstyled m-0" style="font-size:0.88rem; color:#334155;">
                <li class="d-flex align-items-start gap-2 mb-3">
                    <i class="fas fa-map-marker-alt mt-1 text-primary" style="width:16px;"></i>
                    <div>
                        <div style="font-size:0.72rem;color:#94a3b8;font-weight:600;text-transform:uppercase;">Location</div>
                        <div>${not empty job.country ? job.country.name : '—'}${not empty job.city ? ', '.concat(job.city) : ''}</div>
                    </div>
                </li>
                <li class="d-flex align-items-start gap-2 mb-3">
                    <i class="fas fa-briefcase mt-1 text-primary" style="width:16px;"></i>
                    <div>
                        <div style="font-size:0.72rem;color:#94a3b8;font-weight:600;text-transform:uppercase;">Job Type</div>
                        <div>${not empty job.jobType ? job.jobType : '—'}</div>
                    </div>
                </li>
                <li class="d-flex align-items-start gap-2 mb-3">
                    <i class="fas fa-user-graduate mt-1 text-primary" style="width:16px;"></i>
                    <div>
                        <div style="font-size:0.72rem;color:#94a3b8;font-weight:600;text-transform:uppercase;">Education</div>
                        <div>${not empty job.minEducation ? job.minEducation : '—'}</div>
                    </div>
                </li>
                <li class="d-flex align-items-start gap-2 mb-3">
                    <i class="fas fa-star mt-1 text-primary" style="width:16px;"></i>
                    <div>
                        <div style="font-size:0.72rem;color:#94a3b8;font-weight:600;text-transform:uppercase;">Experience</div>
                        <div>${not empty job.experienceRequired ? job.experienceRequired : '—'}</div>
                    </div>
                </li>
                <c:if test="${not empty job.applicationDeadline}">
                <li class="d-flex align-items-start gap-2 mb-3">
                    <i class="fas fa-calendar-alt mt-1 text-danger" style="width:16px;"></i>
                    <div>
                        <div style="font-size:0.72rem;color:#94a3b8;font-weight:600;text-transform:uppercase;">Deadline</div>
                        <div style="color:#dc2626;">${job.applicationDeadline}</div>
                    </div>
                </li>
                </c:if>
                <li class="d-flex align-items-start gap-2">
                    <i class="fas fa-users mt-1 text-primary" style="width:16px;"></i>
                    <div>
                        <div style="font-size:0.72rem;color:#94a3b8;font-weight:600;text-transform:uppercase;">Openings</div>
                        <div>${not empty job.numberOfOpenings ? job.numberOfOpenings : '—'}</div>
                    </div>
                </li>
            </ul>
        </div>

        <!-- Benefits -->
        <div class="jp-card mb-4">
            <div class="jp-form-section-title"><i class="fas fa-gift"></i> Benefits & Visa</div>
            <div class="d-flex flex-wrap gap-2">
                <c:if test="${job.visaSponsorship}"><span class="jp-badge jp-badge-success"><i class="fas fa-passport me-1"></i>Visa Sponsorship</span></c:if>
                <c:if test="${job.workPermitAssistance}"><span class="jp-badge jp-badge-info"><i class="fas fa-file-contract me-1"></i>Work Permit</span></c:if>
                <c:if test="${job.relocationAssistance}"><span class="jp-badge jp-badge-purple"><i class="fas fa-plane-departure me-1"></i>Relocation</span></c:if>
                <c:if test="${job.accommodationProvided}"><span class="jp-badge jp-badge-gray"><i class="fas fa-home me-1"></i>Accommodation</span></c:if>
                <c:if test="${job.airTicketProvided}"><span class="jp-badge jp-badge-gray"><i class="fas fa-plane me-1"></i>Air Ticket</span></c:if>
                <c:if test="${job.medicalInsurance}"><span class="jp-badge jp-badge-gray"><i class="fas fa-heartbeat me-1"></i>Medical</span></c:if>
                <c:if test="${not job.visaSponsorship and not job.accommodationProvided and not job.medicalInsurance}">
                    <span class="text-muted" style="font-size:0.82rem;">No benefits listed</span>
                </c:if>
            </div>
        </div>

        <!-- Applications Quick Stats -->
        <div class="jp-card">
            <div class="jp-form-section-title"><i class="fas fa-chart-bar"></i> Application Stats</div>
            <div class="d-flex flex-column gap-3">
                <div class="d-flex justify-content-between align-items-center">
                    <span style="font-size:0.85rem;color:#64748b;">Total Applications</span>
                    <span class="fw-bold" style="color:#0f172a;">${applications.size()}</span>
                </div>
                <div style="height:1px;background:#f1f5f9;"></div>
                <a href="/jobprovider/applications" class="btn-jp-primary btn w-100 text-center">
                    <i class="fas fa-users me-2"></i> Manage All Applications
                </a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="jobprovider-footer.jsp" />
