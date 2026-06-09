package com.platform.repository;

import com.platform.model.VisaGuide;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface VisaGuideRepository extends JpaRepository<VisaGuide, Long> {
    Optional<VisaGuide> findByCountryId(Long countryId);
}
