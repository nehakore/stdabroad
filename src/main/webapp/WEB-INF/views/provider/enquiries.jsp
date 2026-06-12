<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:providerLayout>
    <c:set var="activePage" value="enquiries" scope="request" />

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold mb-0">Student Enquiries</h2>
    </div>

    <c:if test="${not empty successMsg}">
        <div class="alert alert-success alert-dismissible fade show shadow-sm mb-4" role="alert">
            <i class="fas fa-check-circle me-2"></i> ${successMsg}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty errorMsg}">
        <div class="alert alert-danger alert-dismissible fade show shadow-sm mb-4" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i> ${errorMsg}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="ps-4">Student</th>
                            <th>Contact</th>
                            <th>University</th>
                            <th>Course</th>
                            <th>Status</th>
                            <th class="text-end pe-4">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="e" items="${enquiries}">
                            <tr>
                                <td class="ps-4 fw-medium">${e.name}</td>
                                <td><a href="mailto:${e.email}" class="text-decoration-none">${e.email}</a><br><small class="text-muted"><i class="fas fa-phone-alt me-1"></i> ${e.phone}</small></td>
                                <td>${e.university.name}</td>
                                <td>${e.course != null ? e.course.name : '-'}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${e.status == 'New' || e.status == 'PENDING'}">
                                            <span class="badge bg-warning text-dark">${e.status}</span>
                                        </c:when>
                                        <c:when test="${e.status == 'Replied'}">
                                            <span class="badge bg-info text-dark">${e.status}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-success">${e.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-end pe-4">
                                    <button class="btn btn-sm btn-outline-info" data-bs-toggle="modal" data-bs-target="#enquiryModal${e.id}">
                                        <i class="fas fa-eye me-1"></i> View Message
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty enquiries}">
                            <tr>
                                <td colspan="6" class="text-center py-5 text-muted">
                                    <i class="fas fa-inbox fa-3x mb-3 text-light"></i><br>
                                    No student enquiries received yet.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Modals (placed outside layout constraints) -->
    <c:forEach var="e" items="${enquiries}">
        <div class="modal fade" id="enquiryModal${e.id}" tabindex="-1" aria-labelledby="enquiryModalLabel${e.id}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border-0 shadow">
                    <div class="modal-header bg-light">
                        <h5 class="modal-title fw-bold" id="enquiryModalLabel${e.id}">Enquiry from ${e.name}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <small class="text-muted d-block fw-bold mb-1">Contact Details</small>
                            <div><i class="fas fa-envelope text-primary me-2"></i> ${e.email}</div>
                            <div><i class="fas fa-phone-alt text-primary me-2"></i> ${e.phone}</div>
                        </div>
                        <div class="mb-3">
                            <small class="text-muted d-block fw-bold mb-1">University</small>
                            <div>${e.university.name}</div>
                        </div>
                        <div class="bg-light p-3 rounded border mb-3">
                            <small class="text-muted d-block fw-bold mb-2">Message Content</small>
                            <p class="mb-0 text-dark" style="white-space: pre-wrap;">${e.message}</p>
                        </div>
                        
                        <c:if test="${not empty e.reply}">
                            <div class="bg-light p-3 rounded border border-info mb-3">
                                <small class="text-info d-block fw-bold mb-2"><i class="fas fa-reply me-1"></i> Your Previous Reply</small>
                                <p class="mb-0 text-dark" style="white-space: pre-wrap;">${e.reply}</p>
                            </div>
                        </c:if>

                        <form action="/provider/enquiries/reply" method="POST" class="mt-3">
                            <input type="hidden" name="id" value="${e.id}" />
                            <div class="mb-3">
                                <label class="form-label fw-bold text-muted small mb-1">
                                    <c:choose>
                                        <c:when test="${not empty e.reply}">Update Reply</c:when>
                                        <c:otherwise>Write a Reply</c:otherwise>
                                    </c:choose>
                                </label>
                                <textarea name="reply" class="form-control" rows="3" placeholder="Type your response to the student here..." required>${e.reply}</textarea>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn btn-primary btn-sm px-3">
                                    <i class="fas fa-paper-plane me-1"></i> Send Reply
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer bg-light border-top-0">
                        <button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">Close</button>
                        <a href="mailto:${e.email}" class="btn btn-primary px-4"><i class="fas fa-reply me-2"></i> Reply via Email</a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</t:providerLayout>
