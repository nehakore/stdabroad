<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="University Provider Registration - Study Abroad" />
</jsp:include>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
    body {
        background-color: #f3f4f6;
        font-family: 'Inter', sans-serif;
        color: #374151;
    }
    
    .registration-card {
        border-radius: 24px;
        overflow: hidden;
        border: none;
        box-shadow: 0 20px 40px rgba(0,0,0,0.08);
        background: #ffffff;
        min-height: 600px;
    }
    
    .bg-gradient-primary {
        background: linear-gradient(135deg, #1e3a8a 0%, #2563eb 100%);
        position: relative;
    }
    
    .bg-gradient-primary::before {
        content: '';
        position: absolute;
        top: 0; left: 0; right: 0; bottom: 0;
        background-image: radial-gradient(circle at 2px 2px, rgba(255,255,255,0.1) 1px, transparent 0);
        background-size: 32px 32px;
        opacity: 0.5;
    }
    
    .left-panel-content {
        position: relative;
        z-index: 2;
    }

    .form-control, .form-select {
        border-radius: 10px;
        padding: 12px 16px;
        background-color: #f9fafb;
        border: 1px solid #e5e7eb;
        font-size: 0.95rem;
        transition: all 0.25s ease;
    }
    
    .form-control:focus, .form-select:focus {
        background-color: #ffffff;
        border-color: #2563eb;
        box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.15);
        outline: none;
    }
    
    .form-label {
        font-weight: 600;
        color: #4b5563;
        margin-bottom: 6px;
        font-size: 0.9rem;
    }
    
    /* Wizard Steps */
    .step-indicator {
        display: flex;
        justify-content: space-between;
        margin-bottom: 30px;
        position: relative;
    }
    
    .step-indicator::before {
        content: '';
        position: absolute;
        top: 15px;
        left: 0;
        right: 0;
        height: 3px;
        background: #e5e7eb;
        z-index: 1;
    }
    
    .step-indicator .progress-bar-line {
        position: absolute;
        top: 15px;
        left: 0;
        height: 3px;
        background: #2563eb;
        z-index: 1;
        transition: width 0.4s ease;
        width: 0%;
    }

    .step-item {
        position: relative;
        z-index: 2;
        text-align: center;
        background: white;
        padding: 0 10px;
    }
    
    .step-circle {
        width: 34px;
        height: 34px;
        border-radius: 50%;
        background: #e5e7eb;
        color: #6b7280;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
        margin: 0 auto 8px;
        border: 3px solid #fff;
        transition: all 0.3s ease;
    }
    
    .step-item.active .step-circle {
        background: #2563eb;
        color: #fff;
        box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.2);
    }
    
    .step-item.completed .step-circle {
        background: #10b981;
        color: #fff;
    }
    
    .step-title {
        font-size: 0.75rem;
        font-weight: 600;
        color: #6b7280;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    .step-item.active .step-title {
        color: #2563eb;
    }

    .form-step {
        display: none;
        animation: fadeIn 0.4s ease;
    }
    
    .form-step.active {
        display: block;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .btn-next, .btn-submit {
        background: linear-gradient(135deg, #1e3a8a 0%, #2563eb 100%);
        color: white;
        border: none;
        padding: 12px 24px;
        font-weight: 600;
        border-radius: 10px;
        transition: all 0.3s;
    }
    
    .btn-next:hover, .btn-submit:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 20px rgba(37, 99, 235, 0.2);
        color: white;
    }
    
    .btn-prev {
        background: #f3f4f6;
        color: #4b5563;
        border: 1px solid #d1d5db;
        padding: 12px 24px;
        font-weight: 600;
        border-radius: 10px;
        transition: all 0.3s;
    }
    
    .btn-prev:hover {
        background: #e5e7eb;
        color: #1f2937;
    }

    .invalid-feedback {
        font-size: 0.8rem;
        margin-top: 5px;
    }
    
    .password-strength-bar {
        height: 6px;
        border-radius: 4px;
        margin-top: 8px;
        background-color: #e5e7eb;
        transition: all 0.4s ease;
    }
    
    .file-preview-container {
        display: none;
        margin-top: 10px;
        border-radius: 10px;
        border: 1px dashed #d1d5db;
        background-color: #f9fafb;
    }
    
    .file-preview-image {
        max-height: 120px;
        object-fit: cover;
        border-radius: 6px;
    }

    input[type=file]::file-selector-button {
        background: #e5e7eb;
        padding: 8px 16px;
        border-radius: 8px;
        border: none;
        color: #374151;
        font-weight: 600;
        cursor: pointer;
        margin-right: 15px;
    }
    input[type=file]::file-selector-button:hover { background: #d1d5db; }
</style>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12" data-aos="fade-up">
            
            <div id="successMessage" class="alert alert-success d-none text-center p-5 rounded-4 shadow-sm mb-4 bg-white border-0">
                <div class="mb-4"><i class="fas fa-check-circle text-success" style="font-size: 4.5rem;"></i></div>
                <h2 class="fw-bold text-gray-900 mb-3">Registration Successful</h2>
                <p class="fs-5 text-gray-600">Your registration has been submitted. Our operations team will verify your documents.</p>
            </div>

            <c:if test="${param.error == 'emailExists'}">
                <div class="alert alert-danger text-center shadow-sm rounded-3 mb-4 border-0 p-3">
                    <i class="fas fa-exclamation-circle fs-5 me-2 align-middle"></i> 
                    <span class="align-middle">This email address is already registered. Please <a href="/login" class="fw-bold alert-link">Login</a> or use a different email.</span>
                </div>
            </c:if>

            <div class="card registration-card" id="registrationFormCard">
                <div class="row g-0 h-100">
                    <!-- Left Panel -->
                    <div class="col-lg-4 bg-gradient-primary text-white p-5 d-none d-lg-flex flex-column justify-content-center">
                        <div class="left-panel-content text-center">
                            <i class="fas fa-globe-americas mb-4 text-white" style="font-size: 4rem;"></i>
                            <h2 class="fw-bold mb-4">Partner With Us</h2>
                            <p class="text-white-50 mb-5">Join the global network of top education providers.</p>
                            
                            <div class="d-flex align-items-center mb-3 text-start">
                                <i class="fas fa-check-circle text-info fs-5 me-3"></i>
                                <span>Reach global students</span>
                            </div>
                            <div class="d-flex align-items-center mb-3 text-start">
                                <i class="fas fa-check-circle text-info fs-5 me-3"></i>
                                <span>Manage applications seamlessly</span>
                            </div>
                            <div class="d-flex align-items-center text-start">
                                <i class="fas fa-check-circle text-info fs-5 me-3"></i>
                                <span>Grow your enrollments</span>
                            </div>
                        </div>
                    </div>

                    <!-- Right Form Panel -->
                    <div class="col-lg-8 p-4 p-md-5 bg-white d-flex flex-column justify-content-center">
                        
                        <!-- Step Progress Indicator -->
                        <div class="step-indicator px-2 px-md-4">
                            <div class="progress-bar-line" id="progressBar"></div>
                            
                            <div class="step-item active" id="stepIndicator1">
                                <div class="step-circle"><i class="fas fa-user"></i></div>
                                <div class="step-title d-none d-sm-block">Personal</div>
                            </div>
                            <div class="step-item" id="stepIndicator2">
                                <div class="step-circle"><i class="fas fa-building"></i></div>
                                <div class="step-title d-none d-sm-block">Professional</div>
                            </div>
                            <div class="step-item" id="stepIndicator3">
                                <div class="step-circle"><i class="fas fa-map-marker-alt"></i></div>
                                <div class="step-title d-none d-sm-block">Location</div>
                            </div>
                            <div class="step-item" id="stepIndicator4">
                                <div class="step-circle"><i class="fas fa-file-alt"></i></div>
                                <div class="step-title d-none d-sm-block">Documents</div>
                            </div>
                            <div class="step-item" id="stepIndicator5">
                                <div class="step-circle"><i class="fas fa-lock"></i></div>
                                <div class="step-title d-none d-sm-block">Security</div>
                            </div>
                        </div>

                        <form id="providerRegistrationForm" action="/register-provider" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="type" value="University">
                            
                            <!-- STEP 1: Personal Info -->
                            <div class="form-step active" id="step1">
                                <h4 class="fw-bold mb-4 text-dark">Personal Information</h4>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Full Name <span class="text-danger">*</span></label>
                                        <input type="text" id="fullName" name="contactName" class="form-control" placeholder="E.g. John Doe" required>
                                        <div class="invalid-feedback">3-100 chars, letters only.</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Email Address <span class="text-danger">*</span></label>
                                        <input type="email" id="email" name="email" class="form-control" placeholder="name@company.com" required>
                                        <div class="invalid-feedback">Valid email required.</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Mobile Number <span class="text-danger">*</span></label>
                                        <input type="text" id="mobile" name="mobile" class="form-control" placeholder="E.g. 1234567890" required>
                                        <div class="invalid-feedback">10-15 digits only.</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">WhatsApp Number <span class="text-muted fw-normal">(Optional)</span></label>
                                        <input type="text" id="whatsapp" name="whatsapp" class="form-control" placeholder="E.g. 1234567890">
                                        <div class="invalid-feedback">Min 10 digits if provided.</div>
                                    </div>
                                </div>
                                <div class="mt-5 text-end">
                                    <button type="button" class="btn btn-next px-4" onclick="nextStep(1, 2)">Next Step <i class="fas fa-arrow-right ms-2"></i></button>
                                </div>
                            </div>

                            <!-- STEP 2: Professional Details -->
                            <div class="form-step" id="step2">
                                <h4 class="fw-bold mb-4 text-dark">Professional Details</h4>
                                <div class="row g-3">
                                    <div class="col-md-12">
                                        <label class="form-label">Agency / Consultancy Name <span class="text-danger">*</span></label>
                                        <input type="text" id="agencyName" name="organizationName" class="form-control" placeholder="E.g. Global Education Consultants" required>
                                        <div class="invalid-feedback">Required. 3-150 chars.</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Designation <span class="text-danger">*</span></label>
                                        <select id="designation" name="designation" class="form-select" required>
                                            <option value="">Select your role...</option>
                                            <option value="Owner">Owner</option>
                                            <option value="Director">Director</option>
                                            <option value="Counsellor">Counsellor</option>
                                            <option value="Admission Manager">Admission Manager</option>
                                            <option value="Consultant">Consultant</option>
                                        </select>
                                        <div class="invalid-feedback">Required.</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Years of Experience <span class="text-danger">*</span></label>
                                        <input type="number" id="experience" name="experience" class="form-control" min="0" max="50" placeholder="E.g. 5" required>
                                        <div class="invalid-feedback">Required (0-50).</div>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="form-label">Website URL <span class="text-muted fw-normal">(Optional)</span></label>
                                        <input type="url" id="website" name="website" class="form-control" placeholder="https://www.youragency.com">
                                        <div class="invalid-feedback">Valid URL required.</div>
                                    </div>
                                </div>
                                <div class="mt-5 d-flex justify-content-between">
                                    <button type="button" class="btn btn-prev" onclick="prevStep(2, 1)"><i class="fas fa-arrow-left me-2"></i> Back</button>
                                    <button type="button" class="btn btn-next px-4" onclick="nextStep(2, 3)">Next Step <i class="fas fa-arrow-right ms-2"></i></button>
                                </div>
                            </div>

                            <!-- STEP 3: Location -->
                            <div class="form-step" id="step3">
                                <h4 class="fw-bold mb-4 text-dark">Location Information</h4>
                                <div class="row g-3">
                                    <div class="col-md-12">
                                        <label class="form-label">Office Address <span class="text-danger">*</span></label>
                                        <textarea id="address" name="address" class="form-control" rows="2" placeholder="Full office address" required></textarea>
                                        <div class="invalid-feedback">Min 10 chars required.</div>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">Country <span class="text-danger">*</span></label>
                                        <input type="text" id="country" name="country" class="form-control" required>
                                        <div class="invalid-feedback">Required.</div>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">State <span class="text-danger">*</span></label>
                                        <input type="text" id="state" name="state" class="form-control" required>
                                        <div class="invalid-feedback">Required.</div>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">City <span class="text-danger">*</span></label>
                                        <input type="text" id="city" name="city" class="form-control" required>
                                        <div class="invalid-feedback">Required.</div>
                                    </div>
                                </div>
                                <div class="mt-5 d-flex justify-content-between">
                                    <button type="button" class="btn btn-prev" onclick="prevStep(3, 2)"><i class="fas fa-arrow-left me-2"></i> Back</button>
                                    <button type="button" class="btn btn-next px-4" onclick="nextStep(3, 4)">Next Step <i class="fas fa-arrow-right ms-2"></i></button>
                                </div>
                            </div>

                            <!-- STEP 4: Documents -->
                            <div class="form-step" id="step4">
                                <h4 class="fw-bold mb-4 text-dark">Document Verification</h4>
                                <div class="row g-3">
                                    <div class="col-md-12">
                                        <label class="form-label">Gov. ID Proof (Passport, Aadhaar) <span class="text-danger">*</span></label>
                                        <input type="file" id="govId" class="form-control" accept=".pdf,.jpg,.jpeg,.png" required onchange="previewFile(this, 'govIdPreview')">
                                        <div class="invalid-feedback">Required. PDF/JPG/PNG (Max 10 MB).</div>
                                        <div id="govIdPreview" class="file-preview-container p-2 text-center"></div>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="form-label">Business Registration Certificate <span class="text-danger">*</span></label>
                                        <input type="file" id="businessCert" class="form-control" accept=".pdf,.jpg,.jpeg,.png" required onchange="previewFile(this, 'businessCertPreview')">
                                        <div class="invalid-feedback">Required. PDF/JPG/PNG (Max 10 MB).</div>
                                        <div id="businessCertPreview" class="file-preview-container p-2 text-center"></div>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="form-label">Profile Photo <span class="text-muted fw-normal">(Optional)</span></label>
                                        <input type="file" id="profilePhoto" class="form-control" accept=".jpg,.jpeg,.png" onchange="previewFile(this, 'profilePhotoPreview')">
                                        <div class="invalid-feedback">JPG/PNG (Max 5 MB).</div>
                                        <div id="profilePhotoPreview" class="file-preview-container p-2 text-center"></div>
                                    </div>
                                </div>
                                <div class="mt-5 d-flex justify-content-between">
                                    <button type="button" class="btn btn-prev" onclick="prevStep(4, 3)"><i class="fas fa-arrow-left me-2"></i> Back</button>
                                    <button type="button" class="btn btn-next px-4" onclick="nextStep(4, 5)">Next Step <i class="fas fa-arrow-right ms-2"></i></button>
                                </div>
                            </div>

                            <!-- STEP 5: Security -->
                            <div class="form-step" id="step5">
                                <h4 class="fw-bold mb-4 text-dark">Security & Agreements</h4>
                                <div class="row g-3 mb-4">
                                    <div class="col-md-6">
                                        <label class="form-label">Password <span class="text-danger">*</span></label>
                                        <input type="password" id="password" name="password" class="form-control" placeholder="••••••••" required oninput="checkPasswordStrength()">
                                        <div class="password-strength-bar" id="pwdStrengthBar"></div>
                                        <div class="form-text small mt-1">Min 8 chars, 1 uppercase, 1 lowercase, 1 number, 1 special char.</div>
                                        <div class="invalid-feedback">Password does not meet requirements.</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Confirm Password <span class="text-danger">*</span></label>
                                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="••••••••" required oninput="validatePasswords()">
                                        <div class="invalid-feedback">Passwords do not match.</div>
                                    </div>
                                </div>

                                <div class="bg-light p-3 rounded-3 mb-4 border">
                                    <div class="form-check mb-2">
                                        <input type="checkbox" class="form-check-input" id="confirmAccurate" required>
                                        <label class="form-check-label fw-medium text-dark" for="confirmAccurate">I declare that all information is accurate. <span class="text-danger">*</span></label>
                                        <div class="invalid-feedback">Required.</div>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="agreeTerms" required>
                                        <label class="form-check-label fw-medium text-dark" for="agreeTerms">I agree to the Terms of Service. <span class="text-danger">*</span></label>
                                        <div class="invalid-feedback">Required.</div>
                                    </div>
                                </div>

                                <div class="mt-5 d-flex justify-content-between">
                                    <button type="button" class="btn btn-prev" onclick="prevStep(5, 4)"><i class="fas fa-arrow-left me-2"></i> Back</button>
                                    <button type="button" class="btn btn-submit px-4" onclick="submitForm()"><i class="fas fa-paper-plane me-2"></i> Submit Application</button>
                                </div>
                            </div>
                        </form>
                        
                        <div class="text-center mt-4 d-lg-none">
                            <p class="small text-muted mb-0">Already registered? <a href="/login" class="fw-bold">Login</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const validators = {
        fullName: /^[A-Za-z\s]{3,100}$/,
        email: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
        mobile: /^[0-9]{10,15}$/,
        whatsapp: /^(?:[0-9]{10,15})?$/,
        agencyName: /^.{3,150}$/,
        experience: /^(?:[0-9]|[1-4][0-9]|50)$/,
        website: /^(?:https?:\/\/.+\..+)?$/,
        address: /^.{10,}$/
    };

    function validateField(id) {
        const input = document.getElementById(id);
        if(!input) return true;
        const val = input.value.trim();
        const rule = validators[id];
        
        if(input.required && val === '') {
            input.classList.add('is-invalid');
            return false;
        }

        if(rule) {
            if((id === 'whatsapp' || id === 'website') && val === '') {
                input.classList.remove('is-invalid', 'is-valid');
                return true;
            }
            if(rule.test(val)) {
                input.classList.remove('is-invalid');
                input.classList.add('is-valid');
                return true;
            } else {
                input.classList.add('is-invalid');
                input.classList.remove('is-valid');
                return false;
            }
        }
        
        input.classList.remove('is-invalid');
        input.classList.add('is-valid');
        return true;
    }

    // Attach generic validators
    ['fullName','email','mobile','whatsapp','agencyName','experience','website','address','designation','country','state','city'].forEach(id => {
        const el = document.getElementById(id);
        if(el) {
            el.addEventListener('input', () => validateField(id));
        }
    });

    function validateStep(stepIndex) {
        let isValid = true;
        
        if(stepIndex === 1) {
            if(!validateField('fullName')) isValid = false;
            if(!validateField('email')) isValid = false;
            if(!validateField('mobile')) isValid = false;
            if(!validateField('whatsapp')) isValid = false;
        } 
        else if(stepIndex === 2) {
            if(!validateField('agencyName')) isValid = false;
            if(!validateField('designation')) isValid = false;
            if(!validateField('experience')) isValid = false;
            if(!validateField('website')) isValid = false;
        }
        else if(stepIndex === 3) {
            if(!validateField('address')) isValid = false;
            if(!validateField('country')) isValid = false;
            if(!validateField('state')) isValid = false;
            if(!validateField('city')) isValid = false;
        }
        else if(stepIndex === 4) {
            if(!validateFile(document.getElementById('govId'), 10, ['pdf','jpg','jpeg','png'])) isValid = false;
            if(!validateFile(document.getElementById('businessCert'), 10, ['pdf','jpg','jpeg','png'])) isValid = false;
            if(!validateFile(document.getElementById('profilePhoto'), 5, ['jpg','jpeg','png'])) isValid = false;
        }
        else if(stepIndex === 5) {
            if(!checkPasswordStrength()) isValid = false;
            if(!validatePasswords()) isValid = false;
            
            const check1 = document.getElementById('confirmAccurate');
            const check2 = document.getElementById('agreeTerms');
            if(!check1.checked) { check1.classList.add('is-invalid'); isValid = false; } else check1.classList.remove('is-invalid');
            if(!check2.checked) { check2.classList.add('is-invalid'); isValid = false; } else check2.classList.remove('is-invalid');
        }

        return isValid;
    }

    function updateProgressBar(step) {
        const totalSteps = 5;
        const progress = ((step - 1) / (totalSteps - 1)) * 100;
        document.getElementById('progressBar').style.width = progress + '%';
        
        for(let i=1; i<=totalSteps; i++) {
            const indicator = document.getElementById('stepIndicator'+i);
            if(i < step) {
                indicator.classList.add('completed');
                indicator.classList.remove('active');
                indicator.querySelector('i').className = 'fas fa-check';
            } else if(i === step) {
                indicator.classList.add('active');
                indicator.classList.remove('completed');
                // restore icon
                const icons = ['fa-user','fa-building','fa-map-marker-alt','fa-file-alt','fa-lock'];
                indicator.querySelector('i').className = 'fas ' + icons[i-1];
            } else {
                indicator.classList.remove('active', 'completed');
                const icons = ['fa-user','fa-building','fa-map-marker-alt','fa-file-alt','fa-lock'];
                indicator.querySelector('i').className = 'fas ' + icons[i-1];
            }
        }
    }

    function nextStep(current, next) {
        if(validateStep(current)) {
            document.getElementById('step'+current).classList.remove('active');
            document.getElementById('step'+next).classList.add('active');
            updateProgressBar(next);
        }
    }

    function prevStep(current, prev) {
        document.getElementById('step'+current).classList.remove('active');
        document.getElementById('step'+prev).classList.add('active');
        updateProgressBar(prev);
    }

    function submitForm() {
        if(validateStep(5)) {
            // Since we need it to submit to backend, we submit the actual form
            document.getElementById('providerRegistrationForm').submit();
        }
    }

    /* Password strength */
    function checkPasswordStrength() {
        const pwd = document.getElementById('password');
        const bar = document.getElementById('pwdStrengthBar');
        const val = pwd.value;
        const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;
        
        if(val.length === 0) {
            bar.style.width = '0%';
            bar.style.backgroundColor = '#e5e7eb';
            pwd.classList.add('is-invalid');
            return false;
        }

        let strength = 0;
        if(val.length >= 8) strength++;
        if(/[A-Z]/.test(val)) strength++;
        if(/[a-z]/.test(val)) strength++;
        if(/\d/.test(val)) strength++;
        if(/[\W_]/.test(val)) strength++;

        bar.style.width = (strength/5)*100 + '%';
        if(strength < 3) bar.style.backgroundColor = '#ef4444';
        else if(strength < 5) bar.style.backgroundColor = '#f59e0b';
        else bar.style.backgroundColor = '#10b981';

        if(regex.test(val)) {
            pwd.classList.remove('is-invalid'); pwd.classList.add('is-valid');
            return true;
        } else {
            pwd.classList.add('is-invalid'); pwd.classList.remove('is-valid');
            return false;
        }
    }

    function validatePasswords() {
        const pwd = document.getElementById('password');
        const cpwd = document.getElementById('confirmPassword');
        if(cpwd.value === '') {
            cpwd.classList.add('is-invalid'); return false;
        }
        if(pwd.value !== cpwd.value) {
            cpwd.classList.add('is-invalid'); cpwd.classList.remove('is-valid');
            return false;
        } else {
            cpwd.classList.remove('is-invalid'); cpwd.classList.add('is-valid');
            return true;
        }
    }

    function validateFile(input, maxSizeMB, allowedExtensions) {
        if (!input.files || input.files.length === 0) {
            if(input.required) { input.classList.add('is-invalid'); return false; }
            return true;
        }
        const file = input.files[0];
        const fileSizeMB = file.size / (1024 * 1024);
        const ext = file.name.split('.').pop().toLowerCase();
        
        if (fileSizeMB > maxSizeMB || !allowedExtensions.includes(ext)) {
            input.classList.add('is-invalid'); input.classList.remove('is-valid');
            return false;
        } else {
            input.classList.remove('is-invalid'); input.classList.add('is-valid');
            return true;
        }
    }

    function previewFile(input, previewId) {
        const previewContainer = document.getElementById(previewId);
        previewContainer.innerHTML = '';
        previewContainer.style.display = 'none';
        
        let maxSize = input.id === 'profilePhoto' ? 5 : 10;
        let exts = input.id === 'profilePhoto' ? ['jpg','jpeg','png'] : ['pdf','jpg','jpeg','png'];

        if(!validateFile(input, maxSize, exts)) return;

        if (input.files && input.files[0]) {
            const file = input.files[0];
            const ext = file.name.split('.').pop().toLowerCase();
            previewContainer.style.display = 'block';

            if (ext === 'pdf') {
                previewContainer.innerHTML = '<i class="fas fa-file-pdf text-danger fs-1"></i><p class="mb-0 mt-2 small text-truncate">' + file.name + '</p>';
            } else {
                const reader = new FileReader();
                reader.onload = function(e) {
                    previewContainer.innerHTML = '<img src="' + e.target.result + '" class="file-preview-image">';
                };
                reader.readAsDataURL(file);
            }
        }
    }
</script>

<jsp:include page="../common/footer.jsp">
    <jsp:param name="hideFooter" value="true" />
</jsp:include>
