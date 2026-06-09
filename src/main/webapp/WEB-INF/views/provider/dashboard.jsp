<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:providerLayout>
    <c:set var="activePage" value="dashboard" scope="request" />

    <!-- Include Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
        <div>
            <h2 class="fw-bold mb-0" style="color: #1E3A8A;">University Partner Dashboard</h2>
            <p class="text-muted mb-0">Manage your universities, applications, and student leads effectively.</p>
        </div>
        <a href="/provider/universities/add" class="btn btn-primary shadow-sm rounded-pill px-4 py-2" style="background: linear-gradient(45deg, #1E3A8A, #38BDF8); border: none;">
            <i class="fas fa-plus me-2"></i> Add New University
        </a>
    </div>

    <!-- Statistics Cards -->
    <div class="row g-4 mb-5">
        <div class="col-xl-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100 overflow-hidden text-white transition-hover" style="background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); transition: transform 0.3s ease;">
                <div class="card-body p-4 position-relative">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h6 class="fw-semibold mb-0 text-white-50">Total Universities</h6>
                        <div class="bg-white bg-opacity-25 rounded-circle p-2 d-flex align-items-center justify-content-center shadow-sm" style="width: 45px; height: 45px;">
                            <i class="fas fa-university fs-5 text-white"></i>
                        </div>
                    </div>
                    <h2 class="fw-bold mb-0 display-5">${universityCount}</h2>
                </div>
            </div>
        </div>
        
        <div class="col-xl-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100 overflow-hidden text-white transition-hover" style="background: linear-gradient(135deg, #00b4db 0%, #0083b0 100%); transition: transform 0.3s ease;">
                <div class="card-body p-4 position-relative">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h6 class="fw-semibold mb-0 text-white-50">Student Applications</h6>
                        <div class="bg-white bg-opacity-25 rounded-circle p-2 d-flex align-items-center justify-content-center shadow-sm" style="width: 45px; height: 45px;">
                            <i class="fas fa-file-alt fs-5 text-white"></i>
                        </div>
                    </div>
                    <h2 class="fw-bold mb-0 display-5">${applicationCount}</h2>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100 overflow-hidden text-white transition-hover" style="background: linear-gradient(135deg, #f2994a 0%, #f2c94c 100%); transition: transform 0.3s ease;">
                <div class="card-body p-4 position-relative">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h6 class="fw-semibold mb-0 text-white-50">Total Leads</h6>
                        <div class="bg-white bg-opacity-25 rounded-circle p-2 d-flex align-items-center justify-content-center shadow-sm" style="width: 45px; height: 45px;">
                            <i class="fas fa-bullseye fs-5 text-white"></i>
                        </div>
                    </div>
                    <h2 class="fw-bold mb-0 display-5">${leadCount}</h2>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <div class="card border-0 shadow-sm rounded-4 h-100 overflow-hidden text-white transition-hover" style="background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%); transition: transform 0.3s ease;">
                <div class="card-body p-4 position-relative">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h6 class="fw-semibold mb-0 text-white-50">Total Enquiries</h6>
                        <div class="bg-white bg-opacity-25 rounded-circle p-2 d-flex align-items-center justify-content-center shadow-sm" style="width: 45px; height: 45px;">
                            <i class="fas fa-envelope-open-text fs-5 text-white"></i>
                        </div>
                    </div>
                    <h2 class="fw-bold mb-0 display-5">${enquiryCount}</h2>
                </div>
            </div>
        </div>
    </div>

    <!-- Analytics and Activity Section -->
    <div class="row g-4">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-header bg-white border-0 pt-4 pb-0 px-4">
                    <h5 class="fw-bold text-dark"><i class="fas fa-chart-line text-primary me-2"></i> Application & Lead Trends</h5>
                </div>
                <div class="card-body p-4">
                    <canvas id="trendsChart" height="100"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 h-100">
                <div class="card-header bg-white border-0 pt-4 pb-0 px-4">
                    <h5 class="fw-bold text-dark"><i class="fas fa-bell text-warning me-2"></i> Recent Activity</h5>
                </div>
                <div class="card-body p-4">
                    <ul class="list-unstyled mb-0">
                        <!-- Placeholder static data since there's no dynamic activity feed yet -->
                        <li class="mb-4 d-flex align-items-start">
                            <div class="bg-primary bg-opacity-10 text-primary rounded-circle p-2 me-3 shadow-sm">
                                <i class="fas fa-file-signature"></i>
                            </div>
                            <div>
                                <h6 class="mb-1 fw-bold text-dark">New Application Received</h6>
                                <p class="mb-0 text-muted small">A student applied for Computer Science.</p>
                                <small class="text-secondary">2 hours ago</small>
                            </div>
                        </li>
                        <li class="mb-4 d-flex align-items-start">
                            <div class="bg-info bg-opacity-10 text-info rounded-circle p-2 me-3 shadow-sm">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div>
                                <h6 class="mb-1 fw-bold text-dark">New Enquiry</h6>
                                <p class="mb-0 text-muted small">Question about admission deadlines.</p>
                                <small class="text-secondary">5 hours ago</small>
                            </div>
                        </li>
                        <li class="mb-4 d-flex align-items-start">
                            <div class="bg-success bg-opacity-10 text-success rounded-circle p-2 me-3 shadow-sm">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div>
                                <h6 class="mb-1 fw-bold text-dark">University Approved</h6>
                                <p class="mb-0 text-muted small">Your recent university listing was approved by Admin.</p>
                                <small class="text-secondary">1 day ago</small>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="card-footer bg-white border-0 text-center pb-4">
                    <a href="/provider/applications" class="btn btn-sm btn-outline-primary rounded-pill px-4">View All Activities</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Links Row -->
    <div class="row g-4 mt-2 mb-4">
        <div class="col-md-4">
            <a href="/provider/universities" class="text-decoration-none">
                <div class="card border-0 shadow-sm rounded-4 text-center transition-hover">
                    <div class="card-body p-4">
                        <i class="fas fa-university fs-2 text-primary mb-3"></i>
                        <h5 class="fw-bold text-dark mb-0">Manage Universities</h5>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="/provider/scholarships" class="text-decoration-none">
                <div class="card border-0 shadow-sm rounded-4 text-center transition-hover">
                    <div class="card-body p-4">
                        <i class="fas fa-award fs-2 text-warning mb-3"></i>
                        <h5 class="fw-bold text-dark mb-0">Manage Scholarships</h5>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="/provider/applications" class="text-decoration-none">
                <div class="card border-0 shadow-sm rounded-4 text-center transition-hover">
                    <div class="card-body p-4">
                        <i class="fas fa-folder-open fs-2 text-success mb-3"></i>
                        <h5 class="fw-bold text-dark mb-0">Review Applications</h5>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <style>
        .transition-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var ctx = document.getElementById('trendsChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                    datasets: [
                        {
                            label: 'Applications',
                            data: [12, 19, 15, 25, 22, ${applicationCount > 0 ? applicationCount : 30}],
                            borderColor: '#38ef7d',
                            backgroundColor: 'rgba(56, 239, 125, 0.1)',
                            borderWidth: 3,
                            tension: 0.4,
                            fill: true
                        },
                        {
                            label: 'Leads',
                            data: [8, 15, 10, 18, 20, ${leadCount > 0 ? leadCount : 25}],
                            borderColor: '#f2c94c',
                            backgroundColor: 'rgba(242, 201, 76, 0.1)',
                            borderWidth: 3,
                            tension: 0.4,
                            fill: true
                        }
                    ]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                            labels: {
                                font: {
                                    family: "'Inter', sans-serif",
                                    weight: 'bold'
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            grid: {
                                borderDash: [5, 5]
                            }
                        },
                        x: {
                            grid: {
                                display: false
                            }
                        }
                    }
                }
            });
        });
    </script>
</t:providerLayout>
