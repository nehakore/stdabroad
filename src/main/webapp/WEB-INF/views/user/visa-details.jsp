<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Visa Guide: ${country.name} - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="bg-secondary text-white py-4 mb-4">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-2">
                <li class="breadcrumb-item"><a href="/" class="text-white text-decoration-none opacity-75">Home</a></li>
                <li class="breadcrumb-item"><a href="/visa-guide" class="text-white text-decoration-none opacity-75">Visa Guides</a></li>
                <li class="breadcrumb-item active text-white fw-bold" aria-current="page">${country.name}</li>
            </ol>
        </nav>
        <h2 class="fw-bold mb-0">Student Visa Guide for ${country.name}</h2>
    </div>
</div>

<div class="container pb-5" style="min-height: 60vh;">
    <c:choose>
        <c:when test="${not empty visaGuide}">
            <div class="row g-4">
                <div class="col-lg-8">
                    <!-- Main Content -->
                    <div class="card border-0 shadow-sm rounded-4 mb-4">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="fw-bold mb-4 text-primary border-bottom pb-3">Visa Overview</h3>
                            <p class="lead text-dark mb-4" style="white-space: pre-wrap;">${visaGuide.description}</p>
                            
                            <h4 class="fw-bold mt-5 mb-4 border-bottom pb-2"><i class="fas fa-file-alt text-primary me-2"></i> Required Documents</h4>
                            <div class="bg-light p-4 rounded-3 border mb-5">
                                <p style="white-space: pre-wrap; margin-bottom: 0;">${visaGuide.requiredDocuments}</p>
                            </div>

                            <h4 class="fw-bold mt-5 mb-4 border-bottom pb-2"><i class="fas fa-shoe-prints text-primary me-2"></i> Step-by-Step Application Process</h4>
                            <p style="white-space: pre-wrap;">${visaGuide.applicationProcess}</p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <!-- Sidebar Info -->
                    <div class="card border-0 shadow-sm rounded-4 mb-4 bg-primary text-white sticky-top" style="top: 100px;">
                        <div class="card-body p-4">
                            <h4 class="fw-bold mb-4 border-bottom border-light pb-3">Visa Quick Facts</h4>
                            
                            <div class="mb-4">
                                <small class="text-white-50 text-uppercase fw-bold letter-spacing">Visa Type</small>
                                <div class="fs-5 fw-bold">${visaGuide.visaType}</div>
                            </div>
                            
                            <div class="mb-4">
                                <small class="text-white-50 text-uppercase fw-bold letter-spacing">Application Fee</small>
                                <div class="fs-5 fw-bold">${visaGuide.fee}</div>
                            </div>
                            
                            <div class="mb-4">
                                <small class="text-white-50 text-uppercase fw-bold letter-spacing">Avg Processing Time</small>
                                <div class="fs-5 fw-bold">${visaGuide.processingTime}</div>
                            </div>
                            
                            <hr class="border-light opacity-25">
                            
                            <div class="mt-4">
                                <a href="/universities?countryId=${country.id}" class="btn btn-light w-100 fw-bold rounded-pill text-primary">Find Universities in ${country.name}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- Empty State -->
            <div class="text-center py-5 my-5">
                <i class="fas fa-passport fa-5x text-muted mb-4 opacity-25"></i>
                <h3 class="fw-bold text-dark">Visa Guide Not Yet Available</h3>
                <p class="text-muted lead">We are currently gathering the most up-to-date visa requirements for ${country.name}.</p>
                <a href="/visa-guide" class="btn btn-primary rounded-pill px-4 mt-3">Browse Other Countries</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<style>
.letter-spacing { letter-spacing: 1px; }
</style>

<jsp:include page="../common/footer.jsp" />
