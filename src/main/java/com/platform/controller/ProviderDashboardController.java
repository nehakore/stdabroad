package com.platform.controller;

import com.platform.model.*;
import com.platform.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/provider")
public class ProviderDashboardController {

    @Autowired
    private UniversityRepository universityRepository;
    
    @Autowired
    private CountryRepository countryRepository;

    @Autowired
    private EnquiryRepository enquiryRepository;

    @Autowired
    private LeadRepository leadRepository;

    @Autowired
    private CounsellingSessionRepository counsellingSessionRepository;

    @Autowired
    private ApplicationRepository applicationRepository;

    // Helper to check provider session
    private Provider getLoggedInProvider(HttpSession session) {
        return (Provider) session.getAttribute("loggedInProvider");
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";

        List<University> universities = universityRepository.findByProviderId(provider.getId());
        List<Enquiry> enquiries = enquiryRepository.findByUniversity_Provider_Id(provider.getId());
        List<Lead> leads = leadRepository.findByUniversity_Provider_Id(provider.getId());
        List<Application> applications = applicationRepository.findByCourse_University_Provider_Id(provider.getId());

        model.addAttribute("provider", provider);
        model.addAttribute("universityCount", universities.size());
        model.addAttribute("enquiryCount", enquiries.size());
        model.addAttribute("leadCount", leads.size());
        model.addAttribute("applicationCount", applications.size());

        return "provider/dashboard";
    }

    @GetMapping("/universities/add")
    public String showAddUniversityForm(HttpSession session, Model model) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";
        
