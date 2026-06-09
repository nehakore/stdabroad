package com.platform.repository;

import com.platform.model.Job;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobRepository extends JpaRepository<Job, Long> {
    List<Job> findByCountryId(Long countryId);
    List<Job> findByProviderId(Long providerId);
}
