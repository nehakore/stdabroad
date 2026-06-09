<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top shadow-sm py-3">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="/">
            <i class="fas fa-globe-americas text-primary fs-3 me-2"></i>
            <div>
                <span class="fw-bold fs-4 text-dark mb-0 d-block" style="line-height: 1;">Study & Jobs Abroad</span>
                <small class="text-muted" style="font-size: 0.7rem; letter-spacing: 1px;">STUDY. WORK. SUCCEED ABROAD.</small>
            </div>
        </a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto fw-medium">
                <li class="nav-item"><a class="nav-link text-dark px-3" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link text-dark px-3" href="/universities">Study Abroad</a></li>
                <li class="nav-item"><a class="nav-link text-dark px-3" href="/jobs">Jobs Abroad</a></li>
                <li class="nav-item"><a class="nav-link text-dark px-3" href="/countries">Countries</a></li>
                <li class="nav-item"><a class="nav-link text-dark px-3" href="/scholarships">Scholarships</a></li>
                <li class="nav-item"><a class="nav-link text-dark px-3" href="/visa-guide">Visa Guide</a></li>
            </ul>
            <div class="d-flex gap-2">
                <c:choose>
                    <c:when test="${empty sessionScope.loggedInUser && empty sessionScope.loggedInProvider && empty sessionScope.loggedInAdmin}">
                        <a href="/login" class="btn btn-outline-primary rounded-pill px-4 fw-semibold">Login</a>
                        <a href="/register" class="btn btn-primary rounded-pill px-4 fw-semibold shadow-sm">Register</a>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${not empty sessionScope.loggedInUser}">
                                <a href="/user/dashboard" class="btn btn-primary rounded-pill px-4 fw-semibold shadow-sm"><i class="fas fa-user me-2"></i> Dashboard</a>
                            </c:when>
                            <c:when test="${not empty sessionScope.loggedInProvider}">
                                <a href="/provider/dashboard" class="btn btn-primary rounded-pill px-4 fw-semibold shadow-sm"><i class="fas fa-building me-2"></i> Dashboard</a>
                            </c:when>
                            <c:when test="${not empty sessionScope.loggedInAdmin}">
                                <a href="/admin/dashboard" class="btn btn-danger rounded-pill px-4 fw-semibold shadow-sm"><i class="fas fa-shield-alt me-2"></i> Admin Panel</a>
                            </c:when>
                        </c:choose>
                        <a href="/logout" class="btn btn-outline-danger rounded-pill px-3 fw-semibold"><i class="fas fa-sign-out-alt"></i></a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>
