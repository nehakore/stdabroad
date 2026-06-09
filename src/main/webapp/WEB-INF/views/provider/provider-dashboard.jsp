<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Provider Dashboard - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="container py-5 mt-4">
    <div class="d-flex justify-content-between align-items-center mb-5" data-aos="fade-down">
        <div>
            <h2 class="fw-bold text-primary">Provider Dashboard</h2>
            <p class="text-muted">Welcome, ${sessionScope.loggedInProvider.organizationName}!</p>
        </div>
        <div>
            <c:if test="${sessionScope.loggedInProvider.type == 'University'}">
                <a href="/provider/add-university" class="btn btn-primary rounded-pill px-4"><i class="fas fa-plus me-2"></i> Add University</a>
            </c:if>
            <c:if test="${sessionScope.loggedInProvider.type == 'Company'}">
                <a href="/provider/add-job" class="btn btn-success rounded-pill px-4"><i class="fas fa-plus me-2"></i> Add Job</a>
            </c:if>
        </div>
    </div>

    <div class="row g-4">
        <!-- Overview Cards -->
        <c:if test="${sessionScope.loggedInProvider.type == 'University'}">
            <div class="col-md-12 mb-4" data-aos="fade-up">
                <div class="card border-0 shadow-sm p-4">
                    <h4 class="fw-bold mb-4">My Universities</h4>
                    <div class="row g-3">
                        <c:forEach var="uni" items="${universities}">
                            <div class="col-md-4">
                                <div class="card h-100 p-3">
                                    <h5 class="fw-bold">${uni.name}</h5>
                                    <p class="text-muted small m-0"><i class="fas fa-map-marker-alt"></i> ${uni.country.name}</p>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${empty universities}">
                            <div class="col-12 text-center text-muted py-3">No universities added yet.</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${sessionScope.loggedInProvider.type == 'Company'}">
            <div class="col-md-12 mb-4" data-aos="fade-up">
                <div class="card border-0 shadow-sm p-4">
                    <h4 class="fw-bold mb-4">My Job Listings</h4>
                    <div class="table-responsive">
                        <table class="table align-middle">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Location</th>
                                    <th>Salary</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="job" items="${jobs}">
                                    <tr>
                                        <td class="fw-medium">${job.title}</td>
                                        <td>${job.country.name}</td>
                                        <td>${job.expectedSalary}</td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty jobs}">
                                    <tr><td colspan="3" class="text-center text-muted py-3">No jobs added yet.</td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
