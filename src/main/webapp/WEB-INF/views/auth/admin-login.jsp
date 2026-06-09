<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Admin Login - Study & Jobs Abroad" />
</jsp:include>


<div class="container py-5 mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5" data-aos="fade-up">
            <div class="card p-4 border-0 shadow">
                <div class="text-center mb-4">
                    <h3 class="fw-bold text-danger"><i class="fas fa-lock"></i> Admin Portal</h3>
                    <p class="text-muted">Secure access for platform administrators.</p>
                </div>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger rounded-pill text-center py-2">
                        Invalid admin credentials.
                    </div>
                </c:if>

                <form action="/admin/login" method="POST">
                    <div class="mb-3">
                        <label class="form-label fw-medium">Admin Email</label>
                        <input type="email" name="email" class="form-control rounded-pill" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-medium">Password</label>
                        <input type="password" name="password" class="form-control rounded-pill" required>
                    </div>
                    <button type="submit" class="btn btn-danger w-100 rounded-pill mb-3">Login as Admin</button>
                    <div class="text-center">
                        <p class="text-muted m-0">Don't have an admin account? <a href="/admin/register" class="fw-bold text-danger">Register</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp">
    <jsp:param name="hideFooter" value="true" />
</jsp:include>