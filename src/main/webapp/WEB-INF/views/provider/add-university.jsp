<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:providerLayout>
    <c:set var="activePage" value="add-university" scope="request" />

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold mb-0">Add New University</h2>
        <a href="/provider/universities" class="btn btn-outline-secondary shadow-sm"><i class="fas fa-arrow-left"></i> Back to List</a>
    </div>

    <form action="/provider/universities/add" method="POST" class="needs-validation" novalidate>
        
        <div class="row g-4">
            <!-- Left Column: Main Information -->
            <div class="col-lg-8">
                
                <!-- Basic Information -->
                <div class="card border-0 shadow-sm rounded-4 mb-4">
                    <div class="card-header bg-white border-0 pt-4 pb-0 px-4">
                        <h5 class="fw-bold text-primary"><i class="fas fa-info-circle me-2"></i> Basic Information</h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-3">
                            <div class="col-md-12">
                                <label class="form-label fw-medium">University Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="name" required placeholder="e.g. Harvard University">
                                <div class="invalid-feedback">Please provide a university name.</div>
                            </div>
                            
                            <div class="col-md-6">
                                <label class="form-label fw-medium">University Type <span class="text-danger">*</span></label>
                                <select class="form-select" name="type" required>
                                    <option value="">Select Type</option>
                                    <option value="Public">Public</option>
                                    <option value="Private">Private</option>
                                    <option value="Deemed">Deemed</option>
                                    <option value="Autonomous">Autonomous</option>
                                </select>
                                <div class="invalid-feedback">Please select a type.</div>
                            </div>
                            
                            <div class="col-md-6">
                                <label class="form-label fw-medium">Established Year</label>
                                <input type="number" class="form-control" name="establishedYear" min="1000" max="2030" placeholder="e.g. 1636">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-medium">Accreditation</label>
                                <input type="text" class="form-control" name="accreditation" placeholder="e.g. NAAC A++, NBA">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-medium">Website URL <span class="text-danger">*</span></label>
                                <input type="url" class="form-control" name="website" required placeholder="https://www.example.edu">
                                <div class="invalid-feedback">Please provide a valid website URL.</div>
                            </div>

                            <div class="col-md-12">
                                <label class="form-label fw-medium">Description <span class="text-danger">*</span></label>
                                <textarea class="form-control" name="description" rows="4" required placeholder="Detailed description of the university..."></textarea>
                                <div class="invalid-feedback">Description is required.</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Location -->
                <div class="card border-0 shadow-sm rounded-4 mb-4">
                    <div class="card-header bg-white border-0 pt-4 pb-0 px-4">
                        <h5 class="fw-bold text-primary"><i class="fas fa-map-marker-alt me-2"></i> Location Details</h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-medium">Country <span class="text-danger">*</span></label>
                                <select class="form-select" name="countryId" required>
                                    <option value="">Select Country</option>
                                    <c:forEach var="c" items="${countries}">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </select>
                                <div class="invalid-feedback">Please select a country.</div>
                            </div>
                            
                            <div class="col-md-6">
                                <label class="form-label fw-medium">State / Province</label>
                                <input type="text" class="form-control" name="state" required placeholder="e.g. Massachusetts">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-medium">City</label>
                                <input type="text" class="form-control" name="city" required placeholder="e.g. Cambridge">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-medium">Postal Code</label>
                                <input type="text" class="form-control" name="postalCode" required placeholder="e.g. 02138">
                            </div>

                            <div class="col-md-12">
                                <label class="form-label fw-medium">Full Address</label>
                                <textarea class="form-control" name="address" rows="2" required placeholder="e.g. Massachusetts Hall, Cambridge..."></textarea>
                            </div>

                            <div class="col-md-12">
                                <label class="form-label fw-medium">Google Maps URL</label>
                                <input type="url" class="form-control" name="googleMapsLink" placeholder="https://maps.google.com/...">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Admissions -->
                <div class="card border-0 shadow-sm rounded-4 mb-4">
                    <div class="card-header bg-white border-0 pt-4 pb-0 px-4">
                        <h5 class="fw-bold text-primary"><i class="fas fa-graduation-cap me-2"></i> Admission Information</h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-medium">Admission Start Date</label>
                                <input type="date" class="form-control" name="admissionStartDate">
                            </div>
                            
                            <div class="col-md-6">
                                <label class="form-label fw-medium">Admission End Date</label>
                                <input type="date" class="form-control" name="admissionEndDate">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-medium">Application Fee (in USD)</label>
                                <input type="number" step="0.01" class="form-control" name="applicationFee" placeholder="e.g. 75.00">
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-medium">Entrance Exams Accepted</label>
                                <input type="text" class="form-control" name="entranceExams" placeholder="e.g. SAT, ACT, IELTS, TOEFL">
                            </div>

                            <div class="col-md-12">
                                <label class="form-label fw-medium">Required Documents</label>
                                <textarea class="form-control" name="requiredDocuments" rows="2" placeholder="e.g. Transcripts, LOR, SOP..."></textarea>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>

                <!-- Visa Assistance -->
                <div class="card border-0 shadow-sm rounded-4 mb-4">
                    <div class="card-header bg-white border-0 pt-4 pb-0 px-4">
                        <h5 class="fw-bold text-primary"><i class="fas fa-passport me-2"></i> Visa Assistance</h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-3">
                            <div class="col-12">
                                <div class="form-check form-switch fs-5 mb-2">
                                    <input class="form-check-input" type="checkbox" name="hasVisaAssistance" value="true" id="f-visa">
                                    <label class="form-check-label fw-bold" for="f-visa">Provide Visa Assistance</label>
                                </div>
                                <p class="text-muted small mb-3">Check this if your organization helps students with the visa process.</p>
                            </div>
                            <div class="col-12">
                                <label class="form-label fw-medium">Visa Assistance Details</label>
                                <textarea class="form-control" name="visaAssistanceDetails" rows="3" placeholder="Describe the visa support you offer..."></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Placements -->
                <div class="card border-0 shadow-sm rounded-4 mb-4">
                    <div class="card-header bg-white border-0 pt-4 pb-0 px-4">
                        <h5 class="fw-bold text-primary"><i class="fas fa-briefcase me-2"></i> Placement Statistics</h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-3">
                            <div class="col-md-4">
                                <label class="form-label fw-medium">Placement %</label>
                                <input type="text" class="form-control" name="placementPercentage" placeholder="e.g. 95%">
                            </div>
                            
                            <div class="col-md-4">
                                <label class="form-label fw-medium">Highest Package</label>
                                <input type="text" class="form-control" name="highestPackage" placeholder="e.g. $150,000">
                            </div>

                            <div class="col-md-4">
                                <label class="form-label fw-medium">Average Package</label>
                                <input type="text" class="form-control" name="averagePackage" placeholder="e.g. $80,000">
                            </div>

                            <div class="col-md-12">
                                <label class="form-label fw-medium">Top Recruiters</label>
                                <textarea class="form-control" name="topRecruiters" rows="2" placeholder="e.g. Google, Microsoft, Amazon..."></textarea>
                            </div>
                        </div>
                    </div>
                </div>

            </div> <!-- End Left Column -->

            <!-- Right Column: Sidebar settings -->
            <div class="col-lg-4">
                
                <!-- Contact Details -->
                <div class="card border-0 shadow-sm rounded-4 mb-4">
                    <div class="card-header bg-white border-0 pt-4 pb-0 px-4">
                        <h5 class="fw-bold text-primary"><i class="fas fa-phone me-2"></i> Contact Details</h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="mb-3">
                            <label class="form-label fw-medium">Admission Contact Person</label>
                            <input type="text" class="form-control" name="admissionContact" placeholder="Name of contact">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-medium">Email Address <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" name="email" required placeholder="admission@university.edu">
                            <div class="invalid-feedback">Valid email required.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-medium">Phone Number <span class="text-danger">*</span></label>
                            <input type="tel" class="form-control" name="phone" required placeholder="+1 123 456 7890">
                            <div class="invalid-feedback">Phone number required.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-medium">WhatsApp Number</label>
                            <input type="tel" class="form-control" name="whatsapp" placeholder="+1 123 456 7890">
                        </div>
                    </div>
                </div>

                <!-- Media Uploads (Simulated with URLs for now) -->
                <div class="card border-0 shadow-sm rounded-4 mb-4">
                    <div class="card-header bg-white border-0 pt-4 pb-0 px-4">
                        <h5 class="fw-bold text-primary"><i class="fas fa-images me-2"></i> Media URLs</h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="mb-3">
                            <label class="form-label fw-medium">University Logo URL <span class="text-danger">*</span></label>
                            <input type="url" class="form-control" name="imageUrl" required placeholder="https://...">
                            <div class="invalid-feedback">Logo URL required.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-medium">Banner Image URL</label>
                            <input type="url" class="form-control" name="bannerImage" placeholder="https://...">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-medium">Campus Video URL</label>
                            <input type="url" class="form-control" name="campusVideoUrl" placeholder="YouTube/Vimeo link">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-medium">Brochure PDF URL</label>
                            <input type="url" class="form-control" name="brochureUrl" placeholder="https://...">
                        </div>
                    </div>
                </div>

                <!-- Facilities -->
                <div class="card border-0 shadow-sm rounded-4 mb-4">
                    <div class="card-header bg-white border-0 pt-4 pb-0 px-4">
                        <h5 class="fw-bold text-primary"><i class="fas fa-building me-2"></i> Facilities</h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-2">
                            <div class="col-6">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="hasHostel" value="true" id="f-hostel">
                                    <label class="form-check-label" for="f-hostel">Hostel</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="hasLibrary" value="true" id="f-library">
                                    <label class="form-check-label" for="f-library">Library</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="hasSports" value="true" id="f-sports">
                                    <label class="form-check-label" for="f-sports">Sports</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="hasPlacementSupport" value="true" id="f-placement">
                                    <label class="form-check-label" for="f-placement">Placement</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="hasTransport" value="true" id="f-transport">
                                    <label class="form-check-label" for="f-transport">Transport</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="hasWifi" value="true" id="f-wifi">
                                    <label class="form-check-label" for="f-wifi">WiFi</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="hasLabs" value="true" id="f-labs">
                                    <label class="form-check-label" for="f-labs">Labs</label>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="hasCafeteria" value="true" id="f-cafeteria">
                                    <label class="form-check-label" for="f-cafeteria">Cafeteria</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Submit Area -->
                <div class="card border-0 shadow-sm rounded-4 bg-light">
                    <div class="card-body p-4 text-center">
                        <button type="submit" class="btn btn-primary btn-lg w-100 mb-2 fw-bold shadow"><i class="fas fa-save me-2"></i> Save University</button>
                        <p class="small text-muted mb-0">University will be pending admin approval after submission.</p>
                    </div>
                </div>

            </div> <!-- End Right Column -->
        </div>
    </form>

</t:providerLayout>

<script>
    // Bootstrap form validation script
    (function () {
      'use strict'
      var forms = document.querySelectorAll('.needs-validation')
      Array.prototype.slice.call(forms)
        .forEach(function (form) {
          form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
              event.preventDefault()
              event.stopPropagation()
              
              // Scroll to first invalid element
              const firstInvalid = form.querySelector(':invalid');
              if(firstInvalid) {
                  firstInvalid.scrollIntoView({behavior: 'smooth', block: 'center'});
              }
            }
            form.classList.add('was-validated')
          }, false)
        })
    })()
</script>
