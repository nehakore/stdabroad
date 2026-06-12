<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Browse Courses - Study & Jobs Abroad" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="container pt-3 pb-5" style="min-height: 70vh;">
    <div class="d-flex justify-content-between align-items-center mb-5" data-aos="fade-down">
        <div>
            <h2 class="fw-bold text-primary">Discover Academic Programs</h2>
            <p class="text-muted">Explore bachelor, master, and diploma programs at world-class universities.</p>
        </div>
    </div>

    <div class="row g-4">
        <c:forEach var="course" items="${courses}">
            <div class="col-md-6" data-aos="fade-up">
                <div class="card h-100 border-0 shadow-sm" style="border-radius: 16px; overflow: hidden; background: #ffffff; border: 1px solid #f1f5f9; transition: transform 0.2s, box-shadow 0.2s;" onmouseover="this.style.transform='translateY(-3px)'; this.style.boxShadow='0 10px 15px -3px rgba(0,0,0,0.1)';" onmouseout="this.style.transform='none'; this.style.boxShadow='none';">
                    <div class="card-body p-4 d-flex flex-column">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div>
                                <span class="badge bg-primary-subtle text-primary rounded-pill mb-2 px-3">${course.degreeType}</span>
                                <h4 class="card-title fw-bold mb-1 text-dark">${course.name}</h4>
                                <p class="text-muted mb-0"><i class="fas fa-university me-1"></i> ${course.university.name} · <i class="fas fa-map-marker-alt me-1"></i> ${course.university.country.name}</p>
                            </div>
                        </div>

                        <div class="row g-3 my-2 py-3 border-top border-bottom border-light text-muted small">
                            <div class="col-6">
                                <div><i class="fas fa-clock text-secondary me-2"></i><strong>Duration:</strong> ${course.duration}</div>
                            </div>
                            <div class="col-6">
                                <div><i class="fas fa-wallet text-secondary me-2"></i><strong>Annual Fees:</strong> $${course.fees}</div>
                            </div>
                            <div class="col-6">
                                <div><i class="fas fa-users text-secondary me-2"></i><strong>Capacity:</strong> ${course.intakeCapacity} Students</div>
                            </div>
                            <div class="col-6">
                                <div><i class="fas fa-award text-secondary me-2"></i><strong>Type:</strong> ${course.type}</div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <h6 class="fw-semibold text-dark mb-1" style="font-size: 0.85rem;">Eligibility Criteria:</h6>
                            <p class="text-muted small mb-0">${course.eligibilityCriteria}</p>
                        </div>

                        <div class="mt-auto pt-3 d-flex gap-2">
                            <c:choose>
                                <c:when test="${empty sessionScope.loggedInUser}">
                                    <a href="/login?alert=login_required" class="btn btn-outline-primary rounded-pill w-100">Enquire Now</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/user/enquire-uni?id=${course.university.id}" class="btn btn-primary rounded-pill shadow-sm flex-grow-1">Enquire Now</a>
                                    
                                    <!-- Save / Unsave bookmark logic using savedCourseIds -->
                                    <c:set var="isSaved" value="false" />
                                    <c:if test="${not empty savedCourseIds}">
                                        <c:forEach var="savedId" items="${savedCourseIds}">
                                            <c:if test="${savedId == course.id}">
                                                <c:set var="isSaved" value="true" />
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    
                                    <c:choose>
                                        <c:when test="${isSaved}">
                                            <a href="/user/unsave-course?id=${course.id}&redirect=courses" class="btn btn-danger rounded-pill px-3" title="Unsave Course">
                                                <i class="fas fa-bookmark"></i>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/user/save-course?id=${course.id}&redirect=courses" class="btn btn-outline-primary rounded-pill px-3" title="Save Course">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty courses}">
            <div class="col-12 text-center text-muted py-5">
                <i class="fas fa-book-open fa-4x mb-3 text-light"></i>
                <h5>No courses found. Check back soon!</h5>
            </div>
        </c:if>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
