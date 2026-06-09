<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Visa Guide - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<!-- Hero Banner -->
<div class="bg-primary text-white py-5 mb-5 text-center shadow-sm">
    <div class="container">
        <h1 class="fw-bold mb-3 display-5">Student Visa Guides</h1>
        <p class="lead mb-0 opacity-75">Navigate the complexities of student visas with our comprehensive country-by-country guides.</p>
    </div>
</div>

<div class="container pb-5" style="min-height: 50vh;">
    <div class="row g-4">
        <c:forEach var="country" items="${countries}">
            <div class="col-md-4 col-sm-6" data-aos="fade-up">
                <a href="/visa-guide/${country.id}" class="text-decoration-none">
                    <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden text-center hover-lift">
                        <img src="${not empty country.imageUrl ? country.imageUrl : 'https://images.unsplash.com/photo-1503221043305-f7498f8b7888'}" class="card-img-top" style="height: 160px; object-fit: cover; opacity: 0.9;" alt="${country.name}">
                        <div class="card-body">
                            <h4 class="fw-bold text-dark mb-2">${country.name}</h4>
                            <p class="text-primary fw-medium mb-0">View Requirements <i class="fas fa-arrow-right ms-1"></i></p>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>

<style>
.hover-lift { transition: transform 0.2s ease, box-shadow 0.2s ease; }
.hover-lift:hover { transform: translateY(-5px); box-shadow: 0 10px 25px rgba(0,0,0,0.1) !important; }
</style>

<jsp:include page="../common/footer.jsp" />
