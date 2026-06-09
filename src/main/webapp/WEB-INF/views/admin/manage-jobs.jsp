<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-sidebar.jsp" />

<div class="dashboard-card">
    <h5 class="fw-bold mb-4 border-bottom pb-3"><i class="fas fa-list-alt text-primary me-2"></i> Active Jobs Database</h5>
    <div class="table-responsive">
        <table class="table align-middle">
            <thead class="table-light">
                <tr>
                    <th>Job Title</th>
                    <th>Company</th>
                    <th>Location</th>
                    <th>Salary</th>
                    <th>Posted Date</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="job" items="${approvedJobs}">
                    <tr>
                        <td class="fw-medium">${job.title}</td>
                        <td>${job.provider.organizationName}</td>
                        <td>${job.location}, ${job.country.name}</td>
                        <td>${job.salary}</td>
                        <td>${job.postedDate}</td>
                        <td class="text-end">
                            <button class="btn btn-sm btn-outline-danger rounded-pill shadow-sm"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty approvedJobs}">
                    <tr><td colspan="6" class="text-center py-4 text-muted">No active jobs found.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="admin-footer.jsp" />
