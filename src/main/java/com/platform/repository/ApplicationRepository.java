package com.platform.repository;

import com.platform.model.Application;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplicationRepository extends JpaRepository<Application, Long> {
    List<Application> findByUserId(Long userId);
    List<Application> findByJobId(Long jobId);
    List<Application> findByCourseId(Long courseId);
    List<Application> findByCourse_University_Provider_Id(Long providerId);
    List<Application> findByJob_Provider_Id(Long providerId);
    long countByJob_Provider_Id(Long providerId);
}
