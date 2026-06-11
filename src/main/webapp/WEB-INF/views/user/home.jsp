<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Study & Jobs Abroad - Build Your Global Future" />
</jsp:include>

<!-- Top Bar (Optional based on design) -->


<jsp:include page="../common/navbar.jsp" />

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800;900&display=swap');
    
    .premium-hero {
        font-family: 'Poppins', sans-serif;
        position: relative;
        width: 100%;
        min-height: 760px;
        background: linear-gradient(135deg, #eef6ff 0%, #f5f8ff 50%, #eef9ff 100%);
        overflow: hidden;
        padding-top: 40px;
        padding-bottom: 80px;
        display: flex;
        align-items: center;
    }
    
    .hero-blob {
        position: absolute;
        border-radius: 50%;
        filter: blur(80px);
        opacity: 0.5;
        z-index: 0;
    }
    .hero-blob-1 { top: -10%; left: -5%; width: 400px; height: 400px; background: #93c5fd; }
    .hero-blob-2 { bottom: -10%; right: -5%; width: 500px; height: 500px; background: #c4b5fd; }
    
    .hero-bg-pattern {
        position: absolute;
        top: 0; left: 0; width: 100%; height: 100%;
        background-image: radial-gradient(#cbd5e1 1px, transparent 1px);
        background-size: 30px 30px;
        opacity: 0.3;
        z-index: 0;
    }
    
    .text-gradient {
        background: linear-gradient(90deg, #2563EB 0%, #7C3AED 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }
    
    .glass-card {
        background: rgba(255, 255, 255, 0.7);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border: 1px solid rgba(255, 255, 255, 0.5);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
    }
    
    .cta-card {
        position: relative;
        overflow: hidden;
        border-radius: 20px;
        padding: 24px;
        color: white;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        flex: 1;
        min-width: 250px;
    }
    .cta-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 40px rgba(0,0,0,0.15);
    }
    .cta-card-bg {
        position: absolute;
        top: 0; left: 0; width: 100%; height: 100%;
        object-fit: cover;
        opacity: 0.15;
        z-index: 0;
    }
    .cta-card-content {
        position: relative;
        z-index: 1;
    }
    
    .feature-item {
        display: flex;
        align-items: center;
        gap: 12px;
        background: rgba(255, 255, 255, 0.8);
        padding: 8px 12px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.03);
        transition: transform 0.3s ease;
    }
    .feature-item:hover {
        transform: translateY(-3px);
    }
    .feature-icon-wrapper {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.1rem;
    }
    
    .visual-collage {
        position: relative;
        width: 100%;
        max-width: 500px;
        height: 500px;
        margin: 0 auto;
    }
    .collage-main-img {
        position: absolute;
        top: 0;
        right: 20px;
        width: 360px;
        height: 480px;
        border-radius: 28px;
        object-fit: cover;
        border: 8px solid white;
        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15);
    }
    .collage-float-1 {
        position: absolute;
        bottom: 0px;
        left: 0px;
        width: 220px;
        height: 180px;
        border-radius: 20px;
        object-fit: cover;
        border: 8px solid white;
        box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        z-index: 2;
    }
    .collage-float-2 {
        position: absolute;
        top: 20px;
        left: 20px;
        width: 150px;
        height: 150px;
        border-radius: 50%;
        object-fit: cover;
        border: 8px solid white;
        box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        z-index: 3;
    }
    .collage-info-card {
        position: absolute;
        bottom: 80px;
        right: -10px;
        padding: 12px 20px;
        border-radius: 16px;
        z-index: 4;
        display: flex;
        align-items: center;
        gap: 12px;
        background: white;
        box-shadow: 0 15px 30px rgba(0,0,0,0.1);
    }
    
    @media (max-width: 991px) {
        .visual-collage {
            height: 400px;
            margin-top: 40px;
        }
        .collage-main-img { width: 100%; right: 0; top: 0; height: 400px; }
        .collage-float-1, .collage-float-2, .collage-info-card { display: none; }
    }
</style>

<section class="premium-hero">
    <div class="hero-bg-pattern"></div>
    <div class="hero-blob hero-blob-1"></div>
    <div class="hero-blob hero-blob-2"></div>
    


    <div class="container position-relative" style="z-index: 10;">
        <div class="row align-items-center">
            
            <!-- LEFT COLUMN (Content) -->
            <div class="col-lg-7 pr-lg-4">
                <div class="badge rounded-pill bg-white text-primary shadow-sm px-3 py-2 mb-3 d-inline-flex align-items-center gap-2" style="font-weight: 600; font-size: 0.85rem;">
                    <span>🌍</span> Discover Your Path Abroad
                </div>
                
                <h1 class="fw-bolder mb-2" style="font-size: clamp(2.5rem, 4vw, 3.5rem); line-height: 1.1; color: #0F172A;">
                    Study or Work Abroad<br>
                    Build Your <span class="text-gradient">Global Future</span>
                </h1>
                
                <p class="mb-3" style="font-size: 1.05rem; color: #475569; max-width: 600px; line-height: 1.5;">
                    Explore top universities, courses, scholarships and international job opportunities. We make your dream of studying or working abroad a reality.
                </p>
                
                <!-- Feature Highlights -->
                <div class="d-flex flex-wrap gap-2 mb-4">
                    <div class="feature-item">
                        <div class="feature-icon-wrapper bg-primary bg-opacity-10 text-primary">🎓</div>
                        <div>
                            <div class="fw-bold text-dark" style="font-size: 0.8rem;">Top Universities</div>
                            <div class="text-muted" style="font-size: 0.65rem;">Worldwide</div>
                        </div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon-wrapper bg-success bg-opacity-10 text-success">📚</div>
                        <div>
                            <div class="fw-bold text-dark" style="font-size: 0.8rem;">1000+ Courses</div>
                            <div class="text-muted" style="font-size: 0.65rem;">In-demand</div>
                        </div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon-wrapper bg-warning bg-opacity-10 text-warning">🏆</div>
                        <div>
                            <div class="fw-bold text-dark" style="font-size: 0.8rem;">Scholarships</div>
                            <div class="text-muted" style="font-size: 0.65rem;">Fully Funded</div>
                        </div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon-wrapper bg-info bg-opacity-10 text-info">💼</div>
                        <div>
                            <div class="fw-bold text-dark" style="font-size: 0.8rem;">Global Jobs</div>
                            <div class="text-muted" style="font-size: 0.65rem;">Top Careers</div>
                        </div>
                    </div>
                </div>
                
                <!-- CTA Cards -->
                <div class="d-flex flex-column flex-md-row gap-3">
                    <!-- Study Card -->
                    <div class="cta-card" style="background: linear-gradient(135deg, #2563EB, #7C3AED);">
                        <img src="https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&w=600&q=80" class="cta-card-bg" alt="University">
                        <div class="cta-card-content">
                            <div class="bg-white bg-opacity-25 rounded-circle d-inline-flex align-items-center justify-content-center mb-2" style="width: 40px; height: 40px; font-size: 1.2rem;">🎓</div>
                            <h4 class="fw-bold mb-1" style="font-size: 1.2rem;">Study Abroad</h4>
                            <p class="mb-3 text-white text-opacity-75" style="font-size: 0.85rem; line-height: 1.4;">Find universities, programs and scholarships that shape your future.</p>
                            <a href="/universities" class="btn btn-light rounded-pill fw-bold text-primary px-3 py-2 hover-lift" style="font-size: 0.85rem;">Explore Universities &rarr;</a>
                        </div>
                    </div>
                    
                    <!-- Jobs Card -->
                    <div class="cta-card" style="background: linear-gradient(135deg, #0D9488, #10B981);">
                        <img src="https://images.unsplash.com/photo-1449844908441-8829872d2607?auto=format&fit=crop&w=600&q=80" class="cta-card-bg" alt="City Skyline">
                        <div class="cta-card-content">
                            <div class="bg-white bg-opacity-25 rounded-circle d-inline-flex align-items-center justify-content-center mb-2" style="width: 40px; height: 40px; font-size: 1.2rem;">💼</div>
                            <h4 class="fw-bold mb-1" style="font-size: 1.2rem;">Jobs Abroad</h4>
                            <p class="mb-3 text-white text-opacity-75" style="font-size: 0.85rem; line-height: 1.4;">Discover global job opportunities and grow your international career.</p>
                            <a href="/jobs" class="btn btn-light rounded-pill fw-bold text-success px-3 py-2 hover-lift" style="font-size: 0.85rem;">Explore Jobs &rarr;</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- RIGHT COLUMN (Visuals) -->
            <div class="col-lg-5 mt-5 mt-lg-0">
                <div class="visual-collage" style="z-index: 1;">
                    <!-- Airplane Path & Real Airplane Icon -->
                    <svg width="180" height="180" viewBox="0 0 180 180" style="position: absolute; top: -30px; right: -70px; z-index: -1;" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <!-- Curved dashed line -->
                        <path d="M 0 160 Q 90 160 135 65" stroke="#93c5fd" stroke-width="2" stroke-dasharray="6 6" fill="none"/>
                        <!-- Real Passenger Airplane Icon (pointing up-right) -->
                        <g transform="translate(135, 65) rotate(45) scale(0.06) translate(-256, -256)">
                            <path d="M448 336v-40L288 192V79.2c0-17.7-14.8-31.2-32-31.2s-32 13.5-32 31.2V192L64 296v40l160-48v113.6l-48 31.8v34.6l80-25.9 80 25.9v-34.6l-48-31.8V288l160 48z" fill="none" stroke="#93c5fd" stroke-width="32" stroke-linejoin="round"/>
                        </g>
                    </svg>
                    
                    <!-- Main Student Traveler -->
                    <img src="https://images.unsplash.com/photo-1514890547357-a9ee288728e0?auto=format&fit=crop&w=800&q=80" class="collage-main-img" alt="Venice Canal Sunset">
                    
                    <!-- Floating Landmark (Top Left Circle) -->
                    <img src="https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?auto=format&fit=crop&w=400&q=80" class="collage-float-2" alt="London Aerial View">
                    
                    <!-- Floating Graduation Student (Bottom Left Square) -->
                    <img src="https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=600&q=80" class="collage-float-1" alt="Students with Laptop">
                    
                    <!-- Floating Info Card (Bottom Right) -->
                    <div class="collage-info-card glass-card shadow-lg">
                        <div class="bg-primary bg-opacity-10 text-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 36px; height: 36px; font-size: 1.1rem;">🌎</div>
                        <div>
                            <div class="fw-bold text-dark" style="font-size: 0.9rem; line-height: 1;">30+ Countries</div>
                            <div class="text-muted" style="font-size: 0.75rem;">Explore Opportunities</div>
                        </div>
                    </div>
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


<!-- Top Universities / Courses Section -->
<section class="py-5 bg-light">
    <div class="container py-4">
        <div class="d-flex justify-content-between align-items-end mb-5" data-aos="fade-up">
            <div>
                <span class="text-primary fw-bold small text-uppercase tracking-wider">Top Institutions</span>
                <h2 class="fw-bolder mt-2" style="color: #0F172A; font-size: 2.5rem;">Study at Global Leaders</h2>
            </div>
            <a href="/universities" class="btn btn-outline-primary rounded-pill fw-bold px-4">View All <i class="fas fa-arrow-right ms-2"></i></a>
        </div>
        <div class="row g-4">
            <!-- Uni 1 -->
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                <div class="card border-0 shadow-sm h-100 overflow-hidden" style="border-radius: 20px;">
                    <div class="position-relative" style="height: 200px;">
                        <img src="https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&w=600&q=80" class="w-100 h-100 object-fit-cover" alt="Harvard">
                        <div class="position-absolute top-0 end-0 m-3 bg-white px-2 py-1 rounded shadow-sm fw-bold small text-primary"><i class="fas fa-star text-warning"></i> 4.9</div>
                    </div>
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-1">Harvard University</h5>
                        <p class="text-muted small mb-3"><i class="fas fa-map-marker-alt me-1"></i> Cambridge, USA</p>
                        <div class="d-flex gap-2 mb-4">
                            <span class="badge bg-light text-dark border">Business</span>
                            <span class="badge bg-light text-dark border">Law</span>
                            <span class="badge bg-light text-dark border">Medicine</span>
                        </div>
                        <a href="/universities" class="btn btn-primary w-100 rounded-pill fw-bold">Explore Programs</a>
                    </div>
                </div>
            </div>
            <!-- Uni 2 -->
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                <div class="card border-0 shadow-sm h-100 overflow-hidden" style="border-radius: 20px;">
                    <div class="position-relative" style="height: 200px;">
                        <img src="https://images.unsplash.com/photo-1564981797816-1043664bf78d?auto=format&fit=crop&w=600&q=80" class="w-100 h-100 object-fit-cover" alt="Oxford">
                        <div class="position-absolute top-0 end-0 m-3 bg-white px-2 py-1 rounded shadow-sm fw-bold small text-primary"><i class="fas fa-star text-warning"></i> 4.8</div>
                    </div>
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-1">University of Oxford</h5>
                        <p class="text-muted small mb-3"><i class="fas fa-map-marker-alt me-1"></i> Oxford, UK</p>
                        <div class="d-flex gap-2 mb-4 flex-wrap">
                            <span class="badge bg-light text-dark border">Humanities</span>
                            <span class="badge bg-light text-dark border">Science</span>
                            <span class="badge bg-light text-dark border">Arts</span>
                        </div>
                        <a href="/universities" class="btn btn-primary w-100 rounded-pill fw-bold">Explore Programs</a>
                    </div>
                </div>
            </div>
            <!-- Uni 3 -->
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                <div class="card border-0 shadow-sm h-100 overflow-hidden" style="border-radius: 20px;">
                    <div class="position-relative" style="height: 200px;">
                        <img src="https://images.unsplash.com/photo-1606761568499-6d2451b08c66?auto=format&fit=crop&w=600&q=80" class="w-100 h-100 object-fit-cover" alt="Toronto">
                        <div class="position-absolute top-0 end-0 m-3 bg-white px-2 py-1 rounded shadow-sm fw-bold small text-primary"><i class="fas fa-star text-warning"></i> 4.7</div>
                    </div>
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-1">University of Toronto</h5>
                        <p class="text-muted small mb-3"><i class="fas fa-map-marker-alt me-1"></i> Toronto, Canada</p>
                        <div class="d-flex gap-2 mb-4 flex-wrap">
                            <span class="badge bg-light text-dark border">Engineering</span>
                            <span class="badge bg-light text-dark border">IT</span>
                            <span class="badge bg-light text-dark border">Research</span>
                        </div>
                        <a href="/universities" class="btn btn-primary w-100 rounded-pill fw-bold">Explore Programs</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




<!-- Why Choose Us Section -->
<section class="py-5 position-relative overflow-hidden" style="background: linear-gradient(135deg, #eef6ff 0%, #f5f8ff 50%, #eef9ff 100%);">
<style>
/* Section Entry Animation */
[data-aos="fade-up"] {
    transition-timing-function: cubic-bezier(0.165, 0.84, 0.44, 1) !important;
}

/* Background Animations */
@keyframes floatBlob1 {
    0%, 100% { transform: translate(0, 0) scale(1); }
    50% { transform: translate(30px, 50px) scale(1.05); }
}
@keyframes floatBlob2 {
    0%, 100% { transform: translate(0, 0) scale(1); }
    50% { transform: translate(-30px, -50px) scale(1.05); }
}
.blob-1 { animation: floatBlob1 15s ease-in-out infinite; }
.blob-2 { animation: floatBlob2 18s ease-in-out infinite; }

@keyframes mapPulse {
    0%, 100% { opacity: 0.3; }
    50% { opacity: 0.6; }
}
.map-pulse { animation: mapPulse 8s ease-in-out infinite; }

/* Feature Card Animations */
.why-card {
    transition: all 0.35s cubic-bezier(0.4, 0, 0.2, 1) !important;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -1px rgba(0, 0, 0, 0.03) !important;
    position: relative;
    overflow: hidden;
}
.why-card::after {
    content: '';
    position: absolute;
    inset: 0;
    border-radius: inherit;
    box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.4);
    opacity: 0;
    transition: opacity 0.35s ease;
    pointer-events: none;
}
.why-card:hover {
    transform: translateY(-10px) scale(1.02) !important;
    box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04), 0 0 20px rgba(59, 130, 246, 0.15) !important;
    z-index: 2;
}
.why-card:hover::after { opacity: 1; }

/* Icon Animations */
.icon-container {
    transition: transform 0.4s cubic-bezier(0.34, 1.56, 0.64, 1) !important;
}
.why-card:hover .icon-container {
    transform: scale(1.1) rotate(5deg) !important;
}

/* Floating Image Animations */
@keyframes mainFloat {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-15px); }
}
@keyframes badgeFloat1 {
    0%, 100% { transform: translateY(0) rotate(5deg); }
    50% { transform: translateY(-10px) rotate(3deg); }
}
@keyframes badgeFloat2 {
    0%, 100% { transform: translateY(0) rotate(-5deg); }
    50% { transform: translateY(-8px) rotate(-2deg); }
}
.img-float-main {
    animation: mainFloat 6s ease-in-out infinite;
    transition: transform 0.4s ease;
}
.img-float-main:hover {
    transform: scale(1.03);
    animation-play-state: paused;
}
.img-badge-1 { animation: badgeFloat1 5s ease-in-out infinite 0.5s; }
.img-badge-2 { animation: badgeFloat2 7s ease-in-out infinite 1s; }

