<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Add Job - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="container py-5 mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card p-5 border-0 shadow-sm">
                <div class="text-center mb-4">
                    <h2 class="fw-bold text-success">Add Job Listing</h2>
                    <p class="text-muted">Post a new international job opportunity.</p>
                </div>
                
                <form action="/provider/add-job" method="POST">
                    <div class="row g-3">
                        <div class="col-md-12">
                            <label class="form-label fw-medium">Job Title</label>
                            <input type="text" name="title" class="form-control rounded-pill" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Country Location</label>
                            <select name="country" class="form-select rounded-pill" required>
                                <c:forEach var="country" items="${countries}">
                                    <option value="${country.id}">${country.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Expected Salary</label>
                            <input type="text" name="expectedSalary" class="form-control rounded-pill" placeholder="e.g. $80,000 - $120,000" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-medium">Skills Required</label>
                            <input type="text" name="skillsRequired" class="form-control rounded-pill" placeholder="e.g. Java, Spring Boot, React">
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-medium">Job Description</label>
                            <textarea name="description" class="form-control" rows="4" style="border-radius: 12px;"></textarea>
                        </div>
                        
                        <div class="col-12 mt-4">
                            <div class="form-check form-switch fs-6 mb-2">
                                <input class="form-check-input" type="checkbox" name="hasVisaSponsorship" value="true" id="job-visa">
                                <label class="form-check-label fw-bold" for="job-visa">Offer Visa Sponsorship</label>
                            </div>
                            <p class="text-muted small mb-2">Check this if your company provides visa sponsorship for international candidates.</p>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-medium">Visa Sponsorship Details</label>
                            <textarea name="visaSponsorshipDetails" class="form-control" rows="2" style="border-radius: 12px;" placeholder="Describe any visa support provided..."></textarea>
                        </div>
                        <div class="col-12 mt-4">
                            <button type="submit" class="btn btn-success rounded-pill px-5 w-100">Post Job</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
