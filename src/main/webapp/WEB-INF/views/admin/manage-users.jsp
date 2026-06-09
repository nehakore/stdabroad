<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-sidebar.jsp" />

<div class="dashboard-card">
    <h5 class="fw-bold mb-4 border-bottom pb-3"><i class="fas fa-users text-primary me-2"></i> Manage Users</h5>
    <div class="table-responsive">
        <table class="table align-middle">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Role</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="u" items="${users}">
                    <tr>
                        <td>${u.id}</td>
                        <td class="fw-medium">${u.name}</td>
                        <td>${u.email}</td>
                        <td>${u.phone}</td>
                        <td><span class="badge bg-primary px-2 py-1 rounded-pill">${u.role}</span></td>
                    </tr>
                </c:forEach>
                <c:if test="${empty users}">
                    <tr><td colspan="5" class="text-center text-muted py-4">No users found.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="admin-footer.jsp" />