/* Premium Button Animation */
.btn-premium {
    transition: all 0.3s ease !important;
}
.btn-premium:hover {
    transform: translateY(-3px) scale(1.03) !important;
    box-shadow: 0 10px 20px rgba(59, 130, 246, 0.3) !important;
}
.btn-premium:active { transform: scale(0.98) !important; }
</style>
    <!-- Background Decor -->
    <div class="hero-bg-pattern map-pulse"></div>
    <div class="position-absolute rounded-circle blob-1" style="width: 400px; height: 400px; background: #e0e7ff; filter: blur(100px); top: 0; left: 0; opacity: 0.5;"></div>
    <div class="position-absolute rounded-circle blob-2" style="width: 400px; height: 400px; background: #fce7f3; filter: blur(100px); bottom: 0; right: 0; opacity: 0.5;"></div>
    
    <div class="container py-5 position-relative" style="z-index: 1;">
        <!-- Header -->
        <div class="text-center mb-5" data-aos="fade-up" data-aos-duration="800" data-aos-easing="ease-out" data-aos-once="true">
            <div class="badge rounded-pill bg-white text-primary shadow-sm px-3 py-2 mb-3 d-inline-flex align-items-center gap-2" style="font-weight: 600; font-size: 0.85rem;" data-aos="zoom-in-up" data-aos-duration="500" data-aos-once="true">
                <span>⭐</span> Trusted by Students & Professionals Worldwide
            </div>
            <h2 class="fw-bolder mb-3" style="font-size: 2.8rem; color: #0F172A;" data-aos="fade-up" data-aos-duration="800" data-aos-delay="100" data-aos-once="true">
                Why <span class="text-gradient">Choose Us</span>
            </h2>
            <p class="lead text-muted mx-auto" style="max-width: 600px; font-size: 1.1rem;" data-aos="fade-up" data-aos-duration="800" data-aos-delay="200" data-aos-once="true">
                Everything you need to study, work, and build your future abroad in one trusted platform.
            </p>
        </div>

        <!-- 7 Cards Grid -->
        <div class="row g-4 justify-content-center mb-5">
            <!-- Row 1: 4 Cards -->
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="100">
                <div class="card border-0 h-100 p-4 why-card" style="background: rgba(255, 255, 255, 0.9); backdrop-filter: blur(10px); border-radius: 20px; border-top: 4px solid #3B82F6;">
                    <div class="bg-primary bg-opacity-10 text-primary rounded-circle icon-container d-flex align-items-center justify-content-center mb-4" style="width: 60px; height: 60px; font-size: 1.5rem;">🎓</div>
                    <h5 class="fw-bold text-dark mb-2">Verified Universities</h5>
                    <p class="text-muted small mb-0">Access trusted and accredited universities from top countries worldwide.</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="200">
                <div class="card border-0 h-100 p-4 why-card" style="background: rgba(255, 255, 255, 0.9); backdrop-filter: blur(10px); border-radius: 20px; border-top: 4px solid #8B5CF6;">
                    <div class="rounded-circle icon-container d-flex align-items-center justify-content-center mb-4" style="width: 60px; height: 60px; font-size: 1.5rem; color: #8B5CF6; background-color: rgba(139, 92, 246, 0.1);">💼</div>
                    <h5 class="fw-bold text-dark mb-2">Verified Employers</h5>
                    <p class="text-muted small mb-0">Apply only to verified international companies and recruiters.</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                <div class="card border-0 h-100 p-4 why-card" style="background: rgba(255, 255, 255, 0.9); backdrop-filter: blur(10px); border-radius: 20px; border-top: 4px solid #F59E0B;">
                    <div class="bg-warning bg-opacity-10 text-warning rounded-circle icon-container d-flex align-items-center justify-content-center mb-4" style="width: 60px; height: 60px; font-size: 1.5rem;">🏆</div>
                    <h5 class="fw-bold text-dark mb-2">Scholarship Guidance</h5>
                    <p class="text-muted small mb-0">Discover scholarships and funding opportunities that match your profile.</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
                <div class="card border-0 h-100 p-4 why-card" style="background: rgba(255, 255, 255, 0.9); backdrop-filter: blur(10px); border-radius: 20px; border-top: 4px solid #10B981;">
                    <div class="bg-success bg-opacity-10 text-success rounded-circle icon-container d-flex align-items-center justify-content-center mb-4" style="width: 60px; height: 60px; font-size: 1.5rem;">🛂</div>
                    <h5 class="fw-bold text-dark mb-2">Visa Support</h5>
                    <p class="text-muted small mb-0">Get step-by-step guidance throughout your visa application process.</p>
                </div>
            </div>
            
            <!-- Row 2: 3 Cards Centered -->
            <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="500">
                <div class="card border-0 h-100 p-4 why-card" style="background: rgba(255, 255, 255, 0.9); backdrop-filter: blur(10px); border-radius: 20px; border-top: 4px solid #EC4899;">
                    <div class="rounded-circle icon-container d-flex align-items-center justify-content-center mb-4" style="width: 60px; height: 60px; font-size: 1.5rem; color: #EC4899; background-color: rgba(236, 72, 153, 0.1);">📊</div>
                    <h5 class="fw-bold text-dark mb-2">Application Tracking</h5>
                    <p class="text-muted small mb-0">Track all university and job applications from one dashboard.</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="600">
                <div class="card border-0 h-100 p-4 why-card" style="background: rgba(255, 255, 255, 0.9); backdrop-filter: blur(10px); border-radius: 20px; border-top: 4px solid #06B6D4;">
                    <div class="rounded-circle icon-container d-flex align-items-center justify-content-center mb-4" style="width: 60px; height: 60px; font-size: 1.5rem; color: #06B6D4; background-color: rgba(6, 182, 212, 0.1);">📄</div>
                    <h5 class="fw-bold text-dark mb-2">Resume Assistance</h5>
                    <p class="text-muted small mb-0">Build professional resumes that meet international hiring standards.</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="700">
                <div class="card border-0 h-100 p-4 why-card" style="background: rgba(255, 255, 255, 0.9); backdrop-filter: blur(10px); border-radius: 20px; border-top: 4px solid #64748B;">
                    <div class="rounded-circle icon-container d-flex align-items-center justify-content-center mb-4" style="width: 60px; height: 60px; font-size: 1.5rem; color: #64748B; background-color: rgba(100, 116, 139, 0.1);">🔒</div>
                    <h5 class="fw-bold text-dark mb-2">Secure Platform</h5>
                    <p class="text-muted small mb-0">Your documents, applications, and personal information remain protected.</p>
                </div>
            </div>
        </div>


    </div>
