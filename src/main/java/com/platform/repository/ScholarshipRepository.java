package com.platform.repository;

import com.platform.model.Scholarship;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScholarshipRepository extends JpaRepository<Scholarship, Long> {
    List<Scholarship> findByUniversity_CountryId(Long countryId);
    List<Scholarship> findByUniversity_ProviderId(Long providerId);
}
