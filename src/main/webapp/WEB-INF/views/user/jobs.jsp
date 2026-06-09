<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Jobs - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="container py-5 mt-4">
    <div class="d-flex justify-content-between align-items-center mb-5" data-aos="fade-down">
        <div>
            <h2 class="fw-bold text-primary">Global Jobs</h2>
            <p class="text-muted">Find amazing career opportunities worldwide.</p>
        </div>
    </div>

    <div class="row g-4">
        <c:forEach var="job" items="${jobs}">
            <div class="col-md-6" data-aos="fade-up">
                <div class="card p-4 border-0 shadow-sm h-100">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <div>
                            <h4 class="fw-bold mb-1">${job.title}</h4>
                            <p class="text-primary fw-medium m-0"><i class="fas fa-building"></i> ${job.provider.organizationName}</p>
                        </div>
                        <span class="badge bg-success rounded-pill px-3 py-2"><i class="fas fa-map-marker-alt"></i> ${job.country.name}</span>
                    </div>
                    <c:if test="${job.hasVisaSponsorship}">
                        <div class="mb-3">
                            <span class="badge bg-info text-dark" title="${job.visaSponsorshipDetails}"><i class="fas fa-passport"></i> Visa Sponsorship Available</span>
                        </div>
                    </c:if>
                    <p class="text-muted">${job.description}</p>
                    <div class="d-flex flex-wrap gap-2 mb-4">
                        <span class="badge bg-light text-dark border"><i class="fas fa-dollar-sign text-success"></i> ${job.expectedSalary}</span>
                        <span class="badge bg-light text-dark border"><i class="fas fa-code text-primary"></i> ${job.skillsRequired}</span>
                    </div>
                    <div class="mt-auto text-end">
                        <c:choose>
                            <c:when test="${empty sessionScope.loggedInUser}">
                                <a href="/login?alert=login_required" class="btn btn-outline-primary rounded-pill px-4">Apply Now</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/user/apply-job?id=${job.id}" class="btn btn-primary rounded-pill px-4 shadow-sm">Apply Now</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty jobs}">
            <div class="col-12 text-center text-muted py-5">
                <i class="fas fa-briefcase fa-4x mb-3 text-light"></i>
                <h5>No jobs currently available.</h5>
            </div>
        </c:if>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
