package com.platform.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "providers")
public class Provider {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String organizationName;
    private String type; // University or Company
    
    @Column(unique = true)
    private String email;
    private String password;
    
    private String govIdUrl;
    private String businessCertUrl;
    private String profilePhotoUrl;
    private String contactName;
    private String website;
    private String location;
    
    // New Fields from Registration Form
    private String mobile;
    private String whatsapp;
    private String designation;
    private Integer experience;
    private String address;
    private String country;
    private String state;
    private String city;
    
    private boolean isApproved = false;

    @OneToMany(mappedBy = "provider", cascade = CascadeType.ALL)
    private List<University> universities;

    @OneToMany(mappedBy = "provider", cascade = CascadeType.ALL)
    private List<Job> jobs;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public String getOrganizationName() { return organizationName; }
    public void setOrganizationName(String organizationName) { this.organizationName = organizationName; }
    
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getGovIdUrl() { return govIdUrl; }
    public void setGovIdUrl(String govIdUrl) { this.govIdUrl = govIdUrl; }
    
    public String getBusinessCertUrl() { return businessCertUrl; }
    public void setBusinessCertUrl(String businessCertUrl) { this.businessCertUrl = businessCertUrl; }
    
    public String getProfilePhotoUrl() { return profilePhotoUrl; }
    public void setProfilePhotoUrl(String profilePhotoUrl) { this.profilePhotoUrl = profilePhotoUrl; }
    
    public String getContactName() { return contactName; }
    public void setContactName(String contactName) { this.contactName = contactName; }
    
    public String getWebsite() { return website; }
    public void setWebsite(String website) { this.website = website; }
    
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    
    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }
    
    public String getWhatsapp() { return whatsapp; }
    public void setWhatsapp(String whatsapp) { this.whatsapp = whatsapp; }
    
    public String getDesignation() { return designation; }
    public void setDesignation(String designation) { this.designation = designation; }
    
    public Integer getExperience() { return experience; }
    public void setExperience(Integer experience) { this.experience = experience; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
    
    public String getState() { return state; }
    public void setState(String state) { this.state = state; }
    
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    
    public boolean isApproved() { return isApproved; }
    public void setApproved(boolean approved) { isApproved = approved; }

    public List<University> getUniversities() { return universities; }
    public void setUniversities(List<University> universities) { this.universities = universities; }

    public List<Job> getJobs() { return jobs; }
    public void setJobs(List<Job> jobs) { this.jobs = jobs; }
}
