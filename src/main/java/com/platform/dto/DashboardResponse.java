package com.platform.dto;

public class DashboardResponse {
    private String studentName;
    private long savedUniversities;
    private long savedCourses;
    private long applicationsSubmitted;
    private long scholarshipsAvailable;
    private int profileCompletion;

    public DashboardResponse() {}

    public DashboardResponse(String studentName, long savedUniversities, long savedCourses,
                             long applicationsSubmitted, long scholarshipsAvailable, int profileCompletion) {
        this.studentName = studentName;
        this.savedUniversities = savedUniversities;
        this.savedCourses = savedCourses;
        this.applicationsSubmitted = applicationsSubmitted;
        this.scholarshipsAvailable = scholarshipsAvailable;
        this.profileCompletion = profileCompletion;
    }

    // Getters and Setters
    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public long getSavedUniversities() { return savedUniversities; }
    public void setSavedUniversities(long savedUniversities) { this.savedUniversities = savedUniversities; }

    public long getSavedCourses() { return savedCourses; }
    public void setSavedCourses(long savedCourses) { this.savedCourses = savedCourses; }

    public long getApplicationsSubmitted() { return applicationsSubmitted; }
    public void setApplicationsSubmitted(long applicationsSubmitted) { this.applicationsSubmitted = applicationsSubmitted; }

    public long getScholarshipsAvailable() { return scholarshipsAvailable; }
    public void setScholarshipsAvailable(long scholarshipsAvailable) { this.scholarshipsAvailable = scholarshipsAvailable; }

    public int getProfileCompletion() { return profileCompletion; }
    public void setProfileCompletion(int profileCompletion) { this.profileCompletion = profileCompletion; }
}
