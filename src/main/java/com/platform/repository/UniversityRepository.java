package com.platform.repository;

import com.platform.model.University;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UniversityRepository extends JpaRepository<University, Long> {
    List<University> findByCountryId(Long countryId);
    List<University> findByProviderId(Long providerId);
}
