<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Visa Guide - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<!-- Hero Banner -->
<div class="position-relative text-white mb-5 text-center shadow-sm" style="background: url('https://images.unsplash.com/photo-1544465544-1b71aee9fda4?auto=format&fit=crop&w=1920&q=80') center/cover; padding-top: 6rem; padding-bottom: 6rem;">
    <div class="position-absolute w-100 h-100 top-0 start-0" style="background: rgba(0,0,0,0.6);"></div>
    <div class="container position-relative" style="z-index: 1;">
        <h1 class="fw-bold mb-3 display-4">Student Visa Guides</h1>
        <p class="lead mx-auto mb-0" style="max-width: 800px;">Navigate the complexities of student visas with our comprehensive country-by-country guides.</p>
    </div>
</div>

<div class="container pb-5" style="min-height: 50vh;">
    <div class="row g-4">
        <c:forEach var="country" items="${countries}">
            <div class="col-md-4 col-sm-6" data-aos="fade-up">
                <a href="/visa-guide/${country.id}" class="text-decoration-none">
                    <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden text-center hover-lift">
                        <c:choose>
                            <c:when test="${fn:containsIgnoreCase(country.name, 'USA') || fn:containsIgnoreCase(country.name, 'United States')}">
                                <c:set var="finalImg" value="https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?auto=format&fit=crop&w=800&q=80" />
                            </c:when>
                            <c:when test="${fn:containsIgnoreCase(country.name, 'Canada')}">
                                <c:set var="finalImg" value="https://images.unsplash.com/photo-1503899036084-c55cdd92da26?auto=format&fit=crop&w=800&q=80" />
                            </c:when>
                            <c:when test="${fn:containsIgnoreCase(country.name, 'UK') || fn:containsIgnoreCase(country.name, 'United Kingdom')}">
                                <c:set var="finalImg" value="https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?auto=format&fit=crop&w=800&q=80" />
                            </c:when>
                            <c:when test="${fn:containsIgnoreCase(country.name, 'Australia')}">
                                <c:set var="finalImg" value="https://images.unsplash.com/photo-1523482580672-f109ba8cb9be?auto=format&fit=crop&w=800&q=80" />
                            </c:when>
                            <c:when test="${fn:containsIgnoreCase(country.name, 'Germany')}">
                                <c:set var="finalImg" value="https://images.unsplash.com/photo-1528728329032-2972f65dfb3f?auto=format&fit=crop&w=800&q=80" />
                            </c:when>
                            <c:when test="${fn:containsIgnoreCase(country.name, 'France')}">
                                <c:set var="finalImg" value="https://images.unsplash.com/photo-1499856871958-5b9627545d1a?auto=format&fit=crop&w=800&q=80" />
                            </c:when>
                            <c:when test="${fn:containsIgnoreCase(country.name, 'New Zealand')}">
                                <c:set var="finalImg" value="https://images.unsplash.com/photo-1469524504402-58bb3aa64d90?auto=format&fit=crop&w=800&q=80" />
                            </c:when>
                            <c:when test="${fn:containsIgnoreCase(country.name, 'Ireland')}">
                                <c:set var="finalImg" value="https://images.unsplash.com/photo-1564506263435-08e154678174?auto=format&fit=crop&w=800&q=80" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="finalImg" value="https://images.unsplash.com/photo-1503221043305-f7498f8b7888?auto=format&fit=crop&w=800&q=80" />
                            </c:otherwise>
                        </c:choose>
                        <img src="${finalImg}" class="card-img-top" style="height: 160px; object-fit: cover; opacity: 0.9;" alt="${country.name}">
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
