<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp">
    <jsp:param name="title" value="Enquire - ${university.name}" />
</jsp:include>
<jsp:include page="../common/navbar.jsp" />

<div class="container py-5 mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6" data-aos="fade-up">
            <div class="card shadow border-0 rounded-4">
                <div class="card-header bg-primary text-white p-4 text-center rounded-top-4">
                    <h3 class="mb-0 fw-bold">Enquire Now</h3>
                    <p class="mb-0 mt-2 opacity-75">Send your questions directly to <strong>${university.name}</strong></p>
                </div>
                <div class="card-body p-4 p-md-5">
                    
                    <div class="d-flex align-items-center mb-4 p-3 bg-light rounded-3">
                        <img src="${not empty university.imageUrl ? university.imageUrl : 'https://via.placeholder.com/60'}" 
                             alt="${university.name} Logo" 
                             class="rounded-circle me-3 border" 
                             style="width: 60px; height: 60px; object-fit: cover;">
                        <div>
                            <h5 class="mb-1 text-dark fw-bold">${university.name}</h5>
                            <div class="text-muted small">
                                <i class="fas fa-map-marker-alt text-danger me-1"></i>
                                ${university.city}, ${university.country.name}
                            </div>
                        </div>
                    </div>

                    <form action="/user/enquire-uni" method="post">
                        <input type="hidden" name="universityId" value="${university.id}">
                        
                        <div class="mb-3">
                            <label class="form-label text-muted fw-semibold small">Full Name</label>
                            <input type="text" class="form-control bg-light" value="${user.name}" readonly>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label text-muted fw-semibold small">Email Address</label>
                            <input type="email" class="form-control bg-light" value="${user.email}" readonly>
                        </div>
                        
                        <div class="mb-3">
                            <label for="phone" class="form-label text-muted fw-semibold small">Phone Number / WhatsApp <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="e.g. +1 234 567 8900" required>
                        </div>
                        
                        <div class="mb-4">
                            <label for="message" class="form-label text-muted fw-semibold small">Your Message / Questions <span class="text-danger">*</span></label>
                            <textarea class="form-control" id="message" name="message" rows="5" placeholder="I am interested in studying at your university. Could you please provide more information about..." required></textarea>
                        </div>
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <a href="javascript:history.back()" class="btn btn-light px-4">Cancel</a>
                            <button type="submit" class="btn btn-primary px-5">Send Enquiry <i class="fas fa-paper-plane ms-2"></i></button>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />
