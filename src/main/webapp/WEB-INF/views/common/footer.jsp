<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${param.hideFooter != 'true'}">
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4">
                <h5>🌍 Study & Jobs Abroad</h5>
                <p>Your trusted partner for international education and career opportunities.</p>
            </div>
            <div class="col-md-4 mb-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="/countries">Explore Countries</a></li>
                    <li><a href="/universities">Find Universities</a></li>
                    <li><a href="/jobs">Search Jobs</a></li>
                    <li><a href="/enquiry">Enquire Now</a></li>
                </ul>
            </div>
            <div class="col-md-4 mb-4">
                <h5>Contact Us</h5>
                <p><i class="fas fa-envelope"></i> support@studyjobsabroad.com</p>
                <p><i class="fas fa-phone"></i> +1 234 567 8900</p>
                <div>
                    <a href="#" class="text-white me-3 fs-5"><i class="fab fa-facebook"></i></a>
                    <a href="#" class="text-white me-3 fs-5"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-white me-3 fs-5"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white me-3 fs-5"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
        </div>
        <div class="text-center mt-4 border-top pt-3 border-secondary">
            <p class="mb-0">&copy; 2026 Study & Jobs Abroad Platform. All rights reserved.</p>
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
