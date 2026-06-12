package com.platform.controller;

import com.platform.model.Country;
import com.platform.model.Enquiry;
import com.platform.model.User;
import jakarta.servlet.http.HttpSession;
import com.platform.service.CountryService;
import com.platform.service.EnquiryService;
import com.platform.service.JobService;
import com.platform.service.UniversityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {

    @Autowired
    private CountryService countryService;
    
    @Autowired
    private UniversityService universityService;
    
    @Autowired
    private JobService jobService;

    @Autowired
    private EnquiryService enquiryService;

    @Autowired
    private com.platform.service.CourseService courseService;

    @Autowired
    private com.platform.repository.SavedCourseRepository savedCourseRepository;

    @Autowired
    private com.platform.repository.SavedUniversityRepository savedUniversityRepository;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("countries", countryService.getAllCountries());
        return "user/home";
    }

    @GetMapping("/countries")
    public String countries(Model model) {
        model.addAttribute("countries", countryService.getAllCountries());
        return "user/countries";
    }

    @GetMapping("/universities")
    public String universities(@org.springframework.web.bind.annotation.RequestParam(value = "countryId", required = false) Long countryId, Model model, HttpSession session) {
        java.util.List<com.platform.model.University> list = universityService.getAllUniversities().stream()
                .filter(com.platform.model.University::isApproved)
                .toList();
        
        if (countryId != null) {
            list = list.stream().filter(u -> u.getCountry() != null && u.getCountry().getId().equals(countryId)).toList();
        }
        
        model.addAttribute("universities", list);
        model.addAttribute("countries", countryService.getAllCountries());
        
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            java.util.List<Long> savedUniIds = savedUniversityRepository.findByUserId(user.getId())
                    .stream().map(su -> su.getUniversity().getId()).toList();
            model.addAttribute("savedUniIds", savedUniIds);
        }
        
        return "user/universities";
    }

    @GetMapping("/jobs")
    public String jobs(Model model) {
        model.addAttribute("jobs", jobService.getAllJobs().stream().filter(j -> j.isApproved()).toList());
        model.addAttribute("countries", countryService.getAllCountries());
        return "user/jobs";
    }

    @GetMapping("/enquiry")
    public String enquiryPage(Model model) {
        model.addAttribute("enquiry", new Enquiry());
        model.addAttribute("universities", universityService.getAllUniversities().stream().filter(com.platform.model.University::isApproved).toList());
        return "user/enquiry";
    }

    @Autowired
    private com.platform.service.ScholarshipService scholarshipService;

    @Autowired
    private com.platform.service.VisaGuideService visaGuideService;

    @GetMapping("/scholarships")
    public String scholarships(@org.springframework.web.bind.annotation.RequestParam(value = "countryId", required = false) Long countryId, Model model) {
        if (countryId != null) {
            model.addAttribute("scholarships", scholarshipService.getScholarshipsByCountry(countryId));
        } else {
            model.addAttribute("scholarships", scholarshipService.getAllScholarships());
        }
        model.addAttribute("countries", countryService.getAllCountries());
        return "user/scholarships";
    }

    @GetMapping("/courses")
    public String courses(Model model, HttpSession session) {
        model.addAttribute("courses", courseService.getAllCourses());
        model.addAttribute("countries", countryService.getAllCountries());
        
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            java.util.List<Long> savedCourseIds = savedCourseRepository.findByUserId(user.getId())
                    .stream().map(sc -> sc.getCourse().getId()).toList();
            model.addAttribute("savedCourseIds", savedCourseIds);
        }
        return "user/courses";
    }

    @GetMapping("/visa-guide")
    public String visaGuideList(Model model) {
        model.addAttribute("countries", countryService.getAllCountries());
        model.addAttribute("visaGuides", visaGuideService.getAllVisaGuides());
        return "user/visa-guide";
    }

    @GetMapping("/visa-guide/{countryId}")
    public String visaGuideDetails(@org.springframework.web.bind.annotation.PathVariable("countryId") Long countryId, Model model) {
        Country country = countryService.getCountryById(countryId);
        com.platform.model.VisaGuide visaGuide = visaGuideService.getVisaGuideByCountry(countryId);
        
        if (country == null) {
            return "redirect:/visa-guide";
        }

        model.addAttribute("country", country);
        model.addAttribute("visaGuide", visaGuide);
        return "user/visa-details";
    }

    @PostMapping("/submit-enquiry")
    public String submitEnquiry(Enquiry enquiry) {
        if (enquiry.getUniversity() != null && enquiry.getUniversity().getId() == null) {
            enquiry.setUniversity(null);
        }
        enquiryService.saveEnquiry(enquiry);
        return "redirect:/?enquirySuccess=true";
    }

    @GetMapping("/contact")
    public String contactPage(Model model) {
        return "user/contact";
    }
}
