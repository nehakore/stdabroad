package com.platform.service;

import com.platform.model.Enquiry;
import com.platform.repository.EnquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnquiryService {

    @Autowired
    private EnquiryRepository enquiryRepository;

    public List<Enquiry> getAllEnquiries() {
        return enquiryRepository.findAll();
    }

    public Enquiry saveEnquiry(Enquiry enquiry) {
        return enquiryRepository.save(enquiry);
    }

    public Enquiry getEnquiryById(Long id) {
        return enquiryRepository.findById(id).orElse(null);
    }

    public void deleteEnquiry(Long id) {
        enquiryRepository.deleteById(id);
    }
}
