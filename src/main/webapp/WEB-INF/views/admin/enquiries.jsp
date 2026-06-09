<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-sidebar.jsp" />

<div class="dashboard-card">
    <h5 class="fw-bold mb-4 border-bottom pb-3"><i class="fas fa-headset text-primary me-2"></i> User Enquiries Dashboard</h5>
    <div class="table-responsive">
        <table class="table align-middle">
            <thead class="table-light">
                <tr>
                    <th>User Info</th>
                    <th>Type</th>
                    <th>Message Details</th>
                    <th>Status Manager</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="enq" items="${enquiries}">
                    <tr>
                        <td>
                            <div class="fw-bold">${enq.name}</div>
                            <div class="small text-muted"><a href="mailto:${enq.email}">${enq.email}</a></div>
                        </td>
                        <td><span class="badge bg-primary shadow-sm">${enq.type}</span></td>
                        <td><div style="max-width:300px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${enq.message}</div></td>
                        <td>
                            <form action="/admin/update-enquiry-status" method="POST" class="d-flex gap-2">
                                <input type="hidden" name="id" value="${enq.id}">
                                <select name="status" class="form-select form-select-sm rounded-pill" style="width: 140px;">
                                    <option value="New" ${enq.status == 'New' ? 'selected' : ''}>New</option>
                                    <option value="Contacted" ${enq.status == 'Contacted' ? 'selected' : ''}>Contacted</option>
                                    <option value="In Progress" ${enq.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                                    <option value="Closed" ${enq.status == 'Closed' ? 'selected' : ''}>Closed</option>
                                </select>
                                <button type="submit" class="btn btn-sm btn-dark rounded-pill px-3">Update</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty enquiries}">
                    <tr><td colspan="4" class="text-center text-muted py-4">No user enquiries found.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="admin-footer.jsp" />
