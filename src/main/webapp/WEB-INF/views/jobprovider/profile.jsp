<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="jobprovider-sidebar.jsp" />

<c:if test="${not empty successMsg}">
    <div class="success-toast"><i class="fas fa-check-circle fs-5"></i> ${successMsg}</div>
</c:if>

<div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
    <div>
        <h5 class="fw-bold m-0" style="color:#0f172a;">Profile Settings</h5>
        <p class="text-muted m-0" style="font-size:0.82rem;">Manage your company profile and account information</p>
    </div>
</div>

<div class="row g-4">
    <!-- Profile Info Card -->
    <div class="col-lg-4">
        <div class="jp-card text-center mb-4">
            <div style="width:80px;height:80px;border-radius:20px;background:linear-gradient(135deg,#3b82f6,#6366f1);display:flex;align-items:center;justify-content:center;font-size:2rem;font-weight:800;color:#fff;margin:0 auto 16px;">
                ${not empty provider.organizationName ? provider.organizationName.substring(0,1).toUpperCase() : 'P'}
            </div>
            <h5 class="fw-bold m-0" style="color:#0f172a;">${provider.organizationName}</h5>
            <p class="text-muted" style="font-size:0.85rem;">${provider.email}</p>
            <div class="d-flex justify-content-center gap-2 flex-wrap mt-2">
                <span class="jp-badge jp-badge-info"><i class="fas fa-building me-1"></i>${provider.type}</span>
                <c:choose>
                    <c:when test="${provider.approved}">
                        <span class="jp-badge jp-badge-success"><i class="fas fa-verified me-1"></i>Verified</span>
                    </c:when>
                    <c:otherwise>
                        <span class="jp-badge jp-badge-warning"><i class="fas fa-clock me-1"></i>Pending Approval</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Quick Info -->
        <div class="jp-card">
            <div class="jp-form-section-title"><i class="fas fa-info-circle"></i> Account Info</div>
            <ul class="list-unstyled m-0" style="font-size:0.85rem; color:#334155;">
                <li class="d-flex gap-2 mb-3 align-items-start">
                    <i class="fas fa-envelope mt-1 text-primary" style="width:16px;"></i>
                    <div>
                        <div style="font-size:0.72rem;color:#94a3b8;font-weight:600;text-transform:uppercase;">Email</div>
                        <div>${provider.email}</div>
                    </div>
                </li>
                <c:if test="${not empty provider.mobile}">
                <li class="d-flex gap-2 mb-3 align-items-start">
                    <i class="fas fa-phone mt-1 text-primary" style="width:16px;"></i>
                    <div>
                        <div style="font-size:0.72rem;color:#94a3b8;font-weight:600;text-transform:uppercase;">Mobile</div>
                        <div>${provider.mobile}</div>
                    </div>
                </li>
                </c:if>
                <c:if test="${not empty provider.country}">
                <li class="d-flex gap-2 mb-3 align-items-start">
                    <i class="fas fa-map-marker-alt mt-1 text-primary" style="width:16px;"></i>
                    <div>
                        <div style="font-size:0.72rem;color:#94a3b8;font-weight:600;text-transform:uppercase;">Country</div>
                        <div>${provider.country}</div>
                    </div>
                </li>
                </c:if>
                <c:if test="${not empty provider.website}">
                <li class="d-flex gap-2 align-items-start">
                    <i class="fas fa-globe mt-1 text-primary" style="width:16px;"></i>
                    <div>
                        <div style="font-size:0.72rem;color:#94a3b8;font-weight:600;text-transform:uppercase;">Website</div>
                        <a href="${provider.website}" target="_blank" style="color:#3b82f6;">${provider.website}</a>
                    </div>
                </li>
                </c:if>
            </ul>
        </div>
    </div>

    <!-- Edit Profile Form -->
    <div class="col-lg-8">
        <form action="/jobprovider/update-profile" method="POST">
            <!-- Company Details -->
            <div class="jp-form-section">
                <div class="jp-form-section-title"><i class="fas fa-building"></i> Company Details</div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Organization Name <span class="text-danger">*</span></label>
                        <input type="text" name="organizationName" class="form-control" value="${provider.organizationName}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Contact Person Name</label>
                        <input type="text" name="contactName" class="form-control" value="${provider.contactName}">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Designation</label>
                        <input type="text" name="designation" class="form-control" value="${provider.designation}" placeholder="e.g. HR Manager">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Industry / Sector</label>
                        <input type="text" name="website" class="form-control" value="${provider.website}" placeholder="Company website URL">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Experience (Years in Business)</label>
                        <input type="text" name="experience" class="form-control" value="${provider.experience}" placeholder="e.g. 10">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">WhatsApp Number</label>
                        <input type="text" name="whatsapp" class="form-control" value="${provider.whatsapp}" placeholder="+971 50 000 0000">
                    </div>
                </div>
            </div>

            <!-- Contact & Address -->
            <div class="jp-form-section">
                <div class="jp-form-section-title"><i class="fas fa-map-marker-alt"></i> Contact & Address</div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" value="${provider.email}" disabled style="background:#f8fafc;">
                        <small class="text-muted">Email cannot be changed. Contact admin.</small>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Mobile</label>
                        <input type="text" name="mobile" class="form-control" value="${provider.mobile}">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Country</label>
                        <input type="text" name="country" class="form-control" value="${provider.country}">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">State</label>
                        <input type="text" name="state" class="form-control" value="${provider.state}">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">City</label>
                        <input type="text" name="city" class="form-control" value="${provider.city}">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Full Address</label>
                        <textarea name="address" class="form-control" rows="2" placeholder="Street address, office details...">${provider.address}</textarea>
                    </div>
                </div>
            </div>

            <!-- Submit -->
            <div class="jp-card d-flex justify-content-between align-items-center">
                <p class="text-muted m-0" style="font-size:0.82rem;">
                    <i class="fas fa-shield-alt me-1 text-success"></i>
                    Your information is kept secure and private.
                </p>
                <button type="submit" class="btn-jp-primary btn">
                    <i class="fas fa-save me-2"></i>Save Changes
                </button>
            </div>
        </form>

        <!-- Change Password -->
        <div class="jp-card mt-4">
            <div class="jp-form-section-title"><i class="fas fa-lock"></i> Change Password</div>
            <form action="/jobprovider/change-password" method="POST">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">New Password</label>
                        <input type="password" name="newPassword" class="form-control" placeholder="At least 8 characters">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Confirm New Password</label>
                        <input type="password" name="confirmPassword" class="form-control" placeholder="Repeat new password">
                    </div>
                    <div class="col-12 text-end">
                        <button type="submit" class="btn-jp-outline btn">
                            <i class="fas fa-key me-2"></i>Update Password
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="jobprovider-footer.jsp" />
