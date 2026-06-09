<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Contact Us - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="container py-5 mt-4">
    <div class="row justify-content-center" data-aos="fade-up">
        <div class="col-md-8">
            <div class="card p-5 border-0 shadow-sm">
                <div class="text-center mb-4">
                    <h2 class="fw-bold text-primary">Get in Touch</h2>
                    <p class="text-muted">Have questions? Fill out the form below and our counsellors will contact you.</p>
                </div>
                
                <c:if test="${param.enquirySuccess != null}">
                    <div class="alert alert-success rounded-pill text-center">
                        Your enquiry has been submitted successfully! We will contact you soon.
                    </div>
                </c:if>

                <form action="/submit-enquiry" method="POST">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Full Name</label>
                            <input type="text" name="name" class="form-control rounded-pill" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Email Address</label>
                            <input type="email" name="email" class="form-control rounded-pill" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Phone Number</label>
                            <input type="text" name="phone" class="form-control rounded-pill" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-medium">Enquiry Type</label>
                            <select name="type" class="form-select rounded-pill" required>
                                <option value="Study">Study Abroad</option>
                                <option value="Job">Work Abroad</option>
                                <option value="General">General Inquiry</option>
                            </select>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-medium">Message</label>
                            <textarea name="message" class="form-control" rows="4" style="border-radius: 12px;" required></textarea>
                        </div>
                        <div class="col-12 mt-4 text-center">
                            <button type="submit" class="btn btn-primary btn-lg rounded-pill px-5 w-100">Send Message</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
