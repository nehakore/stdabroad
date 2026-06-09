<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Study & Jobs Abroad - Build Your Global Future" />
</jsp:include>

<!-- Top Bar (Optional based on design) -->


<jsp:include page="../common/navbar.jsp" />

<!-- Hero Section -->
<section class="hero-section position-relative pt-5 pb-5" style="background: linear-gradient(135deg, #f0f9ff 0%, #ffffff 100%); overflow: hidden;">
    <div class="container position-relative pt-lg-4 pb-lg-5" style="z-index: 2;">
        <div class="row align-items-center">
            <!-- Left Side: Text and CTAs -->
            <div class="col-lg-7 pb-5 pb-lg-0">
                <h1 class="display-4 fw-bolder mb-3" data-aos="fade-up" style="letter-spacing: -1px; color: #1E3A8A !important;">
                    STUDY OR WORK ABROAD<br>
                    <span style="color: #10B981 !important;">BUILD YOUR GLOBAL FUTURE</span>
                </h1>
                <p class="lead text-secondary mb-5" data-aos="fade-up" data-aos-delay="100" style="font-weight: 400; font-size: 1.2rem; max-width: 600px;">
                    Explore top universities, courses, scholarships and international job opportunities. We make your dream of studying or working abroad a reality.
                </p>
                
                <div class="row g-4" data-aos="fade-up" data-aos-delay="200">
                    <!-- Study Card -->
                    <div class="col-md-6">
                        <div class="card border-0 shadow-lg text-white h-100 hero-cta-card" style="background-color: #1E3A8A; border-radius: 16px;">
                            <div class="card-body p-4 d-flex align-items-start gap-3">
                                <i class="fas fa-graduation-cap fs-1 opacity-75"></i>
                                <div>
                                    <h4 class="fw-bold mb-2">Study Abroad</h4>
                                    <p class="small mb-4 opacity-75">Find universities, courses, scholarships and more.</p>
                                    <a href="/universities" class="btn btn-light rounded-pill px-4 fw-bold text-primary">Explore Now <i class="fas fa-arrow-right ms-2"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Jobs Card -->
                    <div class="col-md-6">
                        <div class="card border-0 shadow-lg text-white h-100 hero-cta-card" style="background-color: #10B981; border-radius: 16px;">
                            <div class="card-body p-4 d-flex align-items-start gap-3">
                                <i class="fas fa-briefcase fs-1 opacity-75"></i>
                                <div>
                                    <h4 class="fw-bold mb-2">Jobs Abroad</h4>
                                    <p class="small mb-4 opacity-75">Discover global jobs, build your career and grow internationally.</p>
                                    <a href="/jobs" class="btn btn-light rounded-pill px-4 fw-bold text-success">Explore Now <i class="fas fa-arrow-right ms-2"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Side: Image Carousel -->
            <div class="col-lg-5 d-none d-lg-block" data-aos="fade-left" data-aos-delay="300">
                <div id="heroCarousel" class="carousel slide carousel-fade shadow-lg" data-bs-ride="carousel" style="border-radius: 20px; overflow: hidden; border: 8px solid white;">
                    <div class="carousel-inner" style="height: 500px;">
                        <div class="carousel-item active h-100">
                            <img src="https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&w=800&q=80" class="d-block w-100 h-100 object-fit-cover" alt="Oxford University">
                            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded p-2 mb-2">
                                <h5 class="mb-0 fw-bold">Top Global Universities</h5>
                            </div>
                        </div>
                        <div class="carousel-item h-100">
                            <img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=800&q=80" class="d-block w-100 h-100 object-fit-cover" alt="Students">
                            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded p-2 mb-2">
                                <h5 class="mb-0 fw-bold">Vibrant Campus Life</h5>
                            </div>
                        </div>
                        <div class="carousel-item h-100">
                            <img src="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=800&q=80" class="d-block w-100 h-100 object-fit-cover" alt="Corporate Jobs">
                            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded p-2 mb-2">
                                <h5 class="mb-0 fw-bold">International Careers</h5>
                            </div>
                        </div>
                        <div class="carousel-item h-100">
                            <img src="https://images.unsplash.com/photo-1506784365847-bbad939e9335?auto=format&fit=crop&w=800&q=80" class="d-block w-100 h-100 object-fit-cover" alt="Graduation">
                            <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded p-2 mb-2">
                                <h5 class="mb-0 fw-bold">Build Your Future</h5>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Floating Search Section -->
