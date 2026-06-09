package com.platform.service;

import com.platform.model.Application;
import com.platform.model.ApplicationStatus;
import com.platform.repository.ApplicationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplicationService {

    @Autowired
    private ApplicationRepository applicationRepository;

    public List<Application> getAllApplications() {
        return applicationRepository.findAll();
    }

    public List<Application> getApplicationsByUser(Long userId) {
        return applicationRepository.findByUserId(userId);
    }

    public List<Application> getApplicationsByJob(Long jobId) {
        return applicationRepository.findByJobId(jobId);
    }

    public Application saveApplication(Application application) {
        return applicationRepository.save(application);
    }

    public Application getApplicationById(Long id) {
        return applicationRepository.findById(id).orElse(null);
    }

    public void updateApplicationStatus(Long id, ApplicationStatus status) {
        applicationRepository.findById(id).ifPresent(app -> {
            app.setStatus(status);
            applicationRepository.save(app);
        });
    }

    public void deleteApplication(Long id) {
        applicationRepository.deleteById(id);
    }
}
