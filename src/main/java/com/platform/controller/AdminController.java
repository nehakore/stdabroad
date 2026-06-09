package com.platform.controller;

import com.platform.model.Country;
import com.platform.model.Job;
import com.platform.model.University;
import com.platform.model.Enquiry;
import com.platform.service.CountryService;
import com.platform.service.EnquiryService;
import com.platform.service.JobService;
import com.platform.service.UniversityService;
import com.platform.service.ProviderService;
import com.platform.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ProviderService providerService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private CountryService countryService;
    
    @Autowired
    private EnquiryService enquiryService;
    
    @Autowired
    private JobService jobService;
    
    @Autowired
    private UniversityService universityService;

    @GetMapping("/dashboard")
    public String dashboard() {
        return "redirect:/admin/pending-providers";
    }

    @GetMapping("/pending-providers")
    public String pendingProviders(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        model.addAttribute("unapprovedProviders", providerService.getAllProviders().stream().filter(p -> !p.isApproved()).toList());
        model.addAttribute("activeMenu", "pending-providers");
        return "admin/pending-providers";
    }

    @GetMapping("/approved-providers")
    public String approvedProviders(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        model.addAttribute("approvedProviders", providerService.getAllProviders().stream().filter(p -> p.isApproved()).toList());
        model.addAttribute("activeMenu", "approved-providers");
        return "admin/approved-providers";
    }

    @GetMapping("/pending-jobs")
    public String pendingJobs(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        model.addAttribute("unapprovedJobs", jobService.getAllJobs().stream().filter(j -> !j.isApproved()).toList());
        model.addAttribute("activeMenu", "pending-jobs");
        return "admin/pending-jobs";
    }

    @GetMapping("/pending-universities")
    public String pendingUniversities(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        model.addAttribute("unapprovedUniversities", universityService.getAllUniversities().stream().filter(u -> !u.isApproved()).toList());
        model.addAttribute("activeMenu", "pending-universities");
        return "admin/pending-universities";
    }

    @GetMapping("/manage-jobs")
    public String manageJobs(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        model.addAttribute("approvedJobs", jobService.getAllJobs().stream().filter(j -> j.isApproved()).toList());
        model.addAttribute("activeMenu", "manage-jobs");
        return "admin/manage-jobs";
    }

    @GetMapping("/manage-universities")
    public String manageUniversities(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        model.addAttribute("approvedUniversities", universityService.getAllUniversities().stream().filter(u -> u.isApproved()).toList());
        model.addAttribute("activeMenu", "manage-universities");
        return "admin/manage-universities";
    }

    @GetMapping("/enquiries")
    public String userEnquiries(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        model.addAttribute("enquiries", enquiryService.getAllEnquiries());
        model.addAttribute("activeMenu", "enquiries");
        return "admin/enquiries";
    }

    @PostMapping("/approve-provider")
    public String approveProvider(@RequestParam Long id, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        providerService.approveProvider(id);
        return "redirect:/admin/pending-providers";
    }

    @PostMapping("/reject-provider")
    public String rejectProvider(@RequestParam Long id, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        providerService.deleteProvider(id);
        return "redirect:/admin/pending-providers";
    }

    @PostMapping("/approve-job")
    public String approveJob(@RequestParam Long id, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        Job job = jobService.getJobById(id);
        if (job != null) {
            job.setApproved(true);
            jobService.saveJob(job);
        }
        return "redirect:/admin/pending-jobs";
    }

    @PostMapping("/approve-university")
    public String approveUniversity(@RequestParam Long id, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        University university = universityService.getUniversityById(id);
        if (university != null) {
            university.setApproved(true);
            universityService.saveUniversity(university);
        }
        return "redirect:/admin/pending-universities";
    }

    @PostMapping("/update-enquiry-status")
    public String updateEnquiryStatus(@RequestParam Long id, @RequestParam String status, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        Enquiry enquiry = enquiryService.getEnquiryById(id);
        if (enquiry != null) {
            enquiry.setStatus(status);
            enquiryService.saveEnquiry(enquiry);
        }
        return "redirect:/admin/enquiries";
    }

    @GetMapping("/manage-users")
    public String manageUsers(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        model.addAttribute("users", userService.getAllUsers());
        model.addAttribute("activeMenu", "manage-users");
        return "admin/manage-users";
    }

    @GetMapping("/manage-countries")
    public String manageCountries(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        model.addAttribute("countries", countryService.getAllCountries());
        model.addAttribute("activeMenu", "manage-countries");
        return "admin/manage-countries";
    }

    @PostMapping("/add-country")
    public String addCountry(Country country, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        countryService.saveCountry(country);
        return "redirect:/admin/manage-countries";
    }

    @PostMapping("/delete-country")
    public String deleteCountry(@RequestParam Long id, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/login";
        countryService.deleteCountry(id);
        return "redirect:/admin/manage-countries";
    }
    @Autowired
    private com.platform.service.ScholarshipService scholarshipService;

    @Autowired
    private com.platform.service.VisaGuideService visaGuideService;

    @GetMapping("/manage-scholarships")
    public String manageScholarships(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/admin/login";
        model.addAttribute("scholarships", scholarshipService.getAllScholarships());
        model.addAttribute("countries", countryService.getAllCountries());
        model.addAttribute("activeMenu", "manage-scholarships");
        return "admin/manage-scholarships";
    }



    @GetMapping("/manage-visa-guides")
    public String manageVisaGuides(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/admin/login";
        model.addAttribute("visaGuides", visaGuideService.getAllVisaGuides());
        model.addAttribute("countries", countryService.getAllCountries());
        model.addAttribute("activeMenu", "manage-visa-guides");
        return "admin/manage-visa-guides";
    }

    @PostMapping("/add-visa-guide")
    public String addVisaGuide(com.platform.model.VisaGuide visaGuide, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) return "redirect:/admin/login";
        visaGuideService.saveVisaGuide(visaGuide);
        return "redirect:/admin/manage-visa-guides";
    }
}