<section class="position-relative" style="margin-top: -60px; z-index: 10;">
    <div class="container">
        <div class="card border-0 shadow-lg p-0" style="border-radius: 16px; overflow: hidden;" data-aos="fade-up" data-aos-delay="300">
            <div class="card-header bg-white border-0 p-0">
                <ul class="nav nav-tabs border-0 px-4 pt-3" id="searchTabs">
                    <li class="nav-item">
                        <a class="nav-link active fw-bold text-primary px-4 py-3 border-0 border-bottom border-primary border-3 bg-light" data-bs-toggle="tab" href="#study-search">Study Programs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link fw-bold text-muted px-4 py-3 border-0" data-bs-toggle="tab" href="#job-search">Jobs</a>
                    </li>
                </ul>
            </div>
            <div class="card-body p-4 bg-white">
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="study-search">
                        <form class="row g-3 align-items-end" action="/universities" method="GET">
                            <div class="col-md-3">
                                <label class="form-label text-muted small fw-semibold"><i class="fas fa-globe text-primary me-2"></i>Select Country</label>
                                <select class="form-select border-0 bg-light rounded-pill px-3 py-2" name="country">
                                    <option value="">All Countries</option>
                                    <c:forEach var="c" items="${countries}">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label text-muted small fw-semibold"><i class="fas fa-book text-primary me-2"></i>Select Course</label>
                                <select class="form-select border-0 bg-light rounded-pill px-3 py-2" name="course">
                                    <option value="">Any Course</option>
                                    <option value="Computer Science">Computer Science</option>
                                    <option value="Business Administration">Business Administration</option>
                                    <option value="Engineering">Engineering</option>
                                    <option value="Healthcare">Healthcare</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label text-muted small fw-semibold"><i class="fas fa-graduation-cap text-primary me-2"></i>Select Degree</label>
                                <select class="form-select border-0 bg-light rounded-pill px-3 py-2" name="degree">
                                    <option value="">Bachelors / Masters</option>
                                    <option value="bachelors">Bachelors</option>
                                    <option value="masters">Masters</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-primary w-100 rounded-pill py-2 fw-bold shadow-sm" style="background-color: #1E3A8A; border-color: #1E3A8A;"><i class="fas fa-search me-2"></i> Search Now</button>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="job-search">
                        <form class="row g-3 align-items-end" action="/jobs" method="GET">
                            <div class="col-md-3">
                                <label class="form-label text-muted small fw-semibold"><i class="fas fa-globe text-success me-2"></i>Select Country</label>
                                <select class="form-select border-0 bg-light rounded-pill px-3 py-2" name="country">
                                    <option value="">All Countries</option>
                                    <c:forEach var="c" items="${countries}">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label text-muted small fw-semibold"><i class="fas fa-briefcase text-success me-2"></i>Job Category</label>
                                <select class="form-select border-0 bg-light rounded-pill px-3 py-2" name="category">
                                    <option value="">Any Category</option>
                                    <option value="IT & Software">IT & Software</option>
                                    <option value="Healthcare">Healthcare</option>
                                    <option value="Engineering">Engineering</option>
                                    <option value="Finance">Finance</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label text-muted small fw-semibold"><i class="fas fa-star text-success me-2"></i>Experience</label>
                                <select class="form-select border-0 bg-light rounded-pill px-3 py-2" name="experience">
                                    <option value="">Fresher / Experienced</option>
                                    <option value="fresher">Fresher (0-2 Yrs)</option>
                                    <option value="experienced">Experienced (3+ Yrs)</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-success w-100 rounded-pill py-2 fw-bold shadow-sm"><i class="fas fa-search me-2"></i> Search Jobs</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Popular Destinations -->
