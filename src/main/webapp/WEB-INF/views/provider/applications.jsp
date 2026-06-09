<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:providerLayout>
    <c:set var="activePage" value="applications" scope="request" />

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold mb-0">Student Applications</h2>
    </div>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="ps-4">Student</th>
                            <th>University</th>
                            <th>Course</th>
                            <th>Applied Date</th>
                            <th>Status</th>
                            <th class="text-end pe-4">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="a" items="${applications}">
                            <tr>
                                <td class="ps-4 fw-medium">${a.user.name}</td>
                                <td>${a.course.university.name}</td>
                                <td>${a.course.name}</td>
                                <td>${a.appliedAt}</td>
                                <td><span class="badge bg-primary">${a.status}</span></td>
                                <td class="text-end pe-4">
                                    <button class="btn btn-sm btn-outline-primary">Review</button>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty applications}">
                            <tr>
                                <td colspan="6" class="text-center py-5 text-muted">No applications found.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</t:providerLayout>
