<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/navbar.jsp" />

<style>
    body {
        font-family: 'Inter', sans-serif;
        background-color: #f8fafc;
    }
    .contact-header {
        background: linear-gradient(135deg, #eef6ff 0%, #f5f8ff 50%, #eef9ff 100%);
        padding: 80px 0;
        text-align: center;
        border-bottom: 1px solid #e2e8f0;
    }
    .contact-card {
        background: white;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.04);
        padding: 40px;
        border: none;
    }
    .icon-box {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        margin-bottom: 20px;
    }
    .form-control, .form-select {
        border-radius: 12px;
        padding: 12px 15px;
        border: 1px solid #cbd5e1;
    }
    .form-control:focus, .form-select:focus {
        box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
        border-color: #3B82F6;
        outline: none;
    }
    .btn-primary {
        border-radius: 12px;
        padding: 12px;
        font-weight: 600;
        background: #3B82F6;
        border: none;
    }
    .btn-primary:hover {
        background: #2563EB;
    }
</style>

<!-- Header -->
<div class="contact-header">
    <div class="container">
        <h1 class="fw-bolder" style="font-family: 'Outfit', sans-serif; color: #0F172A;">Get in Touch</h1>
        <p class="lead text-muted mx-auto" style="max-width: 600px;">We're here to help you start your global journey. Reach out to our expert counselors for free guidance.</p>
    </div>
</div>

<div class="container py-5">
    <div class="row g-5">
        <!-- Contact Info -->
        <div class="col-lg-4">
            <h3 class="fw-bold mb-4" style="color: #0F172A;">Contact Information</h3>
            
            <div class="d-flex align-items-start mb-4">
                <div class="icon-box bg-primary bg-opacity-10 text-primary me-4">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <div>
                    <h5 class="fw-bold mb-1">Our Office</h5>
                    <p class="text-muted mb-0">123 Global Avenue, Tech Park<br>New York, NY 10001, USA</p>
                </div>
            </div>
            
            <div class="d-flex align-items-start mb-4">
                <div class="icon-box bg-success bg-opacity-10 text-success me-4">
                    <i class="fas fa-envelope"></i>
                </div>
                <div>
                    <h5 class="fw-bold mb-1">Email Us</h5>
                    <p class="text-muted mb-0">support@studyabroad.com<br>info@studyabroad.com</p>
                </div>
            </div>
            
            <div class="d-flex align-items-start mb-4">
                <div class="icon-box bg-warning bg-opacity-10 text-warning me-4">
                    <i class="fas fa-phone-alt"></i>
                </div>
                <div>
                    <h5 class="fw-bold mb-1">Call Us</h5>
                    <p class="text-muted mb-0">+1 (234) 567-8900<br>+1 (987) 654-3210</p>
                </div>
            </div>
        </div>
        
        <!-- Contact Form -->
        <div class="col-lg-8">
            <div class="contact-card">
                <h3 class="fw-bold mb-4" style="color: #0F172A;">Send Us a Message</h3>
                <form action="/submit-enquiry" method="POST">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Your Name</label>
                            <input type="text" class="form-control" name="name" required placeholder="John Doe">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Your Email</label>
                            <input type="email" class="form-control" name="email" required placeholder="john@example.com">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Phone Number</label>
                            <input type="tel" class="form-control" name="phone" required placeholder="+1 234 567 8900">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Subject</label>
                            <input type="text" class="form-control" name="subject" required placeholder="How can we help?">
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-semibold">Message</label>
                            <textarea class="form-control" name="message" rows="5" required placeholder="Tell us more about your study/job goals..."></textarea>
                        </div>
                        <div class="col-12 mt-4">
                            <button type="submit" class="btn btn-primary w-100 shadow-sm text-white">Send Message <i class="fas fa-paper-plane ms-2"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
