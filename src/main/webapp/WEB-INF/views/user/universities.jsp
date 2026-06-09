<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Universities - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="container pt-3 pb-5" style="min-height: 70vh;">
    <div class="d-flex justify-content-between align-items-center mb-5" data-aos="fade-down">
        <div>
            <h2 class="fw-bold text-primary">Discover Universities</h2>
            <p class="text-muted">Explore top-ranked institutions to pursue your education.</p>
        </div>
        <div>
            <form action="/universities" method="GET" class="d-flex gap-2">
                <select name="countryId" class="form-select rounded-pill">
                    <option value="">All Countries</option>
                    <c:forEach var="country" items="${countries}">
                        <option value="${country.id}" ${param.countryId == country.id ? 'selected' : ''}>${country.name}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-primary rounded-pill px-4">Filter</button>
            </form>
        </div>
    </div>

    <div class="row g-4">
        <c:forEach var="university" items="${universities}">
            <div class="col-md-6" data-aos="fade-up">
                <div class="card h-100 flex-md-row">
                    <img src="${empty university.imageUrl ? 'https://images.unsplash.com/photo-1541339907198-e08756dedf3f?auto=format&fit=crop&q=80&w=300' : university.imageUrl}" class="card-img-left" style="width: 200px; object-fit: cover;" alt="${university.name}">
                    <div class="card-body d-flex flex-column justify-content-center">
                        <h4 class="card-title fw-bold mb-1">${university.name}</h4>
                        <p class="text-primary fw-medium mb-3"><i class="fas fa-map-marker-alt"></i> ${university.country.name}
                            <c:if test="${university.hasVisaAssistance}">
                                <span class="badge bg-info text-dark ms-2" title="${university.visaAssistanceDetails}"><i class="fas fa-passport"></i> Visa Assistance</span>
                            </c:if>
                        </p>
                        <div class="d-flex justify-content-between mb-3 text-muted small">
                            <span><i class="fas fa-trophy"></i> Rank: ${university.ranking}</span>
                            <span><i class="fas fa-money-bill-wave"></i> Avg Fees: $${university.fees}</span>
                        </div>
                        <div class="mt-auto">
                            <c:choose>
                                <c:when test="${empty sessionScope.loggedInUser}">
                                    <a href="/login?alert=login_required" class="btn btn-outline-primary rounded-pill w-100">Enquire Now</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/user/enquire-uni?id=${university.id}" class="btn btn-primary rounded-pill shadow-sm w-100">Enquire Now</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty universities}">
            <div class="col-12 text-center text-muted py-5">
                <i class="fas fa-university fa-4x mb-3 text-light"></i>
                <h5>No universities found.</h5>
            </div>
        </c:if>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
