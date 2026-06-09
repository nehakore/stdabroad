package com.platform.model;

import jakarta.persistence.*;

@Entity
@Table(name = "visa_guides")
public class VisaGuide {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "country_id")
    private Country country;

    private String visaType; // e.g., "F-1 Student Visa"

    @Column(columnDefinition = "TEXT")
    private String description;

    private String processingTime; // e.g., "3-4 Weeks"

    private String fee; // e.g., "$160"

    @Column(columnDefinition = "TEXT")
    private String requiredDocuments; // Can be bullet points

    @Column(columnDefinition = "TEXT")
    private String applicationProcess; // Steps

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Country getCountry() { return country; }
    public void setCountry(Country country) { this.country = country; }

    public String getVisaType() { return visaType; }
    public void setVisaType(String visaType) { this.visaType = visaType; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getProcessingTime() { return processingTime; }
    public void setProcessingTime(String processingTime) { this.processingTime = processingTime; }

    public String getFee() { return fee; }
    public void setFee(String fee) { this.fee = fee; }

    public String getRequiredDocuments() { return requiredDocuments; }
    public void setRequiredDocuments(String requiredDocuments) { this.requiredDocuments = requiredDocuments; }

    public String getApplicationProcess() { return applicationProcess; }
    public void setApplicationProcess(String applicationProcess) { this.applicationProcess = applicationProcess; }
}
