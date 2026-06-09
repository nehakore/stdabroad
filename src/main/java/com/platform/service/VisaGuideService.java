package com.platform.service;

import com.platform.model.VisaGuide;
import com.platform.repository.VisaGuideRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VisaGuideService {

    @Autowired
    private VisaGuideRepository visaGuideRepository;

    public List<VisaGuide> getAllVisaGuides() {
        return visaGuideRepository.findAll();
    }

    public VisaGuide getVisaGuideByCountry(Long countryId) {
        return visaGuideRepository.findByCountryId(countryId).orElse(null);
    }

    public VisaGuide getVisaGuideById(Long id) {
        return visaGuideRepository.findById(id).orElse(null);
    }

    public void saveVisaGuide(VisaGuide visaGuide) {
        visaGuideRepository.save(visaGuide);
    }

    public void deleteVisaGuide(Long id) {
        visaGuideRepository.deleteById(id);
    }
}
