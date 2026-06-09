<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-sidebar.jsp" />

<div class="dashboard-card">
    <h5 class="fw-bold mb-4 border-bottom pb-3"><i class="fas fa-briefcase text-warning me-2"></i> Pending Job Listings</h5>
    <div class="table-responsive">
        <table class="table align-middle">
            <thead class="table-light">
                <tr>
                    <th>Title</th>
                    <th>Provider</th>
                    <th>Country</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="job" items="${unapprovedJobs}">
                    <tr>
                        <td class="fw-medium">${job.title}</td>
                        <td>${job.provider.organizationName}</td>
                        <td>${job.country.name}</td>
                        <td>
                            <form action="/admin/approve-job" method="POST">
                                <input type="hidden" name="id" value="${job.id}">
                                <button type="submit" class="btn btn-sm btn-success rounded-pill px-3">Approve Listing</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty unapprovedJobs}">
                    <tr><td colspan="4" class="text-center text-muted py-4">No pending job listings.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="admin-footer.jsp" />
