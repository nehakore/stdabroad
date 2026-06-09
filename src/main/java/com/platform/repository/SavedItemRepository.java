package com.platform.repository;

import com.platform.model.SavedItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SavedItemRepository extends JpaRepository<SavedItem, Long> {
    List<SavedItem> findByUserId(Long userId);
}
