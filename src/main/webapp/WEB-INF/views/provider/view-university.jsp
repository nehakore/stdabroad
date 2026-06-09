<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:providerLayout>
    <c:set var="activePage" value="my-universities" scope="request" />

    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <a href="/provider/universities" class="btn btn-sm btn-outline-secondary mb-2"><i class="fas fa-arrow-left me-1"></i> Back to List</a>
            <h2 class="fw-bold mb-0">${university.name}</h2>
            <div class="text-muted mt-1">
                <i class="fas fa-map-marker-alt me-1 text-danger"></i> ${university.city}, ${university.country.name}
                <span class="mx-2">|</span>
                <span class="badge ${university.status == 'PUBLISHED' ? 'bg-success' : 'bg-warning text-dark'}">${university.status}</span>
                <c:if test="${!university.approved}">
                    <span class="badge bg-danger ms-1">Pending Admin Approval</span>
                </c:if>
                <c:if test="${university.approved}">
                    <span class="badge bg-success ms-1">Approved</span>
                </c:if>
            </div>
        </div>
        <div>
            <a href="/provider/universities/edit/${university.id}" class="btn btn-primary"><i class="fas fa-edit me-2"></i> Edit Details</a>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-lg-8">
            <!-- Main Content Card -->
            <div class="card border-0 shadow-sm rounded-4 mb-4">
                <div class="card-body p-4">
                    <h5 class="fw-bold border-bottom pb-2 mb-3">About University</h5>
                    <p class="text-dark" style="white-space: pre-wrap;">${university.description}</p>
                    
                    <h5 class="fw-bold border-bottom pb-2 mb-3 mt-4">Required Documents</h5>
                    <p class="text-dark" style="white-space: pre-wrap;">${not empty university.requiredDocuments ? university.requiredDocuments : 'Not specified.'}</p>
                    
                    <h5 class="fw-bold border-bottom pb-2 mb-3 mt-4">Top Recruiters</h5>
                    <p class="text-dark" style="white-space: pre-wrap;">${not empty university.topRecruiters ? university.topRecruiters : 'Not specified.'}</p>
                </div>
            </div>
            
            <!-- Facilities Card -->
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body p-4">
                    <h5 class="fw-bold border-bottom pb-2 mb-3">Campus Facilities</h5>
                    <div class="d-flex flex-wrap gap-3">
                        <c:if test="${university.hasHostel}"><div class="badge bg-light text-dark border p-2"><i class="fas fa-bed text-primary me-2"></i>Hostel</div></c:if>
                        <c:if test="${university.hasLibrary}"><div class="badge bg-light text-dark border p-2"><i class="fas fa-book text-primary me-2"></i>Library</div></c:if>
                        <c:if test="${university.hasSports}"><div class="badge bg-light text-dark border p-2"><i class="fas fa-volleyball-ball text-primary me-2"></i>Sports</div></c:if>
                        <c:if test="${university.hasPlacementSupport}"><div class="badge bg-light text-dark border p-2"><i class="fas fa-briefcase text-primary me-2"></i>Placement Support</div></c:if>
                        <c:if test="${university.hasTransport}"><div class="badge bg-light text-dark border p-2"><i class="fas fa-bus text-primary me-2"></i>Transport</div></c:if>
                        <c:if test="${university.hasWifi}"><div class="badge bg-light text-dark border p-2"><i class="fas fa-wifi text-primary me-2"></i>Wi-Fi</div></c:if>
                        <c:if test="${university.hasLabs}"><div class="badge bg-light text-dark border p-2"><i class="fas fa-flask text-primary me-2"></i>Laboratories</div></c:if>
                        <c:if test="${university.hasCafeteria}"><div class="badge bg-light text-dark border p-2"><i class="fas fa-coffee text-primary me-2"></i>Cafeteria</div></c:if>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <!-- Quick Info Card -->
            <div class="card border-0 shadow-sm rounded-4 mb-4 bg-primary text-white">
                <div class="card-body p-4">
                    <div class="text-center mb-4">
                        <img src="${not empty university.imageUrl ? university.imageUrl : 'https://via.placeholder.com/100'}" class="rounded-circle bg-white p-1 mb-3" style="width: 100px; height: 100px; object-fit: cover;">
                        <h5 class="fw-bold mb-0">Quick Facts</h5>
                    </div>
                    <ul class="list-unstyled mb-0">
                        <li class="mb-3 border-bottom border-light pb-2"><i class="fas fa-building me-2 opacity-75"></i> <strong>Type:</strong> ${university.type}</li>
                        <li class="mb-3 border-bottom border-light pb-2"><i class="fas fa-calendar-alt me-2 opacity-75"></i> <strong>Established:</strong> ${university.establishedYear}</li>
                        <li class="mb-3 border-bottom border-light pb-2"><i class="fas fa-award me-2 opacity-75"></i> <strong>Accreditation:</strong> ${not empty university.accreditation ? university.accreditation : 'N/A'}</li>
                        <li class="mb-3 border-bottom border-light pb-2"><i class="fas fa-globe me-2 opacity-75"></i> <a href="${university.website}" target="_blank" class="text-white text-decoration-none"><strong>Website:</strong> Visit Site <i class="fas fa-external-link-alt ms-1 small"></i></a></li>
                        <li class="mb-3 border-bottom border-light pb-2"><i class="fas fa-rupee-sign me-2 opacity-75"></i> <strong>Avg Fees:</strong> ${university.fees != null ? university.fees : 'N/A'}</li>
                        <li class="mb-0"><i class="fas fa-chart-line me-2 opacity-75"></i> <strong>Placement Rate:</strong> ${not empty university.placementPercentage ? university.placementPercentage : 'N/A'}</li>
                    </ul>
                </div>
            </div>

            <!-- Contact Card -->
            <div class="card border-0 shadow-sm rounded-4">
                <div class="card-body p-4">
                    <h6 class="fw-bold border-bottom pb-2 mb-3">Admission Contact</h6>
                    <ul class="list-unstyled mb-0">
                        <li class="mb-2"><i class="fas fa-user text-primary me-2 width-20"></i> ${not empty university.admissionContact ? university.admissionContact : 'N/A'}</li>
                        <li class="mb-2"><i class="fas fa-envelope text-primary me-2 width-20"></i> <a href="mailto:${university.email}" class="text-decoration-none">${not empty university.email ? university.email : 'N/A'}</a></li>
                        <li class="mb-2"><i class="fas fa-phone-alt text-primary me-2 width-20"></i> ${not empty university.phone ? university.phone : 'N/A'}</li>
                        <li class="mb-0"><i class="fab fa-whatsapp text-success me-2 width-20"></i> ${not empty university.whatsapp ? university.whatsapp : 'N/A'}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</t:providerLayout>
