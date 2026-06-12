package com.platform.service;

import com.platform.dto.ApplicationStatsResponse;
import com.platform.dto.DashboardResponse;
import com.platform.model.Application;
import com.platform.model.StudentProfile;
import com.platform.model.User;
import com.platform.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DashboardService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private StudentProfileRepository studentProfileRepository;

    @Autowired
    private SavedUniversityRepository savedUniversityRepository;

    @Autowired
    private SavedCourseRepository savedCourseRepository;

    @Autowired
    private ApplicationRepository applicationRepository;

    @Autowired
    private ScholarshipRepository scholarshipRepository;

    public int calculateProfileCompletion(User user, StudentProfile profile) {
        if (user == null) return 0;
        
        int totalFields = 12;
        int completedFields = 0;

        if (isNotEmpty(user.getName())) completedFields++;
        if (isNotEmpty(user.getEmail())) completedFields++;
        if (isNotEmpty(user.getPhone())) completedFields++;
        if (isNotEmpty(user.getCountryInterest())) completedFields++;
        if (isNotEmpty(user.getCourseInterest())) completedFields++;
        if (isNotEmpty(user.getBudget())) completedFields++;
        if (isNotEmpty(user.getResumeUrl())) completedFields++;

        if (profile != null) {
            if (isNotEmpty(profile.getQualification())) completedFields++;
            if (isNotEmpty(profile.getFieldOfStudy())) completedFields++;
            if (isNotEmpty(profile.getGradYear())) completedFields++;
            if (isNotEmpty(profile.getGpa())) completedFields++;
            if (isNotEmpty(profile.getEnglishScore())) completedFields++;
        }

        return (completedFields * 100) / totalFields;
    }

    public DashboardResponse getDashboardStats(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + userId));
        
        StudentProfile profile = studentProfileRepository.findByUserId(userId).orElse(null);

        long savedUnis = savedUniversityRepository.countByUserId(userId);
        long savedCourses = savedCourseRepository.countByUserId(userId);
        long appsSubmitted = applicationRepository.findByUserId(userId).size();
        long scholarships = scholarshipRepository.count();
        
        int completion = calculateProfileCompletion(user, profile);

        return new DashboardResponse(
                user.getName(),
                savedUnis,
                savedCourses,
                appsSubmitted,
                scholarships,
                completion
        );
    }

    public ApplicationStatsResponse getApplicationStats(Long userId) {
        List<Application> apps = applicationRepository.findByUserId(userId);
        
        long total = apps.size();
        long pending = 0;
        long underReview = 0;
        long accepted = 0;
        long rejected = 0;
        long offerReceived = 0;

        for (Application app : apps) {
            if (app.getStatus() == null) continue;
            switch (app.getStatus()) {
                case PENDING:
                    pending++;
                    break;
                case UNDER_REVIEW:
                case SHORTLISTED:
                case DOCUMENTS_PENDING:
                case INTERVIEW_SCHEDULED:
                    underReview++;
                    break;
                case ACCEPTED:
                case APPROVED:
                    accepted++;
                    break;
                case REJECTED:
                    rejected++;
                    break;
                case ADMISSION_CONFIRMED:
                    offerReceived++;
                    break;
                default:
                    break;
            }
        }

        ApplicationStatsResponse stats = new ApplicationStatsResponse(total, underReview, accepted, rejected, offerReceived);
        // We can also support pending if needed, but we keep the constructor signatures matching. Let's make sure stats matches the required DTO.
        return stats;
    }

    private boolean isNotEmpty(String val) {
        return val != null && !val.trim().isEmpty();
    }
}