        model.addAttribute("provider", provider);
        model.addAttribute("countries", countryRepository.findAll());
        return "provider/add-university";
    }

    @PostMapping("/universities/add")
    public String addUniversity(@ModelAttribute University university, 
                                @RequestParam("countryId") Long countryId,
                                HttpSession session, 
                                RedirectAttributes redirectAttributes) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";

        Country country = countryRepository.findById(countryId).orElse(null);
        university.setCountry(country);
        university.setProvider(provider);
        university.setApproved(false); // Requires Admin approval
        
        universityRepository.save(university);
        
        redirectAttributes.addFlashAttribute("successMsg", "University added successfully! Waiting for admin approval.");
        return "redirect:/provider/universities";
    }

    @GetMapping("/universities")
    public String myUniversities(HttpSession session, Model model) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";

        List<University> universities = universityRepository.findByProviderId(provider.getId());
        model.addAttribute("provider", provider);
        model.addAttribute("universities", universities);
        return "provider/my-universities";
    }

    @GetMapping("/universities/view/{id}")
    public String viewUniversity(@PathVariable("id") Long id, HttpSession session, Model model) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";

        University university = universityRepository.findById(id).orElse(null);
        if (university == null || !university.getProvider().getId().equals(provider.getId())) {
            return "redirect:/provider/universities";
        }

        model.addAttribute("provider", provider);
        model.addAttribute("university", university);
        return "provider/view-university";
    }

    @GetMapping("/enquiries")
    public String myEnquiries(HttpSession session, Model model) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";

        List<Enquiry> enquiries = enquiryRepository.findByUniversity_Provider_Id(provider.getId());
        model.addAttribute("provider", provider);
        model.addAttribute("enquiries", enquiries);
        return "provider/enquiries";
    }

    @GetMapping("/leads")
    public String myLeads(HttpSession session, Model model) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";

        List<Lead> leads = leadRepository.findByUniversity_Provider_Id(provider.getId());
        model.addAttribute("provider", provider);
        model.addAttribute("leads", leads);
        return "provider/leads";
    }

    @GetMapping("/counselling")
    public String myCounselling(HttpSession session, Model model) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";

        List<CounsellingSession> sessions = counsellingSessionRepository.findByUniversity_Provider_Id(provider.getId());
        model.addAttribute("provider", provider);
        model.addAttribute("sessions", sessions);
        return "provider/counselling";
    }

    @GetMapping("/applications")
    public String myApplications(HttpSession session, Model model) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";

        List<Application> applications = applicationRepository.findByCourse_University_Provider_Id(provider.getId());
        model.addAttribute("provider", provider);
        model.addAttribute("applications", applications);
        return "provider/applications";
    }

    @Autowired
    private com.platform.service.ScholarshipService scholarshipService;

    @GetMapping("/scholarships")
    public String manageScholarships(HttpSession session, Model model) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";
        
        model.addAttribute("provider", provider);
        model.addAttribute("scholarships", scholarshipService.getScholarshipsByProvider(provider.getId()));
        model.addAttribute("universities", universityRepository.findByProviderId(provider.getId()));
        return "provider/manage-scholarships";
    }

    @PostMapping("/add-scholarship")
    public String addScholarship(com.platform.model.Scholarship scholarship, HttpSession session) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";
        
        scholarshipService.saveScholarship(scholarship);
        return "redirect:/provider/scholarships";
    }
    @GetMapping("/universities/edit/{id}")
    public String showEditUniversityForm(@PathVariable("id") Long id, HttpSession session, Model model) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";

        University university = universityRepository.findById(id).orElse(null);
        if (university == null || !university.getProvider().getId().equals(provider.getId())) {
            return "redirect:/provider/universities";
        }

        model.addAttribute("provider", provider);
        model.addAttribute("university", university);
        model.addAttribute("countries", countryRepository.findAll());
        return "provider/edit-university";
    }

    @PostMapping("/universities/edit/{id}")
    public String editUniversity(@PathVariable("id") Long id, 
                                 @ModelAttribute University university, 
                                 @RequestParam("countryId") Long countryId,
                                 HttpSession session, 
                                 RedirectAttributes redirectAttributes) {
        Provider provider = getLoggedInProvider(session);
        if (provider == null) return "redirect:/provider/login";

        University existingUniversity = universityRepository.findById(id).orElse(null);
        if (existingUniversity == null || !existingUniversity.getProvider().getId().equals(provider.getId())) {
            return "redirect:/provider/universities";
        }

        Country country = countryRepository.findById(countryId).orElse(null);
        
        // Update fields
        existingUniversity.setName(university.getName());
        existingUniversity.setType(university.getType());
        existingUniversity.setEstablishedYear(university.getEstablishedYear());
        existingUniversity.setAccreditation(university.getAccreditation());
        existingUniversity.setWebsite(university.getWebsite());
        existingUniversity.setDescription(university.getDescription());
        existingUniversity.setCountry(country);
        existingUniversity.setState(university.getState());
        existingUniversity.setCity(university.getCity());
        existingUniversity.setPostalCode(university.getPostalCode());
        existingUniversity.setAddress(university.getAddress());
        existingUniversity.setGoogleMapsLink(university.getGoogleMapsLink());
        existingUniversity.setAdmissionStartDate(university.getAdmissionStartDate());
        existingUniversity.setAdmissionEndDate(university.getAdmissionEndDate());
        existingUniversity.setApplicationFee(university.getApplicationFee());
        existingUniversity.setEntranceExams(university.getEntranceExams());
        existingUniversity.setRequiredDocuments(university.getRequiredDocuments());
        existingUniversity.setHasVisaAssistance(university.isHasVisaAssistance());
        existingUniversity.setVisaAssistanceDetails(university.getVisaAssistanceDetails());
        existingUniversity.setPlacementPercentage(university.getPlacementPercentage());
        existingUniversity.setHighestPackage(university.getHighestPackage());
        existingUniversity.setAveragePackage(university.getAveragePackage());
        existingUniversity.setTopRecruiters(university.getTopRecruiters());
        existingUniversity.setAdmissionContact(university.getAdmissionContact());
        existingUniversity.setEmail(university.getEmail());
        existingUniversity.setPhone(university.getPhone());
        existingUniversity.setWhatsapp(university.getWhatsapp());
        existingUniversity.setImageUrl(university.getImageUrl());
        existingUniversity.setBannerImage(university.getBannerImage());
        existingUniversity.setCampusVideoUrl(university.getCampusVideoUrl());
        existingUniversity.setBrochureUrl(university.getBrochureUrl());
        
        // Facilities
        existingUniversity.setHasHostel(university.isHasHostel());
        existingUniversity.setHasLibrary(university.isHasLibrary());
        existingUniversity.setHasSports(university.isHasSports());
        existingUniversity.setHasPlacementSupport(university.isHasPlacementSupport());
        existingUniversity.setHasTransport(university.isHasTransport());
        existingUniversity.setHasWifi(university.isHasWifi());
        existingUniversity.setHasLabs(university.isHasLabs());
        existingUniversity.setHasCafeteria(university.isHasCafeteria());
        
        // Mark as pending approval again
        existingUniversity.setApproved(false);

        universityRepository.save(existingUniversity);
        
        redirectAttributes.addFlashAttribute("successMsg", "University updated successfully! Waiting for admin approval.");
        return "redirect:/provider/universities";
    }
}
