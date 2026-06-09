package com.platform.repository;

import com.platform.model.CounsellingSession;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CounsellingSessionRepository extends JpaRepository<CounsellingSession, Long> {
    List<CounsellingSession> findByUserId(Long userId);
    List<CounsellingSession> findByUniversity_Provider_Id(Long providerId);
}
