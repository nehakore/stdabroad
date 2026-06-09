package com.platform.model;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    
    @Column(unique = true)
    private String email;
    
    private String phone;
    private String password;
    
    // Student specifics
    private String countryInterest;
    private String courseInterest;
    private String budget;
    
    // Job Seeker specifics
    private String skills;
    private String experience;
    private String preferredCountry;
    private String expectedSalary;
    
    private String resumeUrl;
    
    @Enumerated(EnumType.STRING)
    private Role role;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getCountryInterest() { return countryInterest; }
    public void setCountryInterest(String countryInterest) { this.countryInterest = countryInterest; }
    
    public String getCourseInterest() { return courseInterest; }
    public void setCourseInterest(String courseInterest) { this.courseInterest = courseInterest; }
    
    public String getBudget() { return budget; }
    public void setBudget(String budget) { this.budget = budget; }
    
    public String getSkills() { return skills; }
    public void setSkills(String skills) { this.skills = skills; }
    
    public String getExperience() { return experience; }
    public void setExperience(String experience) { this.experience = experience; }
    
    public String getPreferredCountry() { return preferredCountry; }
    public void setPreferredCountry(String preferredCountry) { this.preferredCountry = preferredCountry; }
    
    public String getExpectedSalary() { return expectedSalary; }
    public void setExpectedSalary(String expectedSalary) { this.expectedSalary = expectedSalary; }
    
    public String getResumeUrl() { return resumeUrl; }
    public void setResumeUrl(String resumeUrl) { this.resumeUrl = resumeUrl; }
    
    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }
}
