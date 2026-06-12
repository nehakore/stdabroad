package com.platform.repository;

import com.platform.model.SavedUniversity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface SavedUniversityRepository extends JpaRepository<SavedUniversity, Long> {
    List<SavedUniversity> findByUserId(Long userId);
    long countByUserId(Long userId);
    Optional<SavedUniversity> findByUserIdAndUniversityId(Long userId, Long universityId);
}
