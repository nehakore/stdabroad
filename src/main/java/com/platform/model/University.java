package com.platform.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "universities")
public class University {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    @Column(columnDefinition = "TEXT")
    private String description;
    
    // Info
    private String bannerImage;
    private String imageUrl; // Logo
    private String type; // Public, Private, Deemed, Autonomous
    private Integer establishedYear;
    private String accreditation; // NAAC, NBA, etc.
    private String website;

    // Location
    private String state;
    private String city;
    @Column(columnDefinition = "TEXT")
    private String address;
    private String postalCode;
    @Column(columnDefinition = "TEXT")
    private String googleMapsLink;

    // Contact
    private String admissionContact;
    private String phone;
    private String whatsapp;
    private String email;

    // Admissions
    private String admissionStartDate;
    private String admissionEndDate;
    @Column(columnDefinition = "TEXT")
    private String requiredDocuments;
    private String entranceExams;
    private Double applicationFee;

    // Facilities (Booleans)
    private boolean hasHostel;
    private boolean hasLibrary;
    private boolean hasSports;
    private boolean hasPlacementSupport;
    private boolean hasTransport;
    private boolean hasWifi;
    private boolean hasLabs;
    private boolean hasCafeteria;

    // Media
    @Column(columnDefinition = "TEXT")
    private String imagesGallery; // comma-separated URLs or JSON array
    private String campusVideoUrl;
    private String brochureUrl;

    // Placements
    private String placementPercentage;
    private String highestPackage;
    private String averagePackage;
    @Column(columnDefinition = "TEXT")
    private String topRecruiters;

    // Visibility
    private String status = "DRAFT"; // PUBLISHED / DRAFT
    private boolean isFeatured = false;

    private Double fees;
    private Integer ranking;

    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country;
    
    @ManyToOne
    @JoinColumn(name = "provider_id")
    private Provider provider;

    @OneToMany(mappedBy = "university", cascade = CascadeType.ALL)
    private List<Course> courses;

    private boolean isApproved = false;

    private boolean hasVisaAssistance;
    @Column(columnDefinition = "TEXT")
    private String visaAssistanceDetails;

    // Standard Getters and Setters for ALL fields...
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getBannerImage() { return bannerImage; }
    public void setBannerImage(String bannerImage) { this.bannerImage = bannerImage; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public Integer getEstablishedYear() { return establishedYear; }
    public void setEstablishedYear(Integer establishedYear) { this.establishedYear = establishedYear; }
    public String getAccreditation() { return accreditation; }
    public void setAccreditation(String accreditation) { this.accreditation = accreditation; }
    public String getWebsite() { return website; }
    public void setWebsite(String website) { this.website = website; }
    public String getState() { return state; }
    public void setState(String state) { this.state = state; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getPostalCode() { return postalCode; }
    public void setPostalCode(String postalCode) { this.postalCode = postalCode; }
    public String getGoogleMapsLink() { return googleMapsLink; }
    public void setGoogleMapsLink(String googleMapsLink) { this.googleMapsLink = googleMapsLink; }
    public String getAdmissionContact() { return admissionContact; }
    public void setAdmissionContact(String admissionContact) { this.admissionContact = admissionContact; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getWhatsapp() { return whatsapp; }
    public void setWhatsapp(String whatsapp) { this.whatsapp = whatsapp; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getAdmissionStartDate() { return admissionStartDate; }
    public void setAdmissionStartDate(String admissionStartDate) { this.admissionStartDate = admissionStartDate; }
    public String getAdmissionEndDate() { return admissionEndDate; }
    public void setAdmissionEndDate(String admissionEndDate) { this.admissionEndDate = admissionEndDate; }
    public String getRequiredDocuments() { return requiredDocuments; }
    public void setRequiredDocuments(String requiredDocuments) { this.requiredDocuments = requiredDocuments; }
    public String getEntranceExams() { return entranceExams; }
    public void setEntranceExams(String entranceExams) { this.entranceExams = entranceExams; }
    public Double getApplicationFee() { return applicationFee; }
    public void setApplicationFee(Double applicationFee) { this.applicationFee = applicationFee; }
    public boolean isHasHostel() { return hasHostel; }
    public void setHasHostel(boolean hasHostel) { this.hasHostel = hasHostel; }
    public boolean isHasLibrary() { return hasLibrary; }
    public void setHasLibrary(boolean hasLibrary) { this.hasLibrary = hasLibrary; }
    public boolean isHasSports() { return hasSports; }
    public void setHasSports(boolean hasSports) { this.hasSports = hasSports; }
    public boolean isHasPlacementSupport() { return hasPlacementSupport; }
    public void setHasPlacementSupport(boolean hasPlacementSupport) { this.hasPlacementSupport = hasPlacementSupport; }
    public boolean isHasTransport() { return hasTransport; }
    public void setHasTransport(boolean hasTransport) { this.hasTransport = hasTransport; }
    public boolean isHasWifi() { return hasWifi; }
    public void setHasWifi(boolean hasWifi) { this.hasWifi = hasWifi; }
    public boolean isHasLabs() { return hasLabs; }
    public void setHasLabs(boolean hasLabs) { this.hasLabs = hasLabs; }
    public boolean isHasCafeteria() { return hasCafeteria; }
    public void setHasCafeteria(boolean hasCafeteria) { this.hasCafeteria = hasCafeteria; }
    public String getImagesGallery() { return imagesGallery; }
    public void setImagesGallery(String imagesGallery) { this.imagesGallery = imagesGallery; }
    public String getCampusVideoUrl() { return campusVideoUrl; }
    public void setCampusVideoUrl(String campusVideoUrl) { this.campusVideoUrl = campusVideoUrl; }
    public String getBrochureUrl() { return brochureUrl; }
    public void setBrochureUrl(String brochureUrl) { this.brochureUrl = brochureUrl; }
    public String getPlacementPercentage() { return placementPercentage; }
    public void setPlacementPercentage(String placementPercentage) { this.placementPercentage = placementPercentage; }
    public String getHighestPackage() { return highestPackage; }
    public void setHighestPackage(String highestPackage) { this.highestPackage = highestPackage; }
    public String getAveragePackage() { return averagePackage; }
    public void setAveragePackage(String averagePackage) { this.averagePackage = averagePackage; }
    public String getTopRecruiters() { return topRecruiters; }
    public void setTopRecruiters(String topRecruiters) { this.topRecruiters = topRecruiters; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public boolean isFeatured() { return isFeatured; }
    public void setFeatured(boolean featured) { this.isFeatured = featured; }
    public Double getFees() { return fees; }
    public void setFees(Double fees) { this.fees = fees; }
    public Integer getRanking() { return ranking; }
    public void setRanking(Integer ranking) { this.ranking = ranking; }
    public Country getCountry() { return country; }
    public void setCountry(Country country) { this.country = country; }
    public Provider getProvider() { return provider; }
    public void setProvider(Provider provider) { this.provider = provider; }
    public List<Course> getCourses() { return courses; }
    public void setCourses(List<Course> courses) { this.courses = courses; }
    public boolean isApproved() { return isApproved; }
    public void setApproved(boolean isApproved) { this.isApproved = isApproved; }
    public boolean isHasVisaAssistance() { return hasVisaAssistance; }
    public void setHasVisaAssistance(boolean hasVisaAssistance) { this.hasVisaAssistance = hasVisaAssistance; }
    public String getVisaAssistanceDetails() { return visaAssistanceDetails; }
    public void setVisaAssistanceDetails(String visaAssistanceDetails) { this.visaAssistanceDetails = visaAssistanceDetails; }
}
