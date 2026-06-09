<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:providerLayout>
    <c:set var="activePage" value="my-universities" scope="request" />

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold mb-0">My Universities</h2>
        <a href="/provider/universities/add" class="btn btn-primary shadow-sm"><i class="fas fa-plus"></i> Add New</a>
    </div>

    <c:if test="${not empty successMsg}">
        <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
            <i class="fas fa-check-circle me-2"></i> ${successMsg}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="ps-4">University Name</th>
                            <th>Location</th>
                            <th>Status</th>
                            <th>Approval</th>
                            <th class="text-end pe-4">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${universities}">
                            <tr>
                                <td class="ps-4 fw-medium text-primary">
                                    <c:if test="${not empty u.imageUrl}">
                                        <img src="${u.imageUrl}" width="30" height="30" class="rounded-circle me-2 object-fit-cover">
                                    </c:if>
                                    ${u.name}
                                </td>
                                <td>${u.city}, ${u.country.name}</td>
                                <td>
                                    <span class="badge bg-${u.status == 'PUBLISHED' ? 'success' : 'secondary'}">${u.status}</span>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${u.approved}">
                                            <span class="badge bg-success bg-opacity-10 text-success"><i class="fas fa-check-circle"></i> Approved</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-warning bg-opacity-10 text-warning"><i class="fas fa-clock"></i> Pending</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-end pe-4">
                                    <a href="/provider/universities/edit/${u.id}" class="btn btn-sm btn-outline-primary"><i class="fas fa-edit"></i> Edit</a>
                                    <a href="/provider/universities/view/${u.id}" class="btn btn-sm btn-outline-secondary"><i class="fas fa-eye"></i> View</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty universities}">
                            <tr>
                                <td colspan="5" class="text-center py-5 text-muted">
                                    <i class="fas fa-university fs-1 mb-3 opacity-50 d-block"></i>
                                    <p>You haven't added any universities yet.</p>
                                    <a href="/provider/universities/add" class="btn btn-sm btn-primary">Add Your First University</a>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</t:providerLayout>
