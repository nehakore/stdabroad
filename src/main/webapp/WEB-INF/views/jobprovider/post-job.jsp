<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="jobprovider-sidebar.jsp" />

<c:if test="${not empty successMsg}">
    <div class="success-toast"><i class="fas fa-check-circle fs-5"></i> ${successMsg}</div>
</c:if>

<form action="/jobprovider/post-job" method="POST">
    <input type="hidden" name="type" value="Company">

    <!-- Section 1: Basic Info -->
    <div class="jp-form-section">
        <div class="jp-form-section-title"><i class="fas fa-info-circle"></i> Basic Job Information</div>
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Job Title <span class="text-danger">*</span></label>
                <input type="text" name="title" class="form-control" placeholder="e.g. Senior Software Engineer" required>
            </div>
            <div class="col-md-3">
                <label class="form-label">Job Category</label>
                <select name="jobCategory" class="form-select">
                    <option value="">Select Category</option>
                    <option>Engineering & Technology</option>
                    <option>Healthcare & Medicine</option>
                    <option>Finance & Accounting</option>
                    <option>Sales & Marketing</option>
                    <option>Education & Training</option>
                    <option>Hospitality & Tourism</option>
                    <option>Construction & Trades</option>
                    <option>Logistics & Supply Chain</option>
                    <option>Agriculture & Farming</option>
                    <option>Domestic & Care</option>
                    <option>Other</option>
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label">Job Type <span class="text-danger">*</span></label>
                <select name="jobType" class="form-select" required>
                    <option value="">Select Type</option>
                    <option>Full Time</option>
                    <option>Part Time</option>
                    <option>Contract</option>
                    <option>Internship</option>
                    <option>Seasonal</option>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Industry</label>
                <input type="text" name="industry" class="form-control" placeholder="e.g. Information Technology">
            </div>
            <div class="col-md-3">
                <label class="form-label">No. of Openings</label>
                <input type="number" name="numberOfOpenings" class="form-control" min="1" placeholder="1">
            </div>
            <div class="col-md-3">
                <label class="form-label">Job Status</label>
                <select name="status" class="form-select">
                    <option value="DRAFT">Save as Draft</option>
                    <option value="PUBLISHED">Publish Now</option>
                </select>
            </div>
        </div>
    </div>

    <!-- Section 2: Location -->
    <div class="jp-form-section">
        <div class="jp-form-section-title"><i class="fas fa-map-marker-alt"></i> Job Location</div>
        <div class="row g-3">
            <div class="col-md-4">
                <label class="form-label">Country <span class="text-danger">*</span></label>
                <select name="countryId" class="form-select" required>
                    <option value="">Select Country</option>
                    <c:forEach var="c" items="${countries}">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label">State / Region</label>
                <input type="text" name="state" class="form-control" placeholder="e.g. Dubai">
            </div>
            <div class="col-md-4">
                <label class="form-label">City</label>
                <input type="text" name="city" class="form-control" placeholder="e.g. Dubai City">
            </div>
            <div class="col-md-6">
                <label class="form-label">Work Location (Area/Address)</label>
                <input type="text" name="description" class="form-control" placeholder="e.g. Business Bay, Tower A">
            </div>
            <div class="col-md-6">
                <label class="form-label">Work Mode</label>
                <select name="workMode" class="form-select">
                    <option value="Onsite">Onsite</option>
                    <option value="Remote">Remote</option>
                    <option value="Hybrid">Hybrid</option>
                </select>
            </div>
        </div>
    </div>

    <!-- Section 3: Salary -->
    <div class="jp-form-section">
        <div class="jp-form-section-title"><i class="fas fa-money-bill-wave"></i> Salary & Compensation</div>
        <div class="row g-3">
            <div class="col-md-3">
                <label class="form-label">Currency</label>
                <select name="currency" class="form-select">
                    <option>USD</option><option>AED</option><option>GBP</option>
                    <option>EUR</option><option>AUD</option><option>CAD</option>
                    <option>SGD</option><option>QAR</option><option>SAR</option><option>INR</option>
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label">Min Salary (Monthly)</label>
                <input type="text" name="minSalary" class="form-control" placeholder="e.g. 3000">
            </div>
            <div class="col-md-3">
                <label class="form-label">Max Salary (Monthly)</label>
                <input type="text" name="maxSalary" class="form-control" placeholder="e.g. 6000">
            </div>
            <div class="col-md-3">
                <label class="form-label">Expected Salary (Display)</label>
                <input type="text" name="expectedSalary" class="form-control" placeholder="e.g. AED 4,000–6,000/month">
            </div>
            <div class="col-md-6 d-flex gap-4 align-items-center pt-2">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="overtimeAvailable" id="overtime" value="true">
                    <label class="form-check-label fw-semibold" for="overtime">Overtime Available</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="bonusAvailable" id="bonus" value="true">
                    <label class="form-check-label fw-semibold" for="bonus">Bonus Available</label>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 4: Job Description -->
    <div class="jp-form-section">
        <div class="jp-form-section-title"><i class="fas fa-file-alt"></i> Job Description</div>
        <div class="row g-3">
            <div class="col-12">
                <label class="form-label">Job Summary <span class="text-danger">*</span></label>
                <textarea name="jobSummary" class="form-control" rows="3" placeholder="Brief overview of the role and company..." required></textarea>
            </div>
            <div class="col-md-6">
                <label class="form-label">Key Responsibilities</label>
                <textarea name="responsibilities" class="form-control" rows="4" placeholder="List the main responsibilities..."></textarea>
            </div>
            <div class="col-md-6">
                <label class="form-label">Daily Tasks</label>
                <textarea name="dailyTasks" class="form-control" rows="4" placeholder="What will the candidate do daily?"></textarea>
            </div>
            <div class="col-md-6">
                <label class="form-label">Required Skills <span class="text-danger">*</span></label>
                <textarea name="requiredSkills" class="form-control" rows="3" placeholder="e.g. Python, SQL, Communication..." required></textarea>
            </div>
            <div class="col-md-6">
                <label class="form-label">Preferred / Nice-to-have Skills</label>
                <textarea name="preferredSkills" class="form-control" rows="3" placeholder="Additional skills that are a bonus..."></textarea>
            </div>
        </div>
    </div>

    <!-- Section 5: Eligibility -->
    <div class="jp-form-section">
        <div class="jp-form-section-title"><i class="fas fa-user-graduate"></i> Eligibility Criteria</div>
        <div class="row g-3">
            <div class="col-md-4">
                <label class="form-label">Minimum Education</label>
                <select name="minEducation" class="form-select">
                    <option value="">Any</option>
                    <option>High School / 12th</option>
                    <option>Diploma</option>
                    <option>Bachelor's Degree</option>
                    <option>Master's Degree</option>
                    <option>Doctorate / PhD</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label">Required Degree / Field</label>
                <input type="text" name="requiredDegree" class="form-control" placeholder="e.g. B.Tech Computer Science">
            </div>
            <div class="col-md-4">
                <label class="form-label">Experience Required</label>
                <select name="experienceRequired" class="form-select">
                    <option value="">Any</option>
                    <option>Fresher / 0 years</option>
                    <option>1–2 years</option>
                    <option>3–5 years</option>
                    <option>5–10 years</option>
                    <option>10+ years</option>
                </select>
            </div>
            <div class="col-md-4">
                <label class="form-label">Age Limit (Optional)</label>
                <input type="text" name="ageLimit" class="form-control" placeholder="e.g. 21–45 years">
            </div>
            <div class="col-md-4">
                <label class="form-label">Language Requirements</label>
                <input type="text" name="languageRequirements" class="form-control" placeholder="e.g. English (B2), Arabic preferred">
            </div>
            <div class="col-md-4">
                <label class="form-label">Certifications Required</label>
                <input type="text" name="certificationsRequired" class="form-control" placeholder="e.g. AWS Certified, PMP">
            </div>
        </div>
    </div>

    <!-- Section 6: Visa & Benefits -->
    <div class="jp-form-section">
        <div class="jp-form-section-title"><i class="fas fa-passport"></i> Visa, Immigration & Benefits</div>
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Visa Type Offered</label>
                <input type="text" name="visaType" class="form-control" placeholder="e.g. Work Permit, Employment Visa">
            </div>
            <div class="col-12">
                <label class="form-label fw-semibold mb-2">Benefits Provided</label>
                <div class="d-flex flex-wrap gap-4">
                    <div class="form-check"><input type="checkbox" class="form-check-input" name="visaSponsorship" id="visa" value="true"><label class="form-check-label" for="visa">Visa Sponsorship</label></div>
                    <div class="form-check"><input type="checkbox" class="form-check-input" name="workPermitAssistance" id="wpa" value="true"><label class="form-check-label" for="wpa">Work Permit Assistance</label></div>
                    <div class="form-check"><input type="checkbox" class="form-check-input" name="relocationAssistance" id="relo" value="true"><label class="form-check-label" for="relo">Relocation Assistance</label></div>
                    <div class="form-check"><input type="checkbox" class="form-check-input" name="accommodationProvided" id="accom" value="true"><label class="form-check-label" for="accom">Accommodation Provided</label></div>
                    <div class="form-check"><input type="checkbox" class="form-check-input" name="airTicketProvided" id="air" value="true"><label class="form-check-label" for="air">Air Ticket Provided</label></div>
                    <div class="form-check"><input type="checkbox" class="form-check-input" name="medicalInsurance" id="med" value="true"><label class="form-check-label" for="med">Medical Insurance</label></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Section 7: Documents & Process -->
    <div class="jp-form-section">
        <div class="jp-form-section-title"><i class="fas fa-folder-open"></i> Required Documents & Application Process</div>
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Required Documents</label>
                <div class="d-flex flex-wrap gap-3">
                    <c:forEach var="doc" items="${['Passport','Resume / CV','Degree Certificates','Experience Letters','IELTS Score','TOEFL Score','Police Clearance','Medical Certificate']}">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" name="documentsRequired" value="${doc}">
                            <label class="form-check-label">${doc}</label>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-6">
                <label class="form-label">Application Deadline</label>
                <input type="date" name="applicationDeadline" class="form-control">
                <label class="form-label mt-3">Interview Process</label>
                <input type="text" name="interviewProcess" class="form-control" placeholder="e.g. Online screening → HR round → Technical">
                <label class="form-label mt-3">Expected Joining Date</label>
                <input type="text" name="expectedJoiningDate" class="form-control" placeholder="e.g. Immediately / 30 days">
                <label class="form-label mt-3">Recruitment Fee (if any)</label>
                <input type="text" name="recruitmentFee" class="form-control" placeholder="e.g. No fee / Agency fee: AED 500">
            </div>
        </div>
    </div>

    <!-- Submit -->
    <div class="jp-card d-flex justify-content-between align-items-center">
        <div>
            <h6 class="fw-bold m-0">Ready to post?</h6>
            <p class="text-muted m-0" style="font-size:0.82rem;">Job will be reviewed by admin before going live.</p>
        </div>
        <div class="d-flex gap-2">
            <a href="/jobprovider/my-jobs" class="btn-jp-outline btn">Cancel</a>
            <button type="submit" class="btn-jp-primary btn"><i class="fas fa-paper-plane me-2"></i> Submit Job Post</button>
        </div>
    </div>

</form>

<jsp:include page="jobprovider-footer.jsp" />
