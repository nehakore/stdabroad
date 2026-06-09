<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-sidebar.jsp" />

<div class="dashboard-card">
    <h5 class="fw-bold mb-4 border-bottom pb-3"><i class="fas fa-clock text-warning me-2"></i> Pending Provider Applications</h5>
    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>Organization / Agency</th>
                    <th>Contact Details</th>
                    <th>Location</th>
                    <th>Documents</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="provider" items="${unapprovedProviders}">
                    <tr>
                        <td>
                            <div class="fw-bold text-dark">${provider.organizationName}</div>
                            <div class="small text-muted"><i class="fas fa-briefcase me-1"></i> ${provider.designation}</div>
                            <div class="small text-muted"><i class="fas fa-history me-1"></i> ${provider.experience} years exp.</div>
                        </td>
                        <td>
                            <div class="fw-medium">${provider.contactName}</div>
                            <div class="small text-muted"><i class="fas fa-envelope me-1"></i> ${provider.email}</div>
                            <div class="small text-muted"><i class="fas fa-phone me-1"></i> ${provider.mobile}</div>
                        </td>
                        <td>
                            <div>${provider.city}, ${provider.state}</div>
                            <div class="small text-muted fw-bold">${provider.country}</div>
                        </td>
                        <td>
                            <button class="btn btn-sm btn-outline-primary rounded-pill shadow-sm" onclick="viewDocuments('${provider.govIdUrl}', '${provider.businessCertUrl}')">
                                <i class="fas fa-file-search me-1"></i> View Docs
                            </button>
                        </td>
                        <td>
                            <div class="d-flex justify-content-end gap-2">
                                <form action="/admin/approve-provider" method="POST" class="m-0">
                                    <input type="hidden" name="id" value="${provider.id}">
                                    <button type="submit" class="btn btn-success btn-sm rounded-pill shadow-sm px-3"><i class="fas fa-check me-1"></i> Approve</button>
                                </form>
                                <form action="/admin/reject-provider" method="POST" class="m-0" onsubmit="return confirm('Are you sure you want to reject and delete this provider application?');">
                                    <input type="hidden" name="id" value="${provider.id}">
                                    <button type="submit" class="btn btn-danger btn-sm rounded-pill shadow-sm px-3"><i class="fas fa-times me-1"></i> Reject</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty unapprovedProviders}">
                    <tr><td colspan="5" class="text-center text-muted py-5"><i class="fas fa-check-circle fs-2 text-success mb-2 d-block"></i> No pending applications. You are all caught up!</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="admin-footer.jsp" />
