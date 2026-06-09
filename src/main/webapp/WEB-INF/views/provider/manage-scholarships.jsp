<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:providerLayout>
    <c:set var="activePage" value="scholarships" scope="request" />

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold mb-0">Manage Scholarships</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addScholarshipModal">
            <i class="fas fa-plus me-2"></i> Add Scholarship
        </button>
    </div>

    <div class="card border-0 shadow-sm rounded-4">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="ps-4">Title</th>
                            <th>University</th>
                            <th>Amount</th>
                            <th>Deadline</th>
                            <th class="text-end pe-4">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="scholarship" items="${scholarships}">
                            <tr>
                                <td class="ps-4 fw-medium">${scholarship.title}</td>
                                <td>${scholarship.university.name}</td>
                                <td><span class="badge bg-success">${scholarship.amount}</span></td>
                                <td>${scholarship.deadline}</td>
                                <td class="text-end pe-4">
                                    <button class="btn btn-sm btn-outline-danger"><i class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty scholarships}">
                            <tr>
                                <td colspan="5" class="text-center py-5 text-muted">No scholarships found. Add one for your university!</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Add Scholarship Modal -->
    <div class="modal fade" id="addScholarshipModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold">Add New Scholarship</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="/provider/add-scholarship" method="POST">
                    <div class="modal-body p-4">
                        <div class="row g-3">
                            <div class="col-md-12">
                                <label class="form-label">Scholarship Title</label>
                                <input type="text" name="title" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Select University</label>
                                <select name="university.id" class="form-select" required>
                                    <c:forEach var="u" items="${universities}">
                                        <option value="${u.id}">${u.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Funding Amount</label>
                                <input type="text" name="amount" class="form-control" placeholder="e.g., $10,000 or Full Tuition" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Deadline</label>
                                <input type="date" name="deadline" class="form-control" required>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Description</label>
                                <textarea name="description" class="form-control" rows="3" required></textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Eligibility Criteria</label>
                                <textarea name="eligibilityCriteria" class="form-control" rows="2" required></textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Application URL</label>
                                <input type="url" name="applicationLink" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save Scholarship</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</t:providerLayout>