<section class="py-5 mt-4">
    <div class="container">
        <div class="text-center mb-5" data-aos="fade-up">
            <h2 class="fw-bolder" style="color: #1E3A8A;">Popular Destinations</h2>
        </div>
        
        <div class="row g-4 flex-nowrap overflow-auto hide-scrollbar pb-4 px-2" style="scroll-snap-type: x mandatory;">
            <!-- Destination Card 1 -->
            <div class="col-10 col-md-4 col-lg-3" style="scroll-snap-align: start;" data-aos="fade-up" data-aos-delay="100">
                <div class="card border-0 dest-card position-relative text-white overflow-hidden" style="border-radius: 16px; min-height: 200px;">
                    <img src="https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?auto=format&fit=crop&w=600&q=80" class="position-absolute w-100 h-100 object-fit-cover" alt="USA">
                    <div class="position-absolute w-100 h-100" style="background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);"></div>
                    <div class="card-body position-relative d-flex flex-column justify-content-between p-4">
                        <div class="d-flex align-items-center gap-2">
                            <span class="fs-4">🇺🇸</span>
                            <h5 class="fw-bold mb-0">USA</h5>
                        </div>
                        <div>
                            <p class="mb-2 small opacity-75">Top Universities & IT Jobs</p>
                            <a href="/countries" class="text-white fw-medium text-decoration-none small hover-underline">View Details <i class="fas fa-arrow-right ms-1"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Destination Card 2 -->
            <div class="col-10 col-md-4 col-lg-3" style="scroll-snap-align: start;" data-aos="fade-up" data-aos-delay="200">
                <div class="card border-0 dest-card position-relative text-white overflow-hidden" style="border-radius: 16px; min-height: 200px;">
                    <img src="https://images.unsplash.com/photo-1503899036084-c55cdd92da26?auto=format&fit=crop&w=600&q=80" class="position-absolute w-100 h-100 object-fit-cover" alt="Canada">
                    <div class="position-absolute w-100 h-100" style="background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);"></div>
                    <div class="card-body position-relative d-flex flex-column justify-content-between p-4">
                        <div class="d-flex align-items-center gap-2">
                            <span class="fs-4">🇨🇦</span>
                            <h5 class="fw-bold mb-0">Canada</h5>
                        </div>
                        <div>
                            <p class="mb-2 small opacity-75">PR Friendly & Top Healthcare</p>
                            <a href="/countries" class="text-white fw-medium text-decoration-none small hover-underline">View Details <i class="fas fa-arrow-right ms-1"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Destination Card 3 -->
            <div class="col-10 col-md-4 col-lg-3" style="scroll-snap-align: start;" data-aos="fade-up" data-aos-delay="300">
                <div class="card border-0 dest-card position-relative text-white overflow-hidden" style="border-radius: 16px; min-height: 200px;">
                    <img src="https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?auto=format&fit=crop&w=600&q=80" class="position-absolute w-100 h-100 object-fit-cover" alt="UK">
                    <div class="position-absolute w-100 h-100" style="background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);"></div>
                    <div class="card-body position-relative d-flex flex-column justify-content-between p-4">
                        <div class="d-flex align-items-center gap-2">
                            <span class="fs-4">🇬🇧</span>
                            <h5 class="fw-bold mb-0">UK</h5>
                        </div>
                        <div>
                            <p class="mb-2 small opacity-75">Ivy League & Finance</p>
                            <a href="/countries" class="text-white fw-medium text-decoration-none small hover-underline">View Details <i class="fas fa-arrow-right ms-1"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Destination Card 4 -->
            <div class="col-10 col-md-4 col-lg-3" style="scroll-snap-align: start;" data-aos="fade-up" data-aos-delay="400">
                <div class="card border-0 dest-card position-relative text-white overflow-hidden" style="border-radius: 16px; min-height: 200px;">
                    <img src="https://images.unsplash.com/photo-1523482580672-f109ba8cb9be?auto=format&fit=crop&w=600&q=80" class="position-absolute w-100 h-100 object-fit-cover" alt="Australia">
                    <div class="position-absolute w-100 h-100" style="background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);"></div>
                    <div class="card-body position-relative d-flex flex-column justify-content-between p-4">
                        <div class="d-flex align-items-center gap-2">
                            <span class="fs-4">🇦🇺</span>
                            <h5 class="fw-bold mb-0">Australia</h5>
                        </div>
                        <div>
                            <p class="mb-2 small opacity-75">Great Lifestyle & Tech Hub</p>
                            <a href="/countries" class="text-white fw-medium text-decoration-none small hover-underline">View Details <i class="fas fa-arrow-right ms-1"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5 bg-white">
    <div class="container">
        <div class="row g-4 justify-content-center text-center">
            <div class="col-6 col-md-4 col-lg-2" data-aos="fade-up" data-aos-delay="100">
                <div class="feature-icon-box mx-auto mb-3 bg-light text-primary rounded-circle d-flex align-items-center justify-content-center shadow-sm" style="width: 70px; height: 70px; font-size: 1.5rem;">
                    <i class="fas fa-graduation-cap"></i>
                </div>
                <h6 class="fw-bold mb-1">Top Universities</h6>
                <p class="small text-muted mb-0">Explore top ranked worldwide.</p>
            </div>
            <div class="col-6 col-md-4 col-lg-2" data-aos="fade-up" data-aos-delay="200">
                <div class="feature-icon-box mx-auto mb-3 bg-light text-info rounded-circle d-flex align-items-center justify-content-center shadow-sm" style="width: 70px; height: 70px; font-size: 1.5rem;">
                    <i class="fas fa-gift"></i>
                </div>
                <h6 class="fw-bold mb-1">Scholarships</h6>
                <p class="small text-muted mb-0">Find best funds to study.</p>
            </div>
            <div class="col-6 col-md-4 col-lg-2" data-aos="fade-up" data-aos-delay="300">
                <div class="feature-icon-box mx-auto mb-3 bg-light text-warning rounded-circle d-flex align-items-center justify-content-center shadow-sm" style="width: 70px; height: 70px; font-size: 1.5rem;">
                    <i class="fas fa-file-invoice-dollar"></i>
                </div>
                <h6 class="fw-bold mb-1">Education Loans</h6>
                <p class="small text-muted mb-0">Easy low interest rates.</p>
            </div>
            <div class="col-6 col-md-4 col-lg-2" data-aos="fade-up" data-aos-delay="400">
                <div class="feature-icon-box mx-auto mb-3 bg-light text-secondary rounded-circle d-flex align-items-center justify-content-center shadow-sm" style="width: 70px; height: 70px; font-size: 1.5rem;">
                    <i class="fas fa-passport"></i>
                </div>
                <h6 class="fw-bold mb-1">Visa Guidance</h6>
                <p class="small text-muted mb-0">Complete visa assistance.</p>
            </div>
            <div class="col-6 col-md-4 col-lg-2" data-aos="fade-up" data-aos-delay="500">
                <div class="feature-icon-box mx-auto mb-3 bg-light text-success rounded-circle d-flex align-items-center justify-content-center shadow-sm" style="width: 70px; height: 70px; font-size: 1.5rem;">
                    <i class="fas fa-briefcase"></i>
                </div>
                <h6 class="fw-bold mb-1">Global Jobs</h6>
                <p class="small text-muted mb-0">Find right opportunities.</p>
            </div>
        </div>
    </div>
