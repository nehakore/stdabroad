package com.platform.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "jobs")
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Basic Info
    private String title;
    private String jobCategory;
    private String jobType;      // Full Time, Part Time, Contract, Internship, Seasonal
    private String industry;
    private Integer numberOfOpenings;

    // Location
    private String city;
    private String state;
    private String workMode;     // Remote, Onsite, Hybrid

    // Salary
    private String currency;
    private String minSalary;
    private String maxSalary;
    private boolean overtimeAvailable;
    private boolean bonusAvailable;

    // Description (rich text stored as TEXT)
    @Column(columnDefinition = "TEXT")
    private String description;
    @Column(columnDefinition = "TEXT")
    private String jobSummary;
    @Column(columnDefinition = "TEXT")
    private String responsibilities;
    @Column(columnDefinition = "TEXT")
    private String dailyTasks;
    @Column(columnDefinition = "TEXT")
    private String requiredSkills;
    @Column(columnDefinition = "TEXT")
    private String preferredSkills;

    // Legacy fields
    private String expectedSalary;
    private String skillsRequired;
    private String imageUrl;

    // Eligibility
    private String minEducation;
    private String requiredDegree;
    private String experienceRequired;
    private String ageLimit;
    private String genderPreference;
    private String languageRequirements;
    private String certificationsRequired;

    // Visa & Immigration
    private boolean visaSponsorship;
    private String visaType;
    private boolean workPermitAssistance;
    private boolean relocationAssistance;
    private boolean accommodationProvided;
    private boolean airTicketProvided;
    private boolean medicalInsurance;

    // Documents Required (comma-separated)
    @Column(columnDefinition = "TEXT")
    private String documentsRequired;

    // Application Info
    private String applicationDeadline;
    private String interviewProcess;
    private String expectedJoiningDate;
    private String recruitmentFee;

    // Status: DRAFT, PUBLISHED, CLOSED, FEATURED
    private String status = "DRAFT";
    private boolean featured = false;

    private LocalDateTime postedDate = LocalDateTime.now();

    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country;

    @ManyToOne
    @JoinColumn(name = "provider_id")
    private Provider provider;

    private boolean isApproved = false;

    // Legacy visa fields
    private boolean hasVisaSponsorship;
    @Column(columnDefinition = "TEXT")
    private String visaSponsorshipDetails;

    // ── Getters & Setters ──────────────────────────────────────────────────────

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getJobCategory() { return jobCategory; }
    public void setJobCategory(String jobCategory) { this.jobCategory = jobCategory; }

    public String getJobType() { return jobType; }
    public void setJobType(String jobType) { this.jobType = jobType; }

    public String getIndustry() { return industry; }
    public void setIndustry(String industry) { this.industry = industry; }

    public Integer getNumberOfOpenings() { return numberOfOpenings; }
    public void setNumberOfOpenings(Integer numberOfOpenings) { this.numberOfOpenings = numberOfOpenings; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getWorkMode() { return workMode; }
    public void setWorkMode(String workMode) { this.workMode = workMode; }

    public String getCurrency() { return currency; }
    public void setCurrency(String currency) { this.currency = currency; }

    public String getMinSalary() { return minSalary; }
    public void setMinSalary(String minSalary) { this.minSalary = minSalary; }

    public String getMaxSalary() { return maxSalary; }
    public void setMaxSalary(String maxSalary) { this.maxSalary = maxSalary; }

    public boolean isOvertimeAvailable() { return overtimeAvailable; }
    public void setOvertimeAvailable(boolean overtimeAvailable) { this.overtimeAvailable = overtimeAvailable; }

    public boolean isBonusAvailable() { return bonusAvailable; }
    public void setBonusAvailable(boolean bonusAvailable) { this.bonusAvailable = bonusAvailable; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getJobSummary() { return jobSummary; }
    public void setJobSummary(String jobSummary) { this.jobSummary = jobSummary; }

    public String getResponsibilities() { return responsibilities; }
    public void setResponsibilities(String responsibilities) { this.responsibilities = responsibilities; }

    public String getDailyTasks() { return dailyTasks; }
    public void setDailyTasks(String dailyTasks) { this.dailyTasks = dailyTasks; }

    public String getRequiredSkills() { return requiredSkills; }
    public void setRequiredSkills(String requiredSkills) { this.requiredSkills = requiredSkills; }

    public String getPreferredSkills() { return preferredSkills; }
    public void setPreferredSkills(String preferredSkills) { this.preferredSkills = preferredSkills; }

    public String getExpectedSalary() { return expectedSalary; }
    public void setExpectedSalary(String expectedSalary) { this.expectedSalary = expectedSalary; }

    public String getSkillsRequired() { return skillsRequired; }
    public void setSkillsRequired(String skillsRequired) { this.skillsRequired = skillsRequired; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getMinEducation() { return minEducation; }
    public void setMinEducation(String minEducation) { this.minEducation = minEducation; }

    public String getRequiredDegree() { return requiredDegree; }
    public void setRequiredDegree(String requiredDegree) { this.requiredDegree = requiredDegree; }

    public String getExperienceRequired() { return experienceRequired; }
    public void setExperienceRequired(String experienceRequired) { this.experienceRequired = experienceRequired; }

    public String getAgeLimit() { return ageLimit; }
    public void setAgeLimit(String ageLimit) { this.ageLimit = ageLimit; }

    public String getGenderPreference() { return genderPreference; }
    public void setGenderPreference(String genderPreference) { this.genderPreference = genderPreference; }

    public String getLanguageRequirements() { return languageRequirements; }
    public void setLanguageRequirements(String languageRequirements) { this.languageRequirements = languageRequirements; }

    public String getCertificationsRequired() { return certificationsRequired; }
    public void setCertificationsRequired(String certificationsRequired) { this.certificationsRequired = certificationsRequired; }

    public boolean isVisaSponsorship() { return visaSponsorship; }
    public void setVisaSponsorship(boolean visaSponsorship) { this.visaSponsorship = visaSponsorship; }

    public String getVisaType() { return visaType; }
    public void setVisaType(String visaType) { this.visaType = visaType; }

    public boolean isWorkPermitAssistance() { return workPermitAssistance; }
    public void setWorkPermitAssistance(boolean workPermitAssistance) { this.workPermitAssistance = workPermitAssistance; }

    public boolean isRelocationAssistance() { return relocationAssistance; }
    public void setRelocationAssistance(boolean relocationAssistance) { this.relocationAssistance = relocationAssistance; }

    public boolean isAccommodationProvided() { return accommodationProvided; }
    public void setAccommodationProvided(boolean accommodationProvided) { this.accommodationProvided = accommodationProvided; }

    public boolean isAirTicketProvided() { return airTicketProvided; }
    public void setAirTicketProvided(boolean airTicketProvided) { this.airTicketProvided = airTicketProvided; }

    public boolean isMedicalInsurance() { return medicalInsurance; }
    public void setMedicalInsurance(boolean medicalInsurance) { this.medicalInsurance = medicalInsurance; }

    public String getDocumentsRequired() { return documentsRequired; }
    public void setDocumentsRequired(String documentsRequired) { this.documentsRequired = documentsRequired; }

    public String getApplicationDeadline() { return applicationDeadline; }
    public void setApplicationDeadline(String applicationDeadline) { this.applicationDeadline = applicationDeadline; }

    public String getInterviewProcess() { return interviewProcess; }
    public void setInterviewProcess(String interviewProcess) { this.interviewProcess = interviewProcess; }

    public String getExpectedJoiningDate() { return expectedJoiningDate; }
    public void setExpectedJoiningDate(String expectedJoiningDate) { this.expectedJoiningDate = expectedJoiningDate; }

    public String getRecruitmentFee() { return recruitmentFee; }
    public void setRecruitmentFee(String recruitmentFee) { this.recruitmentFee = recruitmentFee; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public boolean isFeatured() { return featured; }
    public void setFeatured(boolean featured) { this.featured = featured; }

    public LocalDateTime getPostedDate() { return postedDate; }
    public void setPostedDate(LocalDateTime postedDate) { this.postedDate = postedDate; }

    public Country getCountry() { return country; }
    public void setCountry(Country country) { this.country = country; }

    public Provider getProvider() { return provider; }
    public void setProvider(Provider provider) { this.provider = provider; }

    public boolean isApproved() { return isApproved; }
    public void setApproved(boolean isApproved) { this.isApproved = isApproved; }

    public boolean isHasVisaSponsorship() { return hasVisaSponsorship; }
    public void setHasVisaSponsorship(boolean hasVisaSponsorship) { this.hasVisaSponsorship = hasVisaSponsorship; }

    public String getVisaSponsorshipDetails() { return visaSponsorshipDetails; }
    public void setVisaSponsorshipDetails(String visaSponsorshipDetails) { this.visaSponsorshipDetails = visaSponsorshipDetails; }
}