</section>

<!-- CTA / Newsletter Section -->
<section class="py-5 bg-white">
    <div class="container py-4">
        <div class="card border-0 overflow-hidden shadow-lg" style="border-radius: 24px; background: #fff;">
            <div class="row g-0">
                <!-- Left Side: Content -->
                <div class="col-lg-6 p-5 p-lg-5 d-flex flex-column justify-content-center" style="background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);">
                    <div class="badge rounded-pill bg-white text-primary shadow-sm px-3 py-2 mb-4 align-self-start" style="font-weight: 600; font-size: 0.85rem;">
                        <span>🚀</span> Take the first step
                    </div>
                    <h2 class="fw-bolder mb-3" style="font-size: 2.8rem; color: #0F172A; line-height: 1.1;">
                        Ready to Start Your<br>
                        <span class="text-gradient">Global Journey?</span>
                    </h2>
                    <p class="lead mb-4" style="color: #475569; font-size: 1.1rem; line-height: 1.6;">
                        Book a free session with our expert counselors and turn your dream of studying or working abroad into reality.
                    </p>
                    <div class="d-flex flex-column flex-sm-row gap-3">
                        <a href="/contact" class="btn btn-primary btn-premium rounded-pill px-4 py-3 fw-bold shadow-sm" style="font-size: 1rem;">Book Free Counseling</a>
                        <a href="/universities" class="btn btn-outline-dark btn-premium rounded-pill px-4 py-3 fw-bold" style="font-size: 1rem;">Explore Programs</a>
                    </div>
                </div>
                
                <!-- Right Side: Abroad Images -->
                <div class="col-lg-6 position-relative d-none d-lg-block">
                    <!-- Main Travel Image -->
                    <img src="https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=800&q=80" class="w-100 h-100 object-fit-cover img-float-main" alt="Airplane Travel">
                    
                    <!-- Floating Image 1: London/Study -->
                    <div class="img-badge-1 position-absolute shadow-lg border border-white border-4" style="width: 140px; height: 140px; border-radius: 20px; top: 10%; right: 10%; overflow: hidden;">
                        <img src="https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?auto=format&fit=crop&w=300&q=80" class="w-100 h-100 object-fit-cover" alt="London">
                    </div>
                    
                    <!-- Floating Image 2: University Graduation -->
                    <div class="img-badge-2 position-absolute shadow-lg border border-white border-4" style="width: 160px; height: 120px; border-radius: 20px; bottom: 15%; left: -10%; overflow: hidden;">
                        <img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=300&q=80" class="w-100 h-100 object-fit-cover" alt="Graduation">
                    </div>
                    
                    <!-- Floating Info Badge -->
                    <div class="img-badge-1 position-absolute bottom-0 end-0 m-4 p-3 bg-white rounded-4 shadow-lg d-flex align-items-center gap-3" style="width: 260px; animation-delay: 2s;">
                        <div class="bg-success bg-opacity-10 text-success rounded-circle d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; font-size: 1.5rem;">🛂</div>
                        <div>
                            <div class="fw-bold text-dark" style="font-size: 0.95rem;">Visa Processing</div>
                            <div class="text-success fw-semibold" style="font-size: 0.8rem;">99% Success Rate</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials Section -->
