<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-sidebar.jsp" />

<div class="dashboard-card">
    <h5 class="fw-bold mb-4 border-bottom pb-3"><i class="fas fa-award text-primary me-2"></i> Manage Scholarships</h5>
    <div class="table-responsive">
        <table class="table align-middle">
            <thead class="table-light">
                <tr>
                    <th>Title</th>
                    <th>Provider</th>
                    <th>Amount</th>
                    <th>Country</th>
                    <th>Deadline</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="scholarship" items="${scholarships}">
                    <tr>
                        <td class="fw-medium">${scholarship.title}</td>
                        <td>${scholarship.provider}</td>
                        <td><span class="badge bg-success px-2 py-1 rounded-pill">${scholarship.amount}</span></td>
                        <td>${scholarship.country.name}</td>
                        <td>${scholarship.deadline}</td>
                        <td class="text-end">
                            <button class="btn btn-sm btn-outline-danger rounded-pill"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty scholarships}">
                    <tr><td colspan="6" class="text-center py-4 text-muted">No scholarships found.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="admin-footer.jsp" />