</section>

<!-- Stats Banner -->
<section class="py-5" style="background-color: #1E3A8A; color: white;">
    <div class="container">
        <div class="row text-center g-4">
            <div class="col-6 col-md-3" data-aos="zoom-in" data-aos-delay="100">
                <div class="d-flex align-items-center justify-content-center gap-3">
                    <i class="fas fa-users fs-2 opacity-75"></i>
                    <div class="text-start">
                        <h3 class="fw-bolder mb-0">50,000+</h3>
                        <p class="small opacity-75 mb-0">Students Guided</p>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-3" data-aos="zoom-in" data-aos-delay="200">
                <div class="d-flex align-items-center justify-content-center gap-3">
                    <i class="fas fa-university fs-2 opacity-75"></i>
                    <div class="text-start">
                        <h3 class="fw-bolder mb-0">1,200+</h3>
                        <p class="small opacity-75 mb-0">Universities</p>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-3" data-aos="zoom-in" data-aos-delay="300">
                <div class="d-flex align-items-center justify-content-center gap-3">
                    <i class="fas fa-briefcase fs-2 opacity-75"></i>
                    <div class="text-start">
                        <h3 class="fw-bolder mb-0">25,000+</h3>
                        <p class="small opacity-75 mb-0">Job Opportunities</p>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-3" data-aos="zoom-in" data-aos-delay="400">
                <div class="d-flex align-items-center justify-content-center gap-3">
                    <i class="fas fa-globe-americas fs-2 opacity-75"></i>
                    <div class="text-start">
                        <h3 class="fw-bolder mb-0">30+</h3>
                        <p class="small opacity-75 mb-0">Countries</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
    body { padding-top: 0 !important; }
    .hide-scrollbar::-webkit-scrollbar { display: none; }
    .hide-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
    .dest-card { transition: transform 0.3s ease, box-shadow 0.3s ease; cursor: pointer; }
    .dest-card:hover { transform: translateY(-10px); box-shadow: 0 15px 30px rgba(0,0,0,0.1) !important; }
    .dest-card img { transition: transform 0.5s ease; }
    .dest-card:hover img { transform: scale(1.1); }
    .hero-cta-card { transition: transform 0.3s ease; cursor: pointer; }
    .hero-cta-card:hover { transform: translateY(-5px); }
    .feature-icon-box { transition: all 0.3s ease; }
    .feature-icon-box:hover { background-color: var(--primary) !important; color: white !important; transform: scale(1.1); }
</style>

<jsp:include page="../common/footer.jsp" />
