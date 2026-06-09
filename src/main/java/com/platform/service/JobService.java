package com.platform.service;

import com.platform.model.Job;
import com.platform.repository.JobRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobService {

    @Autowired
    private JobRepository jobRepository;

    public List<Job> getAllJobs() {
        return jobRepository.findAll();
    }

    public List<Job> getJobsByCountry(Long countryId) {
        return jobRepository.findByCountryId(countryId);
    }

    public List<Job> getJobsByProvider(Long providerId) {
        return jobRepository.findByProviderId(providerId);
    }

    public Job saveJob(Job job) {
        return jobRepository.save(job);
    }

    public Job getJobById(Long id) {
        return jobRepository.findById(id).orElse(null);
    }

    public void deleteJob(Long id) {
        jobRepository.deleteById(id);
    }
}
