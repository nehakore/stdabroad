<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Countries - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="container py-5 mt-4">
    <div class="text-center mb-5" data-aos="fade-down">
        <h2 class="fw-bold text-primary">Explore Countries</h2>
        <p class="text-muted">Find your dream destination for study or work.</p>
    </div>

    <div class="row g-4">
        <c:forEach var="country" items="${countries}">
            <div class="col-md-4" data-aos="fade-up">
                <div class="card h-100">
                    <img src="${empty country.imageUrl ? 'https://images.unsplash.com/photo-1507608616759-54f48f0af0ee?auto=format&fit=crop&q=80&w=600' : country.imageUrl}" class="card-img-top" alt="${country.name}">
                    <div class="card-body d-flex flex-column">
                        <h4 class="card-title fw-bold">${country.name}</h4>
                        <p class="card-text text-muted flex-grow-1">${country.description}</p>
                        <div class="d-flex justify-content-between mt-3">
                            <a href="/universities?countryId=${country.id}" class="btn btn-outline-primary rounded-pill w-45"><i class="fas fa-university"></i> Study</a>
                            <a href="/jobs?countryId=${country.id}" class="btn btn-outline-success rounded-pill w-45"><i class="fas fa-briefcase"></i> Work</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty countries}">
            <div class="col-12 text-center text-muted py-5">
                <i class="fas fa-globe fa-4x mb-3 text-light"></i>
                <h5>No countries added yet. Check back later!</h5>
            </div>
        </c:if>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
