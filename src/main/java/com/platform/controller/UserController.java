package com.platform.controller;

import com.platform.model.User;
import com.platform.model.Enquiry;
import com.platform.model.Notification;
import java.time.LocalDateTime;
import com.platform.service.ApplicationService;
import com.platform.service.UserService;
import com.platform.service.DashboardService;
import com.platform.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private ApplicationService applicationService;

    @Autowired
    private UserService userService;

    @Autowired
    private DashboardService dashboardService;

    @Autowired
    private ScholarshipRepository scholarshipRepository;

    @Autowired
    private CountryRepository countryRepository;

    @Autowired
    private UniversityRepository universityRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private StudentProfileRepository studentProfileRepository;

    @Autowired
    private SavedUniversityRepository savedUniversityRepository;

    @Autowired
    private SavedCourseRepository savedCourseRepository;

    @Autowired
    private EnquiryRepository enquiryRepository;

    @Autowired
    private NotificationRepository notificationRepository;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }

        // Retrieve fresh user object from DB to ensure it's up to date
        user = userService.getUserById(user.getId()).orElse(user);
        session.setAttribute("loggedInUser", user);

        // Sort applications by applied date descending
        List<com.platform.model.Application> userApps = applicationService.getApplicationsByUser(user.getId());
        userApps.sort((a, b) -> b.getAppliedAt().compareTo(a.getAppliedAt()));
        model.addAttribute("applications", userApps);
        
        model.addAttribute("universities", universityRepository.findAll());
        model.addAttribute("scholarships", scholarshipRepository.findAll());
        model.addAttribute("countries", countryRepository.findAll());
        model.addAttribute("courses", courseRepository.findAll());

        // Get saved universities and courses
        List<com.platform.model.SavedUniversity> savedUnis = savedUniversityRepository.findByUserId(user.getId());
        List<com.platform.model.SavedCourse> savedCourses = savedCourseRepository.findByUserId(user.getId());

        model.addAttribute("savedUniversitiesCount", savedUnis.size());
        model.addAttribute("savedCoursesCount", savedCourses.size());
        model.addAttribute("savedUniversities", savedUnis);
        model.addAttribute("savedCourses", savedCourses);

        // Fetch student profile details
        com.platform.model.StudentProfile profile = studentProfileRepository.findByUserId(user.getId()).orElse(null);
        model.addAttribute("studentProfile", profile);

        // Fetch student's enquiries
        List<Enquiry> userEnquiries = enquiryRepository.findByEmail(user.getEmail());
        userEnquiries.sort((a, b) -> {
            if (a.getCreatedAt() == null && b.getCreatedAt() == null) return 0;
            if (a.getCreatedAt() == null) return 1;
            if (b.getCreatedAt() == null) return -1;
            return b.getCreatedAt().compareTo(a.getCreatedAt());
        });
        model.addAttribute("enquiries", userEnquiries);

        // Profile Completion
        int profileCompletion = dashboardService.calculateProfileCompletion(user, profile);
        model.addAttribute("profileCompletion", profileCompletion);

        // Load and Seed Notifications
        try {
            List<Notification> notifications = notificationRepository.findByUserIdOrderByCreatedAtDesc(user.getId());
            if (notifications.isEmpty()) {
                Notification welcome = new Notification();
                welcome.setUser(user);
                welcome.setTitle("Welcome to STD Abroad!");
                welcome.setMessage("Your account has been created successfully. Start exploring top universities and courses!");
                welcome.setType("SYSTEM");
                welcome.setRead(false);
                welcome.setCreatedAt(LocalDateTime.now().minusDays(1));
                notificationRepository.save(welcome);

                Notification profileHint = new Notification();
                profileHint.setUser(user);
                profileHint.setTitle("Profile Update Reminder");
                profileHint.setMessage("Complete your educational details and upload your resume to get 2x faster responses.");
                profileHint.setType("SYSTEM");
                profileHint.setRead(false);
                profileHint.setCreatedAt(LocalDateTime.now().minusHours(2));
                notificationRepository.save(profileHint);

                Notification scholMatch = new Notification();
                scholMatch.setUser(user);
                scholMatch.setTitle("New Scholarship Available");
                scholMatch.setMessage("A new scholarship matching your profile is now available. Apply today!");
                scholMatch.setType("SCHOLARSHIP");
                scholMatch.setRead(false);
                scholMatch.setCreatedAt(LocalDateTime.now().minusMinutes(30));
                notificationRepository.save(scholMatch);

                notifications = notificationRepository.findByUserIdOrderByCreatedAtDesc(user.getId());
            }
            model.addAttribute("notifications", notifications);
            model.addAttribute("unreadNotificationsCount", notificationRepository.countByUserIdAndIsReadFalse(user.getId()));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "user/dashboard";
    }

    @PostMapping("/update-profile")
    public String updateProfile(@RequestParam("name") String name,
                                @RequestParam(value = "phone", required = false) String phone,
                                @RequestParam(value = "countryInterest", required = false) String countryInterest,
                                @RequestParam(value = "courseInterest", required = false) String courseInterest,
                                @RequestParam(value = "budget", required = false) String budget,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        User dbUser = userService.getUserById(user.getId()).orElse(null);
        if (dbUser != null) {
            dbUser.setName(name);
            dbUser.setPhone(phone);
            dbUser.setCountryInterest(countryInterest);
            dbUser.setCourseInterest(courseInterest);
            dbUser.setBudget(budget);
            userService.saveUser(dbUser);
            session.setAttribute("loggedInUser", dbUser);
            redirectAttributes.addFlashAttribute("successMsg", "Profile details saved successfully!");
        }
        return "redirect:/user/dashboard?panel=my-profile";
    }

    @PostMapping("/update-education")
    public String updateEducation(@RequestParam(value = "qualification", required = false) String qualification,
                                  @RequestParam(value = "fieldOfStudy", required = false) String fieldOfStudy,
                                  @RequestParam(value = "gradYear", required = false) String gradYear,
                                  @RequestParam(value = "gpa", required = false) String gpa,
                                  @RequestParam(value = "englishScore", required = false) String englishScore,
                                  @RequestParam(value = "skills", required = false) String skills,
                                  HttpSession session,
                                  RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        User dbUser = userService.getUserById(user.getId()).orElse(null);
        if (dbUser != null) {
            dbUser.setSkills(skills);
            userService.saveUser(dbUser);
            session.setAttribute("loggedInUser", dbUser);

            com.platform.model.StudentProfile profile = studentProfileRepository.findByUserId(dbUser.getId())
                    .orElse(new com.platform.model.StudentProfile());
            profile.setUser(dbUser);
            profile.setQualification(qualification);
            profile.setFieldOfStudy(fieldOfStudy);
            profile.setGradYear(gradYear);
            profile.setGpa(gpa);
            profile.setEnglishScore(englishScore);
            profile.setSkills(skills);
            studentProfileRepository.save(profile);
            redirectAttributes.addFlashAttribute("successMsg", "Education details saved successfully!");
        }
        return "redirect:/user/dashboard?panel=education";
    }

    @PostMapping("/upload-resume")
    public String uploadResume(@RequestParam("resume") MultipartFile file,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMsg", "Please select a file to upload.");
            return "redirect:/user/dashboard?panel=documents";
        }

        try {
            String uploadDir = session.getServletContext().getRealPath("/") + "uploads" + File.separator + "resumes" + File.separator;
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            file.transferTo(new File(uploadDir + fileName));

            User dbUser = userService.getUserById(user.getId()).orElse(null);
            if (dbUser != null) {
                dbUser.setResumeUrl("/uploads/resumes/" + fileName);
                userService.saveUser(dbUser);
                session.setAttribute("loggedInUser", dbUser);
                redirectAttributes.addFlashAttribute("successMsg", "Resume uploaded successfully!");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMsg", "Failed to upload resume: " + e.getMessage());
        }

        return "redirect:/user/dashboard?panel=documents";
    }

    @GetMapping("/save-university")
    public String saveUniversity(@RequestParam("id") Long universityId,
                                 @RequestParam(value = "redirect", required = false) String redirect,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        User dbUser = userService.getUserById(user.getId()).orElse(null);
        com.platform.model.University university = universityRepository.findById(universityId).orElse(null);

        if (dbUser != null && university != null) {
            Optional<com.platform.model.SavedUniversity> existing = 
                    savedUniversityRepository.findByUserIdAndUniversityId(dbUser.getId(), universityId);
            if (existing.isEmpty()) {
                com.platform.model.SavedUniversity saved = new com.platform.model.SavedUniversity();
                saved.setUser(dbUser);
                saved.setUniversity(university);
                savedUniversityRepository.save(saved);
                redirectAttributes.addFlashAttribute("successMsg", university.getName() + " saved successfully!");
            }
        }
        if ("universities".equals(redirect)) {
            return "redirect:/universities";
        }
        return "redirect:/user/dashboard?panel=saved-universities";
    }

    @GetMapping("/unsave-university")
    public String unsaveUniversity(@RequestParam("id") Long universityId,
                                   @RequestParam(value = "redirect", required = false) String redirect,
                                   HttpSession session,
                                   RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        Optional<com.platform.model.SavedUniversity> saved = 
                savedUniversityRepository.findByUserIdAndUniversityId(user.getId(), universityId);
        if (saved.isPresent()) {
            savedUniversityRepository.delete(saved.get());
            redirectAttributes.addFlashAttribute("successMsg", "University removed from saved list.");
        }
        if ("universities".equals(redirect)) {
            return "redirect:/universities";
        }
        return "redirect:/user/dashboard?panel=saved-universities";
    }

    @GetMapping("/save-course")
    public String saveCourse(@RequestParam("id") Long courseId,
                             @RequestParam(value = "redirect", required = false) String redirect,
                             HttpSession session,
                             RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        User dbUser = userService.getUserById(user.getId()).orElse(null);
        com.platform.model.Course course = courseRepository.findById(courseId).orElse(null);

        if (dbUser != null && course != null) {
            Optional<com.platform.model.SavedCourse> existing = 
                    savedCourseRepository.findByUserIdAndCourseId(dbUser.getId(), courseId);
            if (existing.isEmpty()) {
                com.platform.model.SavedCourse saved = new com.platform.model.SavedCourse();
                saved.setUser(dbUser);
                saved.setCourse(course);
                savedCourseRepository.save(saved);
                redirectAttributes.addFlashAttribute("successMsg", course.getName() + " saved successfully!");
            }
        }
        if ("courses".equals(redirect)) {
            return "redirect:/courses";
        }
        return "redirect:/user/dashboard?panel=saved-courses";
    }

    @GetMapping("/unsave-course")
    public String unsaveCourse(@RequestParam("id") Long courseId,
                               @RequestParam(value = "redirect", required = false) String redirect,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        Optional<com.platform.model.SavedCourse> saved = 
                savedCourseRepository.findByUserIdAndCourseId(user.getId(), courseId);
        if (saved.isPresent()) {
            savedCourseRepository.delete(saved.get());
            redirectAttributes.addFlashAttribute("successMsg", "Course removed from saved list.");
        }
        if ("courses".equals(redirect)) {
            return "redirect:/courses";
        }
        return "redirect:/user/dashboard?panel=saved-courses";
    }

    @GetMapping("/enquire-uni")
    public String showEnquireForm(@RequestParam("id") Long universityId, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        com.platform.model.University university = universityRepository.findById(universityId).orElse(null);
        if (university == null) return "redirect:/";

        model.addAttribute("university", university);
        model.addAttribute("user", user);
        return "user/enquire-uni";
    }

    @PostMapping("/enquire-uni")
    public String submitEnquiry(@RequestParam("universityId") Long universityId,
                                @RequestParam("message") String message,
                                @RequestParam("phone") String phone,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
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

    @PostMapping("/change-password")
    public String changePassword(@RequestParam("currentPassword") String currentPassword,
                                 @RequestParam("newPassword") String newPassword,
                                 @RequestParam("confirmPassword") String confirmPassword,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        User dbUser = userService.getUserById(user.getId()).orElse(null);
        if (dbUser != null) {
            if (!dbUser.getPassword().equals(currentPassword)) {
                redirectAttributes.addFlashAttribute("errorMsg", "Current password is incorrect.");
                return "redirect:/user/dashboard?panel=account-settings";
            }
            if (!newPassword.equals(confirmPassword)) {
                redirectAttributes.addFlashAttribute("errorMsg", "New passwords do not match.");
                return "redirect:/user/dashboard?panel=account-settings";
            }
            if (newPassword.trim().isEmpty() || newPassword.length() < 6) {
                redirectAttributes.addFlashAttribute("errorMsg", "Password must be at least 6 characters.");
                return "redirect:/user/dashboard?panel=account-settings";
            }
            dbUser.setPassword(newPassword);
            userService.saveUser(dbUser);
            session.setAttribute("loggedInUser", dbUser);
            redirectAttributes.addFlashAttribute("successMsg", "Password updated successfully!");
        }
        return "redirect:/user/dashboard?panel=account-settings";
    }

    @PostMapping("/delete-account")
    public String deleteAccount(HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) return "redirect:/login";

        userService.deleteUser(user.getId());
        session.invalidate();
        redirectAttributes.addFlashAttribute("successMsg", "Your account has been deleted successfully.");
        return "redirect:/login";
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
