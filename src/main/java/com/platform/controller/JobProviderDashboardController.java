package com.platform.controller;

import com.platform.model.*;
import com.platform.repository.*;
import com.platform.service.CountryService;
import com.platform.service.JobService;
import com.platform.service.ProviderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/jobprovider")
public class JobProviderDashboardController {

    @Autowired
    private JobService jobService;

    @Autowired
    private CountryService countryService;

    @Autowired
    private ApplicationRepository applicationRepository;

    @Autowired
    private EnquiryRepository enquiryRepository;

    @Autowired
    private CountryRepository countryRepository;

    @Autowired
    private ProviderService providerService;

    private Provider getProvider(HttpSession session) {
        return (Provider) session.getAttribute("loggedInProvider");
    }

    private boolean isCompanyProvider(HttpSession session) {
        Provider p = getProvider(session);
        if (p == null) return false;
        String type = p.getType();
        return type != null && (
            type.equalsIgnoreCase("Company") ||
            type.equalsIgnoreCase("Job Provider") ||
            type.equalsIgnoreCase("Employer") ||
            type.equalsIgnoreCase("Recruitment Agency")
        );
    }

    // ── Dashboard Overview ────────────────────────────────────────────────────

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        if (!isCompanyProvider(session)) return "redirect:/login";
        Provider provider = getProvider(session);

        List<Job> myJobs = jobService.getJobsByProvider(provider.getId());
        long totalJobs = myJobs.size();
        long activeJobs = myJobs.stream().filter(j -> "PUBLISHED".equals(j.getStatus()) || j.isApproved()).count();
        long totalApplications = applicationRepository.countByJob_Provider_Id(provider.getId());
        List<Application> recentApplications = applicationRepository.findByJob_Provider_Id(provider.getId())
                .stream().limit(5).toList();

