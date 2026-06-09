<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-sidebar.jsp" />

<div class="row g-4">
    <div class="col-md-4">
        <div class="dashboard-card h-100">
            <h5 class="fw-bold mb-3">Add New Country</h5>
            <form action="/admin/add-country" method="POST">
                <div class="mb-3">
                    <label class="form-label fw-medium">Country Name</label>
                    <input type="text" name="name" class="form-control rounded-pill" required>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-medium">Image URL</label>
                    <input type="url" name="imageUrl" class="form-control rounded-pill">
                </div>
                <div class="mb-3">
                    <label class="form-label fw-medium">Description</label>
                    <textarea name="description" class="form-control" rows="3" style="border-radius:12px;"></textarea>
                </div>
                <button type="submit" class="btn btn-primary w-100 rounded-pill">Add Country</button>
            </form>
        </div>
    </div>
    <div class="col-md-8">
        <div class="dashboard-card h-100">
            <h5 class="fw-bold mb-3">Existing Countries</h5>
            <div class="table-responsive">
                <table class="table align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="country" items="${countries}">
                            <tr>
                                <td class="fw-medium">${country.name}</td>
                                <td>${country.description}</td>
                                <td class="text-end">
                                    <form action="/admin/delete-country" method="POST" onsubmit="return confirm('Are you sure you want to delete ${country.name}? This cannot be undone.');">
                                        <input type="hidden" name="id" value="${country.id}">
                                        <button type="submit" class="btn btn-sm btn-outline-danger rounded-pill"><i class="fas fa-trash me-1"></i> Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty countries}">
                            <tr><td colspan="3" class="text-center text-muted py-4">No countries added yet.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="admin-footer.jsp" />
