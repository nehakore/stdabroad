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
                <div class="card h-100 flex-md-row uni-item"
                     data-id="${university.id}"
                     data-name="${university.name}"
                     data-city="${university.city}"
                     data-country="${not empty university.country ? university.country.name : ''}"
                     data-description="<c:out value='${university.description}'/>"
                     data-type="${university.type}"
                     data-established="${university.establishedYear}"
                     data-accreditation="${university.accreditation}"
                     data-website="${university.website}"
                     data-fees="${university.fees}"
                     data-ranking="${university.ranking}"
                     data-placement="${university.placementPercentage}"
                     data-image="${university.imageUrl}"
                     data-banner="${university.bannerImage}"
                     data-docs="<c:out value='${university.requiredDocuments}'/>"
                     data-recruiters="<c:out value='${university.topRecruiters}'/>"
                     data-contact-name="${university.admissionContact}"
                     data-contact-email="${university.email}"
                     data-contact-phone="${university.phone}"
                     data-contact-whatsapp="${university.whatsapp}"
                     data-has-hostel="${university.hasHostel}"
                     data-has-library="${university.hasLibrary}"
                     data-has-sports="${university.hasSports}"
                     data-has-placement="${university.hasPlacementSupport}"
                     data-has-transport="${university.hasTransport}"
                     data-has-wifi="${university.hasWifi}"
                     data-has-labs="${university.hasLabs}"
                     data-has-cafeteria="${university.hasCafeteria}">
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
                                    <div class="d-flex gap-2">
                                        <a href="/login?alert=login_required" class="btn btn-outline-primary rounded-pill flex-grow-1">Enquire Now</a>
                                        <button class="btn btn-outline-info rounded-pill px-3" onclick="viewUniversityDetails(this)">
                                            <i class="fas fa-eye"></i> View
                                        </button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="d-flex gap-2">
                                        <a href="/user/enquire-uni?id=${university.id}" class="btn btn-primary rounded-pill shadow-sm flex-grow-1">Enquire Now</a>
                                        <button class="btn btn-outline-info rounded-pill px-3" onclick="viewUniversityDetails(this)">
                                            <i class="fas fa-eye"></i> View
                                        </button>
                                        
                                        <!-- Save / Unsave bookmark logic using savedUniIds -->
                                        <c:set var="isSaved" value="false" />
                                        <c:if test="${not empty savedUniIds}">
                                            <c:forEach var="savedId" items="${savedUniIds}">
                                                <c:if test="${savedId == university.id}">
                                                    <c:set var="isSaved" value="true" />
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                        
                                        <c:choose>
                                            <c:when test="${isSaved}">
                                                <a href="/user/unsave-university?id=${university.id}&redirect=universities" class="btn btn-danger rounded-pill px-3" title="Unsave University">
                                                    <i class="fas fa-bookmark"></i>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/user/save-university?id=${university.id}&redirect=universities" class="btn btn-outline-primary rounded-pill px-3" title="Save University">
                                                    <i class="far fa-bookmark"></i>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
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

