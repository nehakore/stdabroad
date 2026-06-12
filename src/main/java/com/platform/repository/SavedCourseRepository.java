package com.platform.repository;

import com.platform.model.SavedCourse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface SavedCourseRepository extends JpaRepository<SavedCourse, Long> {
    List<SavedCourse> findByUserId(Long userId);
    long countByUserId(Long userId);
    Optional<SavedCourse> findByUserIdAndCourseId(Long userId, Long courseId);
}
