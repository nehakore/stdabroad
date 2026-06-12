<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Countries - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="container py-5 mt-4">
    <div class="text-center mb-5" data-aos="fade-down">
        <span class="text-primary fw-bold small text-uppercase tracking-wider">Global Destinations</span>
        <h2 class="fw-bolder mt-2" style="color: #0F172A; font-size: 2.5rem;">Explore Countries</h2>
        <p class="text-muted mx-auto" style="max-width: 600px;">Find your dream destination for study or work. We partner with institutions in the most sought-after locations worldwide.</p>
    </div>

    <div class="row g-4">
        <c:forEach var="country" items="${countries}">
            
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

            <div class="col-md-6 col-lg-4" data-aos="fade-up">
                <div class="card border-0 shadow-sm h-100 overflow-hidden country-card" style="border-radius: 20px;">
                    <div class="position-relative" style="height: 250px; overflow: hidden;">
                        <img src="${finalImg}" class="w-100 h-100 object-fit-cover country-img" alt="${country.name}" style="transition: transform 0.5s ease;">
                        <div class="position-absolute w-100 h-100 top-0 start-0" style="background: linear-gradient(to top, rgba(15,23,42,0.9), transparent);"></div>
                        <div class="position-absolute bottom-0 start-0 p-4 text-white w-100">
                            <h3 class="fw-bolder mb-1">${country.name}</h3>
                            <p class="small text-light opacity-75 mb-0 text-truncate">${country.description}</p>
                        </div>
                    </div>
                    <div class="card-body p-4 bg-white">
                        <div class="d-flex gap-3 mt-2">
                            <a href="/universities?countryId=${country.id}" class="btn btn-outline-primary rounded-pill flex-grow-1 fw-bold border-2">
                                <i class="fas fa-university me-1"></i> Study
                            </a>
                            <a href="/jobs?countryId=${country.id}" class="btn btn-outline-success rounded-pill flex-grow-1 fw-bold border-2">
                                <i class="fas fa-briefcase me-1"></i> Work
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty countries}">
            <div class="col-12 text-center py-5">
                <div class="bg-light rounded-circle d-inline-flex align-items-center justify-content-center mb-4" style="width: 100px; height: 100px;">
                    <i class="fas fa-globe-americas fa-3x text-muted opacity-50"></i>
                </div>
                <h4 class="fw-bold text-dark">No Destinations Found</h4>
                <p class="text-muted">Check back later as we are constantly adding new countries.</p>
            </div>
        </c:if>
    </div>
</div>

<style>
    .country-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .country-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 40px rgba(0,0,0,0.1) !important;
    }
    .country-card:hover .country-img {
        transform: scale(1.1);
    }
</style>

<jsp:include page="../common/footer.jsp" />
