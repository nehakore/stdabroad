package com.platform.controller;

import com.platform.model.User;
import com.platform.service.ApplicationService;
import com.platform.repository.JobRepository;
import com.platform.repository.CountryRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jobseeker")
public class JobSeekerController {

    @Autowired
    private ApplicationService applicationService;

    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private CountryRepository countryRepository;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !com.platform.model.Role.JOB_SEEKER.equals(user.getRole())) {
            return "redirect:/login";
        }
        
        model.addAttribute("applications", applicationService.getApplicationsByUser(user.getId()));
        model.addAttribute("jobs", jobRepository.findAll());
        model.addAttribute("countries", countryRepository.findAll());
        
        return "jobseeker/dashboard";
    }
}
