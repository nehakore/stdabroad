package com.platform.controller;

import com.platform.model.Job;
import com.platform.model.Provider;
import com.platform.model.University;
import com.platform.service.CountryService;
import com.platform.service.JobService;
import com.platform.service.UniversityService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/provider")
public class ProviderController {

    @Autowired
    private UniversityService universityService;

    @Autowired
    private JobService jobService;
    
    @Autowired
    private CountryService countryService;


    @GetMapping("/add-job")
    public String addJobPage(Model model, HttpSession session) {
        if (session.getAttribute("loggedInProvider") == null) return "redirect:/login";
        model.addAttribute("countries", countryService.getAllCountries());
        model.addAttribute("job", new Job());
        return "provider/add-job";
    }

    @PostMapping("/add-job")
    public String addJob(Job job, HttpSession session) {
        Provider provider = (Provider) session.getAttribute("loggedInProvider");
        if (provider == null) return "redirect:/login";
        job.setProvider(provider);
        jobService.saveJob(job);
        return "redirect:/provider/dashboard";
    }

}
