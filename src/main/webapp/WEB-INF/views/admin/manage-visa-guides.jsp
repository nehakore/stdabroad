<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="admin-sidebar.jsp" />

<div class="dashboard-card">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h5 class="fw-bold m-0"><i class="fas fa-passport text-primary me-2"></i> Manage Visa Guides</h5>
        <button class="btn btn-primary btn-sm rounded-pill px-3 shadow-sm" data-bs-toggle="modal" data-bs-target="#addVisaGuideModal">
            <i class="fas fa-plus me-2"></i> Add Guide
        </button>
    </div>
    <div class="table-responsive">
        <table class="table align-middle">
            <thead class="table-light">
                <tr>
                    <th>Country</th>
                    <th>Visa Type</th>
                    <th>Processing Time</th>
                    <th>Fee</th>
                    <th class="text-end">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="guide" items="${visaGuides}">
                    <tr>
                        <td class="fw-medium">${guide.country.name}</td>
                        <td>${guide.visaType}</td>
                        <td>${guide.processingTime}</td>
                        <td>${guide.fee}</td>
                        <td class="text-end">
                            <button class="btn btn-sm btn-outline-danger rounded-pill"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty visaGuides}">
                    <tr><td colspan="5" class="text-center py-4 text-muted">No visa guides found.</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

<!-- Add Visa Guide Modal -->
<div class="modal fade" id="addVisaGuideModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content shadow-lg border-0" style="border-radius: 16px;">
            <div class="modal-header bg-light" style="border-radius: 16px 16px 0 0;">
                <h5 class="modal-title fw-bold">Add New Visa Guide</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="/admin/add-visa-guide" method="POST">
                <div class="modal-body p-4">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Country</label>
                            <select name="country.id" class="form-select rounded-pill" required>
                                <c:forEach var="c" items="${countries}">
                                    <option value="${c.id}">${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Visa Type</label>
                            <input type="text" name="visaType" class="form-control rounded-pill" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Application Fee</label>
                            <input type="text" name="fee" class="form-control rounded-pill" placeholder="e.g., $160" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Average Processing Time</label>
                            <input type="text" name="processingTime" class="form-control rounded-pill" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-medium">Overview / Description</label>
                            <textarea name="description" class="form-control" rows="3" style="border-radius:12px;" required></textarea>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-medium">Required Documents (Use lists)</label>
                            <textarea name="requiredDocuments" class="form-control" rows="3" style="border-radius:12px;" required></textarea>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-medium">Step-by-Step Application Process</label>
                            <textarea name="applicationProcess" class="form-control" rows="3" style="border-radius:12px;" required></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer bg-light" style="border-radius: 0 0 16px 16px;">
                    <button type="button" class="btn btn-secondary rounded-pill px-4" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary rounded-pill px-4">Save Visa Guide</button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="admin-footer.jsp" />
