<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Provider Login - Study & Jobs Abroad" />
</jsp:include>


<div class="container py-5 mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5" data-aos="fade-up">
            <div class="card p-4 border-0 shadow-lg" style="border-radius: 16px;">
                <div class="text-center mb-4">
                    <div class="mx-auto bg-light rounded-circle d-flex align-items-center justify-content-center mb-3 text-primary shadow-sm" style="width: 70px; height: 70px; font-size: 2rem;">
                        <i class="fas fa-building"></i>
                    </div>
                    <h3 class="fw-bolder" style="color: #1E3A8A;">Provider Login</h3>
                    <p class="text-muted">Access your university or company dashboard.</p>
                </div>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger rounded-pill text-center py-2">
                        <c:choose>
                            <c:when test="${param.error == 'notApproved'}">Your account is pending admin approval.</c:when>
                            <c:otherwise>Invalid email or password.</c:otherwise>
                        </c:choose>
                    </div>
                </c:if>

                <form action="/login" method="POST">
                    <input type="hidden" name="role" value="PROVIDER">
                    <div class="mb-3">
                        <label class="form-label fw-medium">Official Email Address</label>
                        <input type="email" name="email" class="form-control bg-light border-0 px-4 py-3 rounded-pill" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-medium">Password</label>
                        <input type="password" name="password" class="form-control bg-light border-0 px-4 py-3 rounded-pill" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 rounded-pill py-3 fw-bold shadow-sm">Login as Provider</button>
                    <div class="text-center mt-4">
                        <p class="text-muted m-0">Don't have a provider account? <a href="/provider/register" class="fw-bold">Partner with us</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp">
    <jsp:param name="hideFooter" value="true" />
</jsp:include>