<section class="py-5 position-relative overflow-hidden" style="background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);">
    <!-- Decorative background elements -->
    <div class="position-absolute rounded-circle" style="width: 400px; height: 400px; background: #e0e7ff; filter: blur(80px); top: -100px; left: -100px; opacity: 0.6;"></div>
    <div class="position-absolute rounded-circle" style="width: 500px; height: 500px; background: #fce7f3; filter: blur(80px); bottom: -200px; right: -100px; opacity: 0.6;"></div>
    
    <div class="container py-5 position-relative" style="z-index: 1;">
        <div class="text-center mb-5" data-aos="fade-up">
            <div class="badge rounded-pill bg-white text-primary shadow-sm px-3 py-2 mb-3 d-inline-flex align-items-center gap-2" style="font-weight: 600; font-size: 0.85rem;">
                <span>⭐</span> Success Stories
            </div>
            <h2 class="fw-bolder mt-2" style="font-size: 2.5rem; color: #0F172A;">
                Loved by Students <span class="text-gradient">& Professionals</span>
            </h2>
        </div>
        
        <div class="row g-4 justify-content-center">
            <!-- Review 1 -->
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                <div class="card border-0 h-100 position-relative p-4 review-card" style="background: rgba(255, 255, 255, 0.8); backdrop-filter: blur(20px); border-radius: 24px; box-shadow: 0 15px 35px rgba(0,0,0,0.03);">
                    <i class="fas fa-quote-left position-absolute text-primary" style="font-size: 3rem; opacity: 0.05; top: 20px; right: 20px;"></i>
                    <div class="text-warning mb-3" style="font-size: 0.9rem;">
                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    </div>
                    <p class="mb-4" style="color: #475569; font-size: 1.05rem; line-height: 1.6;">"The counseling I received was top-notch. They helped me secure a 100% scholarship at a top university in the UK. I couldn't have done it without them."</p>
                    <div class="mt-auto d-flex align-items-center gap-3 pt-3 border-top" style="border-color: rgba(0,0,0,0.05) !important;">
                        <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=100&q=80" class="rounded-circle shadow-sm" style="width: 50px; height: 50px; object-fit: cover;" alt="Sarah Jenkins">
                        <div>
                            <h6 class="fw-bold mb-0 text-dark">Sarah Jenkins</h6>
                            <span class="small text-primary fw-semibold">Masters Student, UK</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Review 2 -->
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                <div class="card border-0 h-100 position-relative p-4 review-card" style="background: rgba(255, 255, 255, 0.8); backdrop-filter: blur(20px); border-radius: 24px; box-shadow: 0 15px 35px rgba(0,0,0,0.03);">
                    <i class="fas fa-quote-left position-absolute text-primary" style="font-size: 3rem; opacity: 0.05; top: 20px; right: 20px;"></i>
                    <div class="text-warning mb-3" style="font-size: 0.9rem;">
                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    </div>
                    <p class="mb-4" style="color: #475569; font-size: 1.05rem; line-height: 1.6;">"Finding an IT job in Germany felt impossible until I used this platform. They helped with my resume, interviews, and visa processing."</p>
                    <div class="mt-auto d-flex align-items-center gap-3 pt-3 border-top" style="border-color: rgba(0,0,0,0.05) !important;">
                        <img src="https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=100&q=80" class="rounded-circle shadow-sm" style="width: 50px; height: 50px; object-fit: cover;" alt="David Chen">
                        <div>
                            <h6 class="fw-bold mb-0 text-dark">David Chen</h6>
                            <span class="small text-primary fw-semibold">Software Engineer, Germany</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Review 3 -->
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                <div class="card border-0 h-100 position-relative p-4 review-card" style="background: rgba(255, 255, 255, 0.8); backdrop-filter: blur(20px); border-radius: 24px; box-shadow: 0 15px 35px rgba(0,0,0,0.03);">
                    <i class="fas fa-quote-left position-absolute text-primary" style="font-size: 3rem; opacity: 0.05; top: 20px; right: 20px;"></i>
                    <div class="text-warning mb-3" style="font-size: 0.9rem;">
                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    </div>
                    <p class="mb-4" style="color: #475569; font-size: 1.05rem; line-height: 1.6;">"From shortlisting universities to finally flying to Canada, the entire process was completely seamless. Highly recommended for anyone looking to study abroad!"</p>
                    <div class="mt-auto d-flex align-items-center gap-3 pt-3 border-top" style="border-color: rgba(0,0,0,0.05) !important;">
                        <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=100&q=80" class="rounded-circle shadow-sm" style="width: 50px; height: 50px; object-fit: cover;" alt="Priya Sharma">
                        <div>
                            <h6 class="fw-bold mb-0 text-dark">Priya Sharma</h6>
                            <span class="small text-primary fw-semibold">Business Analytics, Canada</span>
                        </div>
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
    
    .review-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .review-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 25px 50px rgba(0,0,0,0.08) !important;
    }
    
    .why-card {
        box-shadow: 0 10px 30px rgba(0,0,0,0.04);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .why-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 40px rgba(0,0,0,0.08);
    }
</style>

<jsp:include page="../common/footer.jsp" />
