package com.platform.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "counselling_sessions")
public class CounsellingSession {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "university_id")
    private University university;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    private LocalDateTime sessionDate;
    private String appointmentTime;
    private String meetingMode; // Online, Offline
    private String counsellorName;
    
    @Column(columnDefinition = "TEXT")
    private String notes;

    private String topic;
    private String status; // Scheduled, Completed, Cancelled, Rescheduled

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public University getUniversity() { return university; }
    public void setUniversity(University university) { this.university = university; }

    public Course getCourse() { return course; }
    public void setCourse(Course course) { this.course = course; }

    public LocalDateTime getSessionDate() { return sessionDate; }
    public void setSessionDate(LocalDateTime sessionDate) { this.sessionDate = sessionDate; }

    public String getAppointmentTime() { return appointmentTime; }
    public void setAppointmentTime(String appointmentTime) { this.appointmentTime = appointmentTime; }

    public String getMeetingMode() { return meetingMode; }
    public void setMeetingMode(String meetingMode) { this.meetingMode = meetingMode; }

    public String getCounsellorName() { return counsellorName; }
    public void setCounsellorName(String counsellorName) { this.counsellorName = counsellorName; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
    
    public String getTopic() { return topic; }
    public void setTopic(String topic) { this.topic = topic; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
