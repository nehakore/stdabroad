<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Scholarships - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="container pt-3 pb-5" style="min-height: 70vh;">
    <div class="d-flex justify-content-between align-items-center mb-5" data-aos="fade-down">
        <div>
            <h2 class="fw-bold text-primary">Discover Scholarships</h2>
            <p class="text-muted">Explore financial aid and scholarships available around the world.</p>
        </div>
        <div>
            <form action="/scholarships" method="GET" class="d-flex gap-2">
                <select name="countryId" class="form-select rounded-pill">
                    <option value="">All Countries</option>
                    <c:forEach var="country" items="${countries}">
                        <option value="${country.id}" ${param.countryId == country.id ? 'selected' : ''}>${country.name}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-primary rounded-pill px-4">Filter</button>
            </form>
        </div>
    </div>

    <div class="row g-4">
        <c:forEach var="scholarship" items="${scholarships}">
            <div class="col-lg-6" data-aos="fade-up">
                <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                    <div class="card-body p-4 position-relative">
                        <div class="position-absolute top-0 end-0 bg-primary text-white px-3 py-1 rounded-bl-3 fw-bold shadow-sm" style="border-bottom-left-radius: 12px;">
                            ${scholarship.amount}
                        </div>
                        <h4 class="card-title fw-bold mb-1 w-75 text-truncate" title="${scholarship.title}">${scholarship.title}</h4>
                        <p class="text-primary fw-medium mb-3"><i class="fas fa-university me-1"></i> ${scholarship.university.name} • <span class="text-dark"><i class="fas fa-map-marker-alt ms-1 me-1"></i> ${scholarship.university.country.name}</span></p>
                        
                        <p class="text-muted small mb-4" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
                            ${scholarship.description}
                        </p>
                        
                        <div class="row g-2 mb-4 small">
                            <div class="col-6">
                                <div class="p-2 bg-light rounded text-center border">
                                    <div class="text-muted mb-1"><i class="fas fa-calendar-alt me-1"></i> Deadline</div>
                                    <div class="fw-bold text-danger">${scholarship.deadline}</div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="p-2 bg-light rounded text-center border">
                                    <div class="text-muted mb-1"><i class="fas fa-check-circle me-1"></i> Eligibility</div>
                                    <div class="fw-bold text-dark text-truncate" title="${scholarship.eligibilityCriteria}">${scholarship.eligibilityCriteria}</div>
                                </div>
                            </div>
                        </div>

                        <div class="mt-auto d-flex gap-2">
                            <button class="btn btn-outline-secondary w-50" data-bs-toggle="modal" data-bs-target="#scholarshipModal${scholarship.id}">View Details</button>
                            <a href="${scholarship.applicationLink}" target="_blank" class="btn btn-primary w-50 shadow-sm">Apply Now <i class="fas fa-external-link-alt ms-1 small"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal for Scholarship Details -->
            <div class="modal fade" id="scholarshipModal${scholarship.id}" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content border-0 shadow">
                        <div class="modal-header bg-primary text-white border-0">
                            <h5 class="modal-title fw-bold">${scholarship.title}</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body p-4">
                            <div class="d-flex align-items-center mb-4">
                                <div class="bg-light p-3 rounded text-center me-4">
                                    <h4 class="text-primary fw-bold mb-0">${scholarship.amount}</h4>
                                    <small class="text-muted">Funding Amount</small>
                                </div>
                                <div>
                                    <h6 class="fw-bold mb-1"><i class="fas fa-university text-muted me-2"></i> ${scholarship.university.name}</h6>
                                    <h6 class="fw-bold mb-1"><i class="fas fa-map-marker-alt text-muted me-2"></i> ${scholarship.university.country.name}</h6>
                                    <h6 class="fw-bold mb-0 text-danger"><i class="fas fa-clock text-muted me-2"></i> Deadline: ${scholarship.deadline}</h6>
                                </div>
                            </div>
                            <h5 class="fw-bold border-bottom pb-2 mb-3">About the Scholarship</h5>
                            <p style="white-space: pre-wrap;">${scholarship.description}</p>
                            
                            <h5 class="fw-bold border-bottom pb-2 mb-3 mt-4">Eligibility Criteria</h5>
                            <p style="white-space: pre-wrap;">${scholarship.eligibilityCriteria}</p>
                        </div>
                        <div class="modal-footer bg-light border-0">
                            <button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">Close</button>
                            <a href="${scholarship.applicationLink}" target="_blank" class="btn btn-primary px-4 shadow-sm">Apply Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty scholarships}">
            <div class="col-12 text-center text-muted py-5">
                <i class="fas fa-award fa-4x mb-3 text-light"></i>
                <h5>No scholarships found at the moment.</h5>
                <p>Try clearing your filters or check back later.</p>
            </div>
        </c:if>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
