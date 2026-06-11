<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${param.hideFooter != 'true'}">

<style>
    .premium-footer {
        background-color: #0F172A;
        color: #94A3B8;
        font-family: 'Inter', sans-serif;
        position: relative;
        overflow: hidden;
    }
    .premium-footer h5 {
        color: #F8FAFC;
        font-weight: 700;
        font-family: 'Outfit', sans-serif;
        margin-bottom: 1.5rem;
    }
    .footer-link {
        color: #94A3B8;
        text-decoration: none;
        transition: color 0.3s ease, padding-left 0.3s ease;
        display: inline-block;
        margin-bottom: 0.75rem;
        font-weight: 500;
    }
    .footer-link:hover {
        color: #3B82F6;
        padding-left: 5px;
    }
    .footer-social {
        width: 40px;
        height: 40px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.05);
        color: #F8FAFC;
        transition: all 0.3s ease;
        text-decoration: none;
        margin-right: 10px;
    }
    .footer-social:hover {
        background: #3B82F6;
        color: white;
        transform: translateY(-3px);
    }
    .footer-bottom {
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        padding-top: 1.5rem;
        margin-top: 3rem;
    }
</style>

<footer class="premium-footer py-5">
    <!-- Decorative background glow -->
    <div class="position-absolute rounded-circle" style="width: 300px; height: 300px; background: #3B82F6; filter: blur(100px); top: -150px; right: -50px; opacity: 0.15;"></div>
    
    <div class="container position-relative" style="z-index: 1;">
        <div class="row">
            <!-- Brand Column -->
            <div class="col-md-5 mb-4 pe-md-5">
                <div class="d-flex align-items-center mb-4 gap-2">
                    <span style="font-size: 2rem;">🌍</span>
                    <h5 class="mb-0" style="font-size: 1.5rem; color: #fff;">Study<span style="color: #3B82F6;">Abroad</span></h5>
                </div>
                <p style="line-height: 1.7; font-size: 0.95rem;">
                    Your trusted partner for international education and career opportunities. We guide you step-by-step to study, work, and build your future anywhere in the world.
                </p>
            </div>
            
            <!-- Links Column -->
            <div class="col-md-3 mb-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="/countries" class="footer-link"><i class="fas fa-chevron-right small me-2" style="color: #3B82F6;"></i>Explore Countries</a></li>
                    <li><a href="/universities" class="footer-link"><i class="fas fa-chevron-right small me-2" style="color: #3B82F6;"></i>Find Universities</a></li>
                    <li><a href="/jobs" class="footer-link"><i class="fas fa-chevron-right small me-2" style="color: #3B82F6;"></i>Search Jobs</a></li>
                    <li><a href="/enquiry" class="footer-link"><i class="fas fa-chevron-right small me-2" style="color: #3B82F6;"></i>Enquire Now</a></li>
                </ul>
            </div>
            
            <!-- Contact Column -->
            <div class="col-md-4 mb-4">
                <h5>Contact Us</h5>
                <div class="d-flex flex-column gap-3 mb-4">
                    <div class="d-flex align-items-center gap-3">
                        <div class="bg-white bg-opacity-10 text-white rounded d-flex align-items-center justify-content-center" style="width: 36px; height: 36px;">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <span style="font-weight: 500;">support@studyabroad.com</span>
                    </div>
                    <div class="d-flex align-items-center gap-3">
                        <div class="bg-white bg-opacity-10 text-white rounded d-flex align-items-center justify-content-center" style="width: 36px; height: 36px;">
                            <i class="fas fa-phone"></i>
                        </div>
                        <span style="font-weight: 500;">+1 234 567 8900</span>
                    </div>
                </div>
                
                <h6 class="text-white mb-3 fw-bold mt-4" style="font-family: 'Outfit', sans-serif;">Follow Us</h6>
                <div>
                    <a href="#" class="footer-social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="footer-social"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="footer-social"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="footer-social"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        
        <!-- Footer Bottom -->
        <div class="footer-bottom text-center d-flex flex-column flex-md-row justify-content-between align-items-center">
            <p class="mb-0 small">&copy; 2026 StudyAbroad Platform. All rights reserved.</p>
            <div class="d-flex gap-3 mt-3 mt-md-0 small">
                <a href="#" class="footer-link mb-0">Privacy Policy</a>
                <a href="#" class="footer-link mb-0">Terms of Service</a>
            </div>
        </div>
    </div>
</footer>
</c:if>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- AOS JS -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<!-- Custom JS -->
<script src="/js/script.js"></script>
</body>
</html>
