package com.platform.controller;

import com.platform.model.User;
import com.platform.model.Notification;
import com.platform.service.ApplicationService;
import com.platform.repository.JobRepository;
import com.platform.repository.CountryRepository;
import com.platform.repository.NotificationRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/jobseeker")
public class JobSeekerController {

    @Autowired
    private ApplicationService applicationService;

    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private CountryRepository countryRepository;

    @Autowired
    private NotificationRepository notificationRepository;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !com.platform.model.Role.JOB_SEEKER.equals(user.getRole())) {
            return "redirect:/login";
        }
        
        model.addAttribute("applications", applicationService.getApplicationsByUser(user.getId()));
        model.addAttribute("jobs", jobRepository.findAll());
        model.addAttribute("countries", countryRepository.findAll());

        // Load and Seed Notifications for Job Seeker
        try {
            List<Notification> notifications = notificationRepository.findByUserIdOrderByCreatedAtDesc(user.getId());
            if (notifications.isEmpty()) {
                Notification welcome = new Notification();
                welcome.setUser(user);
                welcome.setTitle("Welcome to STD Abroad!");
                welcome.setMessage("Your job seeker account is active. Complete your profile to get discovered by international employers!");
                welcome.setType("SYSTEM");
                welcome.setRead(false);
                welcome.setCreatedAt(LocalDateTime.now().minusDays(1));
                notificationRepository.save(welcome);

                Notification matches = new Notification();
                matches.setUser(user);
                matches.setTitle("New Job Matches Found");
                matches.setMessage("We found new visa-sponsored jobs matching your profile in Germany.");
                matches.setType("APPLICATION");
                matches.setRead(false);
                matches.setCreatedAt(LocalDateTime.now().minusHours(2));
                notificationRepository.save(matches);

                notifications = notificationRepository.findByUserIdOrderByCreatedAtDesc(user.getId());
            }
            model.addAttribute("notifications", notifications);
            model.addAttribute("unreadNotificationsCount", notificationRepository.countByUserIdAndIsReadFalse(user.getId()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return "jobseeker/dashboard";
    }

    @PostMapping("/notifications/mark-read")
    @ResponseBody
    public String markNotificationsAsRead(HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            try {
                List<Notification> notifications = notificationRepository.findByUserIdOrderByCreatedAtDesc(user.getId());
                for (Notification n : notifications) {
                    if (!n.isRead()) {
                        n.setRead(true);
                        notificationRepository.save(n);
                    }
                }
                return "SUCCESS";
            } catch (Exception e) {
                e.printStackTrace();
                return "ERROR";
            }
        }
        return "UNAUTHORIZED";
    }
}