        model.addAttribute("provider", provider);
        model.addAttribute("totalJobs", totalJobs);
        model.addAttribute("activeJobs", activeJobs);
        model.addAttribute("totalApplications", totalApplications);
        model.addAttribute("recentApplications", recentApplications);
        model.addAttribute("myJobs", myJobs.stream().limit(5).toList());
        model.addAttribute("activeMenu", "dashboard");
        return "jobprovider/dashboard";
    }

    // ── Post New Job ──────────────────────────────────────────────────────────

    @GetMapping("/post-job")
    public String showPostJobForm(HttpSession session, Model model) {
        if (!isCompanyProvider(session)) return "redirect:/login";
        model.addAttribute("provider", getProvider(session));
        model.addAttribute("countries", countryRepository.findAll());
        model.addAttribute("activeMenu", "post-job");
        return "jobprovider/post-job";
    }

    @PostMapping("/post-job")
    public String postJob(@ModelAttribute Job job,
                          @RequestParam(value = "countryId", required = false) Long countryId,
                          HttpSession session,
                          RedirectAttributes redirectAttributes) {
        if (!isCompanyProvider(session)) return "redirect:/login";
        Provider provider = getProvider(session);

        if (countryId != null) {
            Country country = countryRepository.findById(countryId).orElse(null);
            job.setCountry(country);
        }
        job.setProvider(provider);
        job.setPostedDate(LocalDateTime.now());
        if (job.getStatus() == null || job.getStatus().isEmpty()) {
            job.setStatus("DRAFT");
        }
        jobService.saveJob(job);
        redirectAttributes.addFlashAttribute("successMsg", "Job posted successfully! It will be visible after admin approval.");
        return "redirect:/jobprovider/my-jobs";
    }

    // ── My Jobs ───────────────────────────────────────────────────────────────

    @GetMapping("/my-jobs")
    public String myJobs(HttpSession session, Model model) {
        if (!isCompanyProvider(session)) return "redirect:/login";
        Provider provider = getProvider(session);

        List<Job> jobs = jobService.getJobsByProvider(provider.getId());
        model.addAttribute("provider", provider);
        model.addAttribute("jobs", jobs);
        model.addAttribute("activeMenu", "my-jobs");
        return "jobprovider/my-jobs";
    }

    @GetMapping("/job/{id}")
    public String viewJob(@PathVariable Long id, HttpSession session, Model model) {
        if (!isCompanyProvider(session)) return "redirect:/login";
        Provider provider = getProvider(session);

        Job job = jobService.getJobById(id);
        if (job == null || !job.getProvider().getId().equals(provider.getId())) {
            return "redirect:/jobprovider/my-jobs";
        }

        List<Application> applications = applicationRepository.findByJobId(id);
        model.addAttribute("provider", provider);
        model.addAttribute("job", job);
        model.addAttribute("applications", applications);
        model.addAttribute("activeMenu", "my-jobs");
        return "jobprovider/job-detail";
    }

    @PostMapping("/delete-job")
    public String deleteJob(@RequestParam Long id, HttpSession session) {
        if (!isCompanyProvider(session)) return "redirect:/login";
        Provider provider = getProvider(session);
        Job job = jobService.getJobById(id);
        if (job != null && job.getProvider().getId().equals(provider.getId())) {
            jobService.deleteJob(id);
        }
        return "redirect:/jobprovider/my-jobs";
    }

    // ── Job Applications ──────────────────────────────────────────────────────

    @GetMapping("/applications")
    public String applications(HttpSession session, Model model) {
        if (!isCompanyProvider(session)) return "redirect:/login";
        Provider provider = getProvider(session);

        List<Application> applications = applicationRepository.findByJob_Provider_Id(provider.getId());
        model.addAttribute("provider", provider);
        model.addAttribute("applications", applications);
        model.addAttribute("activeMenu", "applications");
        return "jobprovider/applications";
    }

    @PostMapping("/update-application-status")
    public String updateApplicationStatus(@RequestParam Long id,
                                          @RequestParam String status,
                                          HttpSession session) {
        if (!isCompanyProvider(session)) return "redirect:/login";
        Application app = applicationRepository.findById(id).orElse(null);
        if (app != null) {
            app.setStatus(ApplicationStatus.valueOf(status));
            applicationRepository.save(app);
        }
        return "redirect:/jobprovider/applications";
    }

    // ── Profile Settings ──────────────────────────────────────────────────────

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        if (!isCompanyProvider(session)) return "redirect:/login";
        model.addAttribute("provider", getProvider(session));
        model.addAttribute("activeMenu", "profile");
        return "jobprovider/profile";
    }

    // ── Update Profile ────────────────────────────────────────────────────────

    @PostMapping("/update-profile")
    public String updateProfile(
            @RequestParam(required = false) String organizationName,
            @RequestParam(required = false) String contactName,
            @RequestParam(required = false) String designation,
            @RequestParam(required = false) String website,
            @RequestParam(required = false) String experience,
            @RequestParam(required = false) String whatsapp,
            @RequestParam(required = false) String mobile,
            @RequestParam(required = false) String country,
            @RequestParam(required = false) String state,
            @RequestParam(required = false) String city,
            @RequestParam(required = false) String address,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        if (!isCompanyProvider(session)) return "redirect:/login";
        Provider provider = getProvider(session);

        if (organizationName != null && !organizationName.isBlank()) provider.setOrganizationName(organizationName);
        if (contactName != null) provider.setContactName(contactName);
        if (designation != null) provider.setDesignation(designation);
        if (website != null) provider.setWebsite(website);
        if (experience != null && !experience.isBlank()) {
            try { provider.setExperience(Integer.parseInt(experience.trim())); } catch (NumberFormatException ignored) {}
        }
        if (whatsapp != null) provider.setWhatsapp(whatsapp);
        if (mobile != null) provider.setMobile(mobile);
        if (country != null) provider.setCountry(country);
        if (state != null) provider.setState(state);
        if (city != null) provider.setCity(city);
        if (address != null) provider.setAddress(address);

        Provider saved = providerService.saveProvider(provider);
        session.setAttribute("loggedInProvider", saved);
        redirectAttributes.addFlashAttribute("successMsg", "Profile updated successfully!");
        return "redirect:/jobprovider/profile";
    }

    // ── Change Password ───────────────────────────────────────────────────────

    @PostMapping("/change-password")
    public String changePassword(
            @RequestParam String newPassword,
            @RequestParam String confirmPassword,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        if (!isCompanyProvider(session)) return "redirect:/login";
        if (!newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("errorMsg", "Passwords do not match.");
            return "redirect:/jobprovider/profile";
        }
        if (newPassword.length() < 6) {
            redirectAttributes.addFlashAttribute("errorMsg", "Password must be at least 6 characters.");
            return "redirect:/jobprovider/profile";
        }
        Provider provider = getProvider(session);
        provider.setPassword(newPassword);
        Provider saved = providerService.saveProvider(provider);
        session.setAttribute("loggedInProvider", saved);
        redirectAttributes.addFlashAttribute("successMsg", "Password changed successfully!");
        return "redirect:/jobprovider/profile";
    }
}
