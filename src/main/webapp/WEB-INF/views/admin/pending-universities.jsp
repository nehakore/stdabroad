<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-sidebar.jsp" />

<div class="dashboard-card">
    <h5 class="fw-bold mb-4 border-bottom pb-3"><i class="fas fa-university text-warning me-2"></i> Pending University Listings</h5>
    <div class="table-responsive">
        <table class="table align-middle">
            <thead class="table-light">
                <tr>
                    <th>Name</th>
                    <th>Provider</th>
                    <th>Country</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="uni" items="${unapprovedUniversities}">
                    <tr>
                        <td class="fw-medium">${uni.name}</td>
                        <td>${uni.provider.organizationName}</td>
                        <td>${uni.country.name}</td>
                        <td>
                            <form action="/admin/approve-university" method="POST">
                                <input type="hidden" name="id" value="${uni.id}">
                                <button type="submit" class="btn btn-sm btn-success rounded-pill px-3">Approve University</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty unapprovedUniversities}">
                    <tr><td colspan="4" class="text-center text-muted py-4">No pending university listings.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="admin-footer.jsp" />
