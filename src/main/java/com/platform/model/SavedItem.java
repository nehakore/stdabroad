package com.platform.model;

import jakarta.persistence.*;

@Entity
@Table(name = "saved_items")
public class SavedItem {

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
    @JoinColumn(name = "job_id")
    private Job job;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    
    public University getUniversity() { return university; }
    public void setUniversity(University university) { this.university = university; }
    
    public Job getJob() { return job; }
    public void setJob(Job job) { this.job = job; }
}
