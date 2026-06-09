<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Dashboard - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="container py-5 mt-4">
    <div class="d-flex justify-content-between align-items-center mb-5" data-aos="fade-down">
        <div>
            <h2 class="fw-bold text-primary">Welcome, ${sessionScope.loggedInUser.name}!</h2>
            <p class="text-muted">Manage your applications, saved items, and profile here.</p>
        </div>
    </div>

    <div class="row g-4">
        <!-- Sidebar -->
        <div class="col-md-3" data-aos="fade-right">
            <div class="card border-0 shadow-sm p-3">
                <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                    <button class="nav-link active text-start rounded-pill mb-2" data-bs-toggle="pill" data-bs-target="#profile" type="button" role="tab">
                        <i class="fas fa-user me-2"></i> Profile
                    </button>
                    <button class="nav-link text-start rounded-pill mb-2" data-bs-toggle="pill" data-bs-target="#applications" type="button" role="tab">
                        <i class="fas fa-file-alt me-2"></i> My Applications
                    </button>
                    <button class="nav-link text-start rounded-pill mb-2" data-bs-toggle="pill" data-bs-target="#saved" type="button" role="tab">
                        <i class="fas fa-bookmark me-2"></i> Saved Items
                    </button>
                </div>
            </div>
        </div>

        <!-- Content -->
        <div class="col-md-9" data-aos="fade-up">
            <div class="tab-content">
                <!-- Profile Tab -->
                <div class="tab-pane fade show active" id="profile" role="tabpanel">
                    <div class="card border-0 shadow-sm p-4">
                        <h4 class="fw-bold mb-4">Personal Information</h4>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <p class="text-muted mb-1">Full Name</p>
                                <h5>${sessionScope.loggedInUser.name}</h5>
                            </div>
                            <div class="col-md-6">
                                <p class="text-muted mb-1">Email</p>
                                <h5>${sessionScope.loggedInUser.email}</h5>
                            </div>
                            <div class="col-md-6">
                                <p class="text-muted mb-1">Phone</p>
                                <h5>${sessionScope.loggedInUser.phone}</h5>
                            </div>
                        </div>
                        <div class="mt-4 text-end">
                            <button class="btn btn-outline-primary rounded-pill px-4">Edit Profile</button>
                        </div>
                    </div>
                </div>

                <!-- Applications Tab -->
                <div class="tab-pane fade" id="applications" role="tabpanel">
                    <div class="card border-0 shadow-sm p-4">
                        <h4 class="fw-bold mb-4">My Applications</h4>
                        <c:choose>
                            <c:when test="${not empty applications}">
                                <div class="table-responsive">
                                    <table class="table table-hover align-middle">
                                        <thead>
                                            <tr>
                                                <th>Type</th>
                                                <th>Title</th>
                                                <th>Provider</th>
                                                <th>Status</th>
                                                <th>Applied On</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="app" items="${applications}">
                                                <tr>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${not empty app.job}"><span class="badge bg-success">Job</span></c:when>
                                                            <c:when test="${not empty app.course}"><span class="badge bg-primary">Course</span></c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td class="fw-medium">${not empty app.job ? app.job.title : app.course.name}</td>
                                                    <td>${not empty app.job ? app.job.provider.organizationName : app.course.university.name}</td>
                                                    <td>
                                                        <span class="badge bg-${app.status == 'PENDING' ? 'warning' : (app.status == 'ACCEPTED' ? 'success' : 'danger')}">
                                                            ${app.status}
                                                        </span>
                                                    </td>
                                                    <td>${app.appliedAt.toLocalDate()}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-5">
                                    <p class="text-muted mb-0">You have not submitted any applications yet.</p>
                                    <a href="/" class="btn btn-outline-primary rounded-pill mt-3">Start Exploring</a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Saved Items Tab -->
                <div class="tab-pane fade" id="saved" role="tabpanel">
                    <div class="card border-0 shadow-sm p-4">
                        <h4 class="fw-bold mb-4">Saved Items</h4>
                        <div class="text-center py-5">
                            <p class="text-muted mb-0">No saved items found.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
