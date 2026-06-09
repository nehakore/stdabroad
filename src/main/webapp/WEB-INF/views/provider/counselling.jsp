<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:providerLayout>
    <c:set var="activePage" value="counselling" scope="request" />

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold mb-0">Counselling Sessions</h2>
    </div>

    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="ps-4">Student</th>
                            <th>Date & Time</th>
                            <th>Mode</th>
                            <th>University</th>
                            <th>Status</th>
                            <th class="text-end pe-4">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${sessions}">
                            <tr>
                                <td class="ps-4 fw-medium">${s.user.name}</td>
                                <td>${s.sessionDate} <br> <small>${s.appointmentTime}</small></td>
                                <td>${s.meetingMode}</td>
                                <td>${s.university.name}</td>
                                <td><span class="badge bg-info">${s.status}</span></td>
                                <td class="text-end pe-4">
                                    <button class="btn btn-sm btn-outline-success">Complete</button>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty sessions}">
                            <tr>
                                <td colspan="6" class="text-center py-5 text-muted">No counselling sessions scheduled.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</t:providerLayout>
