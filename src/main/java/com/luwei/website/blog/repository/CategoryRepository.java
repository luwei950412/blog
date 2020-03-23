package com.luwei.website.blog.repository;

import com.luwei.website.blog.domain.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category,Long> {
    public List<Category> findByDeleteFlag(Integer deleteFlag);
    public List<Category> findByChildNameAndDeleteFlag(String childName,Integer deleteFlag);
}