<style>
    /* Custom University Details Modal */
    .custom-modal {
        display: none;
        position: fixed;
        top: 0; left: 0; width: 100%; height: 100%;
        background: rgba(15, 23, 42, 0.6);
        backdrop-filter: blur(8px);
        z-index: 1000;
        align-items: center;
        justify-content: center;
        opacity: 0;
        transition: opacity 0.3s ease;
    }
    .custom-modal.show {
        display: flex;
        opacity: 1;
    }
    .custom-modal-content {
        background: #fff;
        border-radius: 20px;
        width: 90%;
        max-width: 800px;
        max-height: 90vh;
        overflow-y: auto;
        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        animation: modalSlideUp 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
        position: relative;
    }
    @keyframes modalSlideUp {
        from { transform: translateY(30px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }
    .custom-modal-header {
        position: relative;
        height: 200px;
        display: flex;
        align-items: flex-end;
        padding: 24px;
        color: #fff;
    }
    .custom-modal-header-overlay {
        position: absolute;
        top: 0; left: 0; width: 100%; height: 100%;
        background: linear-gradient(180deg, rgba(15,23,42,0.1) 0%, rgba(15,23,42,0.85) 100%);
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
    }
    .custom-modal-header-text {
        position: relative;
        z-index: 2;
    }
    .custom-modal-close {
        position: absolute;
        top: 16px; right: 16px;
        width: 36px; height: 36px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.2);
        border: none;
        color: #fff;
        font-size: 1.2rem;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.2s;
        z-index: 10;
    }
    .custom-modal-close:hover {
        background: rgba(255, 255, 255, 0.3);
        transform: scale(1.05);
    }
    .custom-modal-body {
        padding: 28px;
    }
    .btn-sd-primary {
        background: linear-gradient(135deg, #6366f1, #8b5cf6);
        color: #fff;
        border: none;
        padding: 10px 18px;
        border-radius: 10px;
        font-size: 0.9rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s;
        box-shadow: 0 4px 12px rgba(99,102,241,0.2);
        text-align: center;
    }
    .btn-sd-primary:hover {
        transform: translateY(-1px);
        box-shadow: 0 6px 18px rgba(99,102,241,0.3);
    }
    .facility-chip {
        background: #f8fafc;
        border: 1px solid #e2e8f0;
        color: #334155;
        padding: 8px 16px;
        border-radius: 12px;
        font-size: 0.82rem;
        font-weight: 500;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }
</style>

<script>
    function viewUniversityDetails(btn) {
        const card = btn.closest('.uni-item');
        if (!card) return;

        const ds = card.dataset;

        // Header image
        const headerEl = document.getElementById('uni-modal-header');
        if (ds.banner && ds.banner.startsWith('http')) {
            headerEl.style.background = `url('${ds.banner}') center/cover no-repeat`;
        } else if (ds.image && ds.image.startsWith('http')) {
            headerEl.style.background = `url('${ds.image}') center/cover no-repeat`;
        } else {
            headerEl.style.background = `linear-gradient(135deg, #6366f1, #8b5cf6)`;
        }

        document.getElementById('uni-modal-name').textContent = ds.name || 'University Details';
        document.getElementById('uni-modal-location').textContent = `${ds.city || ''}, ${ds.country || ''}`;
        
        // Quick Facts
        document.getElementById('uni-modal-type').textContent = ds.type || 'N/A';
        document.getElementById('uni-modal-ranking').textContent = ds.ranking ? `#${ds.ranking}` : 'N/A';
        document.getElementById('uni-modal-fees').textContent = ds.fees ? `$${ds.fees}` : 'N/A';
        document.getElementById('uni-modal-placement').textContent = ds.placement ? `${ds.placement}%` : 'N/A';
        document.getElementById('uni-modal-est').textContent = ds.established || 'N/A';
        document.getElementById('uni-modal-accreditation').textContent = ds.accreditation || 'N/A';
        
        const webLink = document.getElementById('uni-modal-website');
        if (ds.website) {
            webLink.href = ds.website;
            webLink.style.display = 'inline-flex';
        } else {
            webLink.style.display = 'none';
        }

        // About & Description
        document.getElementById('uni-modal-desc').textContent = ds.description || 'No description available.';
        document.getElementById('uni-modal-docs').textContent = ds.docs || 'No specific documents specified.';
        document.getElementById('uni-modal-recruiters').textContent = ds.recruiters || 'No recruiter details specified.';
        
        // Facilities
        const facilitiesList = document.getElementById('uni-modal-facilities');
        facilitiesList.innerHTML = '';
        const facilities = [
            { key: 'hasHostel', label: 'Hostel', icon: 'fa-bed' },
            { key: 'hasLibrary', label: 'Library', icon: 'fa-book' },
            { key: 'hasSports', label: 'Sports', icon: 'fa-volleyball-ball' },
            { key: 'hasPlacement', label: 'Placement Support', icon: 'fa-briefcase' },
            { key: 'hasTransport', label: 'Transport', icon: 'fa-bus' },
            { key: 'hasWifi', label: 'Wi-Fi', icon: 'fa-wifi' },
            { key: 'hasLabs', label: 'Laboratories', icon: 'fa-flask' },
            { key: 'hasCafeteria', label: 'Cafeteria', icon: 'fa-coffee' }
        ];
        let hasAnyFacility = false;
        facilities.forEach(f => {
            if (ds[f.key] === 'true') {
                hasAnyFacility = true;
                const span = document.createElement('span');
                span.className = 'facility-chip';
                span.innerHTML = `<i class="fas ${f.icon} text-primary"></i> ${f.label}`;
                facilitiesList.appendChild(span);
            }
        });
        if (!hasAnyFacility) {
            facilitiesList.innerHTML = '<span class="text-muted small">No campus facilities listed.</span>';
        }

        // Contact details
        document.getElementById('uni-modal-contact-name').textContent = ds.contactName || 'N/A';
        document.getElementById('uni-modal-contact-email').textContent = ds.contactEmail || 'N/A';
        document.getElementById('uni-modal-contact-email').href = ds.contactEmail ? `mailto:${ds.contactEmail}` : '#';
        document.getElementById('uni-modal-contact-phone').textContent = ds.contactPhone || 'N/A';
        document.getElementById('uni-modal-contact-whatsapp').textContent = ds.contactWhatsapp || 'N/A';

        // Show modal
        const modal = document.getElementById('uniDetailsModal');
        modal.style.display = 'flex';
        setTimeout(() => modal.classList.add('show'), 10);
    }

    function closeUniversityDetails() {
        const modal = document.getElementById('uniDetailsModal');
        modal.classList.remove('show');
        setTimeout(() => {
            modal.style.display = 'none';
        }, 300);
    }

    window.addEventListener('click', (e) => {
        const modal = document.getElementById('uniDetailsModal');
        if (e.target === modal) {
            closeUniversityDetails();
        }
    });
</script>

<!-- Custom University Details Modal -->
<div id="uniDetailsModal" class="custom-modal">
    <div class="custom-modal-content">
        <button class="custom-modal-close" onclick="closeUniversityDetails()">&times;</button>
        <div id="uni-modal-header" class="custom-modal-header">
            <div class="custom-modal-header-overlay"></div>
            <div class="custom-modal-header-text">
                <h2 id="uni-modal-name" class="fw-bold mb-1" style="font-size: 1.8rem; margin: 0; color: #fff;"></h2>
                <div id="uni-modal-location" class="small opacity-90"><i class="fas fa-map-marker-alt me-1 text-danger"></i></div>
            </div>
        </div>
        <div class="custom-modal-body">
            <div class="row">
                <!-- Left Column -->
                <div class="col-md-8 d-flex flex-column gap-4 text-start">
                    <div>
                        <h4 style="font-size: 1.1rem; font-weight: 700; color: #1e293b; margin-bottom: 8px; border-bottom: 2px solid #f1f5f9; padding-bottom: 6px; display: flex; align-items: center; gap: 8px;"><i class="fas fa-info-circle text-primary"></i> About University</h4>
                        <p id="uni-modal-desc" style="font-size: 0.88rem; color: #475569; line-height: 1.6; white-space: pre-wrap; margin: 0;"></p>
                    </div>
                    <div>
                        <h4 style="font-size: 1.1rem; font-weight: 700; color: #1e293b; margin-bottom: 8px; border-bottom: 2px solid #f1f5f9; padding-bottom: 6px; display: flex; align-items: center; gap: 8px;"><i class="fas fa-university text-primary"></i> Campus Facilities</h4>
                        <div id="uni-modal-facilities" style="display: flex; flex-wrap: wrap; gap: 8px; margin-top: 8px;"></div>
                    </div>
                    <div>
                        <h4 style="font-size: 1.1rem; font-weight: 700; color: #1e293b; margin-bottom: 8px; border-bottom: 2px solid #f1f5f9; padding-bottom: 6px; display: flex; align-items: center; gap: 8px;"><i class="fas fa-file-signature text-primary"></i> Required Documents</h4>
                        <p id="uni-modal-docs" style="font-size: 0.88rem; color: #475569; line-height: 1.6; white-space: pre-wrap; margin: 0;"></p>
                    </div>
                    <div>
                        <h4 style="font-size: 1.1rem; font-weight: 700; color: #1e293b; margin-bottom: 8px; border-bottom: 2px solid #f1f5f9; padding-bottom: 6px; display: flex; align-items: center; gap: 8px;"><i class="fas fa-handshake text-primary"></i> Top Recruiters</h4>
                        <p id="uni-modal-recruiters" style="font-size: 0.88rem; color: #475569; line-height: 1.6; white-space: pre-wrap; margin: 0;"></p>
                    </div>
                </div>
                <!-- Right Column -->
                <div class="col-md-4 d-flex flex-column gap-3 text-start">
                    <div style="background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 12px; padding: 16px; display: flex; flex-direction: column; gap: 12px;">
                        <h5 style="font-size: 0.95rem; font-weight: 700; color: #0f172a; border-bottom: 1px solid #e2e8f0; padding-bottom: 6px; margin: 0;">Quick Facts</h5>
                        <div style="font-size: 0.82rem; color: #475569;">
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Type:</strong> <span id="uni-modal-type"></span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Ranking:</strong> <span id="uni-modal-ranking"></span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Avg Fees:</strong> <span id="uni-modal-fees"></span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Placement Rate:</strong> <span id="uni-modal-placement"></span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Established:</strong> <span id="uni-modal-est"></span>
                            </div>
                            <div style="display: flex; justify-content: space-between; margin-bottom: 8px;">
                                <strong>Accreditation:</strong> <span id="uni-modal-accreditation" style="text-align: right; max-width: 120px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"></span>
                            </div>
                        </div>
                        <a id="uni-modal-website" href="#" target="_blank" class="btn-sd-primary" style="font-size: 0.8rem; padding: 6px 12px; text-decoration: none; justify-content: center; align-items: center; gap: 4px; display: inline-flex;">
                            Visit Website <i class="fas fa-external-link-alt small"></i>
                        </a>
                    </div>

                    <div style="background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 12px; padding: 16px; display: flex; flex-direction: column; gap: 10px;">
                        <h5 style="font-size: 0.95rem; font-weight: 700; color: #0f172a; border-bottom: 1px solid #e2e8f0; padding-bottom: 6px; margin: 0;">Admission Contact</h5>
                        <div style="font-size: 0.82rem; color: #475569; display: flex; flex-direction: column; gap: 8px;">
                            <div><i class="fas fa-user text-primary me-2"></i> <span id="uni-modal-contact-name"></span></div>
                            <div><i class="fas fa-envelope text-primary me-2"></i> <a id="uni-modal-contact-email" href="#" style="text-decoration: none; color: inherit;"></a></div>
                            <div><i class="fas fa-phone-alt text-primary me-2"></i> <span id="uni-modal-contact-phone"></span></div>
                            <div><i class="fab fa-whatsapp text-success me-2"></i> <span id="uni-modal-contact-whatsapp"></span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
