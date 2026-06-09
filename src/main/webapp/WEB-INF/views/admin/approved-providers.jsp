<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-sidebar.jsp" />

<div class="dashboard-card">
    <h5 class="fw-bold mb-4 border-bottom pb-3"><i class="fas fa-check-double text-success me-2"></i> Approved Providers Network</h5>
    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>Organization / Agency</th>
                    <th>Contact Name</th>
                    <th>Email & Mobile</th>
                    <th>Location</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="provider" items="${approvedProviders}">
                    <tr>
                        <td>
                            <div class="fw-bold text-dark">${provider.organizationName}</div>
                            <div class="small text-muted">${provider.website}</div>
                        </td>
                        <td class="fw-medium">${provider.contactName}</td>
                        <td>
                            <div>${provider.email}</div>
                            <div class="small text-muted">${provider.mobile}</div>
                        </td>
                        <td>${provider.city}, ${provider.country}</td>
                        <td><span class="badge bg-success rounded-pill px-3 py-2"><i class="fas fa-check me-1"></i> Active</span></td>
                    </tr>
                </c:forEach>
                <c:if test="${empty approvedProviders}">
                    <tr><td colspan="5" class="text-center text-muted py-5">No approved providers found in the system.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="admin-footer.jsp" />
