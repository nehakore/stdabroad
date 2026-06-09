<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-sidebar.jsp" />

<div class="dashboard-card">
    <h5 class="fw-bold mb-4 border-bottom pb-3"><i class="fas fa-graduation-cap text-primary me-2"></i> Active Universities Database</h5>
    <div class="table-responsive">
        <table class="table align-middle">
            <thead class="table-light">
                <tr>
                    <th>University Name</th>
                    <th>Provider Agency</th>
                    <th>Location</th>
                    <th>Ranking</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="uni" items="${approvedUniversities}">
                    <tr>
                        <td class="fw-medium">${uni.name}</td>
                        <td>${uni.provider.organizationName}</td>
                        <td>${uni.city}, ${uni.country.name}</td>
                        <td>${uni.ranking}</td>
                        <td class="text-end">
                            <button class="btn btn-sm btn-outline-danger rounded-pill shadow-sm"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty approvedUniversities}">
                    <tr><td colspan="5" class="text-center py-4 text-muted">No active universities found.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="admin-footer.jsp" />
