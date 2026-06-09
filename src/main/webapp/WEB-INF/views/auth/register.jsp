<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Register - Study & Jobs Abroad" />
</jsp:include>


<div class="container py-5 mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8" data-aos="fade-up">
            <div class="card p-5 border-0 shadow">
                <div class="text-center mb-4">
                    <h3 class="fw-bold text-primary">Create an Account</h3>
                    <p class="text-muted">Join the global platform for education and careers.</p>
                </div>

                <ul class="nav nav-pills nav-justified mb-4 rounded border p-1" id="registerTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active rounded-pill fw-medium" id="student-tab" data-bs-toggle="pill" data-bs-target="#student-reg" type="button" role="tab"><i class="fas fa-graduation-cap me-2"></i>Student</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link rounded-pill fw-medium" id="jobseeker-tab" data-bs-toggle="pill" data-bs-target="#jobseeker-reg" type="button" role="tab"><i class="fas fa-briefcase me-2"></i>Job Seeker</button>
                    </li>
                </ul>

                <div class="tab-content">
                    <!-- Student Registration -->
                    <div class="tab-pane fade show active" id="student-reg" role="tabpanel">
                        <form action="/register-user" method="POST">
                            <input type="hidden" name="role" value="STUDENT">
                            <div class="row g-3">
                                <div class="col-md-12">
                                    <label class="form-label fw-medium">Full Name</label>
                                    <input type="text" name="name" class="form-control rounded-pill" placeholder="John Doe" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-medium">Email Address</label>
                                    <input type="email" name="email" class="form-control rounded-pill" placeholder="john@example.com" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-medium">Phone</label>
                                    <input type="text" name="phone" class="form-control rounded-pill" placeholder="+91 98765 43210" required>
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label fw-medium">Create Password</label>
                                    <input type="password" name="password" class="form-control rounded-pill" required>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary w-100 rounded-pill mt-4 fw-bold">Register as Student</button>
                        </form>
                    </div>

                    <!-- Job Seeker Registration -->
                    <div class="tab-pane fade" id="jobseeker-reg" role="tabpanel">
                        <form action="/register-user" method="POST">
                            <input type="hidden" name="role" value="JOB_SEEKER">
                            <div class="row g-3">
                                <div class="col-md-12">
                                    <label class="form-label fw-medium">Full Name</label>
                                    <input type="text" name="name" class="form-control rounded-pill" placeholder="Jane Smith" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-medium">Email Address</label>
                                    <input type="email" name="email" class="form-control rounded-pill" placeholder="jane@example.com" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-medium">Phone</label>
                                    <input type="text" name="phone" class="form-control rounded-pill" placeholder="+91 98765 43210" required>
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label fw-medium">Create Password</label>
                                    <input type="password" name="password" class="form-control rounded-pill" required>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success w-100 rounded-pill mt-4 fw-bold">Register as Job Seeker</button>
                        </form>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <p class="text-muted m-0">Already have an account? <a href="/login" class="fw-bold">Login here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp">
    <jsp:param name="hideFooter" value="true" />
</jsp:include>
