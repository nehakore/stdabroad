package com.platform.controller;

import com.platform.model.User;
import com.platform.service.ApplicationService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private ApplicationService applicationService;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("applications", applicationService.getApplicationsByUser(user.getId()));
        return "user/dashboard";
    }

    @Autowired
    private com.platform.repository.UniversityRepository universityRepository;

    @Autowired
    private com.platform.repository.EnquiryRepository enquiryRepository;

    @GetMapping("/enquire-uni")
    public String showEnquireForm(@org.springframework.web.bind.annotation.RequestParam("id") Long universityId, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        com.platform.model.University university = universityRepository.findById(universityId).orElse(null);
        if (university == null) return "redirect:/";

        model.addAttribute("university", university);
        model.addAttribute("user", user); // pre-fill user info
        return "user/enquire-uni";
    }

    @org.springframework.web.bind.annotation.PostMapping("/enquire-uni")
    public String submitEnquiry(@org.springframework.web.bind.annotation.RequestParam("universityId") Long universityId,
                                @org.springframework.web.bind.annotation.RequestParam("message") String message,
                                @org.springframework.web.bind.annotation.RequestParam("phone") String phone,
                                HttpSession session,
                                org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        com.platform.model.University university = universityRepository.findById(universityId).orElse(null);
        if (university != null) {
            com.platform.model.Enquiry enquiry = new com.platform.model.Enquiry();
            enquiry.setName(user.getName());
            enquiry.setEmail(user.getEmail());
            enquiry.setPhone(phone);
            enquiry.setMessage(message);
            enquiry.setUniversity(university);
            enquiry.setStatus("PENDING");
            enquiryRepository.save(enquiry);
            
            redirectAttributes.addFlashAttribute("successMsg", "Enquiry sent successfully to " + university.getName() + "!");
        }

        return "redirect:/user/dashboard";
    }
}
