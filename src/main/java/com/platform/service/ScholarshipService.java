package com.platform.service;

import com.platform.model.Scholarship;
import com.platform.repository.ScholarshipRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScholarshipService {

    @Autowired
    private ScholarshipRepository scholarshipRepository;

    public List<Scholarship> getAllScholarships() {
        return scholarshipRepository.findAll();
    }

    public List<Scholarship> getScholarshipsByCountry(Long countryId) {
        return scholarshipRepository.findByUniversity_CountryId(countryId);
    }

    public List<Scholarship> getScholarshipsByProvider(Long providerId) {
        return scholarshipRepository.findByUniversity_ProviderId(providerId);
    }

    public Scholarship getScholarshipById(Long id) {
        return scholarshipRepository.findById(id).orElse(null);
    }

    public void saveScholarship(Scholarship scholarship) {
        scholarshipRepository.save(scholarship);
    }

    public void deleteScholarship(Long id) {
        scholarshipRepository.deleteById(id);
    }
}
