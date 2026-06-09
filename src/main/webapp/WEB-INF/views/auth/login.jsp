<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Login - Study & Jobs Abroad" />
</jsp:include>


<div class="container py-5 mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5" data-aos="fade-up">
            <div class="card p-4 border-0 shadow">
                <div class="text-center mb-4">
                    <h3 class="fw-bold text-primary">Welcome Back</h3>
                    <p class="text-muted">Login to continue your journey.</p>
                </div>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger rounded-pill text-center py-2">
                        <c:choose>
                            <c:when test="${param.error == 'notApproved'}">Your account is pending admin approval.</c:when>
                            <c:otherwise>Invalid email or password.</c:otherwise>
                        </c:choose>
                    </div>
                </c:if>
                <c:if test="${param.alert == 'login_required'}">
                    <div class="alert alert-warning rounded-pill text-center py-2">
                        <i class="fas fa-exclamation-circle"></i> Please login or register to apply or enquire.
                    </div>
                </c:if>
                <c:if test="${param.registered != null}">
                    <div class="alert alert-success rounded-pill text-center py-2">Registration successful! Please login.</div>
                </c:if>
                <c:if test="${param.registeredProvider != null}">
                    <div class="alert alert-success rounded-pill text-center py-2">Provider registration successful! Please wait for admin approval to login.</div>
                </c:if>

                <form action="/login" method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-medium">Email Address</label>
                        <input type="email" name="email" class="form-control rounded-pill" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-medium">Password</label>
                        <input type="password" name="password" class="form-control rounded-pill" required>
                    </div>
                    <input type="hidden" name="role" value="USER">
                    <button type="submit" class="btn btn-primary w-100 rounded-pill mb-3">Login</button>
                    <div class="text-center">
                        <p class="text-muted m-0">Don't have an account? <a href="/register" class="fw-bold">Sign up</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp">
    <jsp:param name="hideFooter" value="true" />
</jsp:include>