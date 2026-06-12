package com.example.demo;

import com.platform.StudyAbroadApplication;
import com.platform.model.Role;
import com.platform.model.StudentProfile;
import com.platform.model.User;
import com.platform.service.DashboardService;
import com.platform.repository.UserRepository;
import com.platform.repository.StudentProfileRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest(classes = StudyAbroadApplication.class)
@Transactional
class DashboardServiceTests {

    @Autowired
    private DashboardService dashboardService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private StudentProfileRepository studentProfileRepository;

    @Test
    void debugDbState() {
        System.out.println("--- USERS IN DB ---");
        userRepository.findAll().forEach(u -> {
            System.out.println("User: ID=" + u.getId() + ", Name=" + u.getName() + ", Email=" + u.getEmail() + ", Phone=" + u.getPhone() + ", Country=" + u.getCountryInterest() + ", Course=" + u.getCourseInterest() + ", Budget=" + u.getBudget());
            studentProfileRepository.findByUserId(u.getId()).ifPresent(p -> {
                System.out.println("  Profile: ID=" + p.getId() + ", Qual=" + p.getQualification() + ", Field=" + p.getFieldOfStudy() + ", Year=" + p.getGradYear() + ", GPA=" + p.getGpa() + ", English=" + p.getEnglishScore() + ", Skills=" + p.getSkills());
            });
            int completion = dashboardService.calculateProfileCompletion(u, studentProfileRepository.findByUserId(u.getId()).orElse(null));
            System.out.println("  Calculated Completion: " + completion + "%");
        });
        System.out.println("--------------------");
    }

    @Test
    void testSaveProfileAndEducation() {
        User user = new User();
        user.setName("Test Student");
        user.setEmail("test_student@example.com");
        user.setRole(Role.STUDENT);
        user = userRepository.save(user);

        // Simulate updateProfile
        user.setPhone("1234567890");
        user.setCountryInterest("UK");
        user.setCourseInterest("MSc");
        user.setBudget("$15000");
        userRepository.save(user);

        // Simulate updateEducation
        StudentProfile profile = studentProfileRepository.findByUserId(user.getId())
                .orElse(new StudentProfile());
        profile.setUser(user);
        profile.setQualification("Bachelor's Degree");
        profile.setFieldOfStudy("Computer Science");
        profile.setGradYear("2023");
        profile.setGpa("3.5");
        profile.setEnglishScore("IELTS 7.5");
        profile.setSkills("Java");
        studentProfileRepository.save(profile);

        // Retrieve and check completion
        int completion = dashboardService.calculateProfileCompletion(user, profile);
        System.out.println("TEST COMPLETION RESULT: " + completion + "%");
        assertEquals(91, completion); // 11 fields out of 12 filled (all except resumeUrl)
    }

    @Test
    void testCalculateProfileCompletion() {
        User user = new User();
        user.setName("Yogitha");
        user.setEmail("yogitha@example.com");
        user.setRole(Role.STUDENT);
        
        StudentProfile profile = new StudentProfile();
        profile.setQualification("Bachelor's Degree");
        profile.setFieldOfStudy("Computer Science");

        // 2 fields in User (name, email) + 2 fields in Profile (qualification, fieldOfStudy) = 4 fields filled out of 12.
        // Percentage: (4 * 100) / 12 = 33%
        int completion = dashboardService.calculateProfileCompletion(user, profile);
        assertEquals(33, completion);

        // Add 2 more fields (phone, budget) = 6 fields filled
        user.setPhone("+919999999999");
        user.setBudget("$25,000");
        
        completion = dashboardService.calculateProfileCompletion(user, profile);
        assertEquals(50, completion);
    }
}
