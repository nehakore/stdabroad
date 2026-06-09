package com.platform.model;

import jakarta.persistence.*;

@Entity
@Table(name = "courses")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String type; // UG, PG, MBA, Diploma
    private String degreeType; // Bachelors, Masters, PhD, etc.
    private String duration;
    private Double fees;

    @Column(columnDefinition = "TEXT")
    private String specializations;

    @Column(columnDefinition = "TEXT")
    private String eligibilityCriteria;

    private Integer intakeCapacity;

    @ManyToOne
    @JoinColumn(name = "university_id")
    private University university;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public String getDegreeType() { return degreeType; }
    public void setDegreeType(String degreeType) { this.degreeType = degreeType; }
    
    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }
    
    public Double getFees() { return fees; }
    public void setFees(Double fees) { this.fees = fees; }

    public String getSpecializations() { return specializations; }
    public void setSpecializations(String specializations) { this.specializations = specializations; }

    public String getEligibilityCriteria() { return eligibilityCriteria; }
    public void setEligibilityCriteria(String eligibilityCriteria) { this.eligibilityCriteria = eligibilityCriteria; }

    public Integer getIntakeCapacity() { return intakeCapacity; }
    public void setIntakeCapacity(Integer intakeCapacity) { this.intakeCapacity = intakeCapacity; }
    
    public University getUniversity() { return university; }
    public void setUniversity(University university) { this.university = university; }
}
