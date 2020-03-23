package com.luwei.website.blog.repository;

import com.luwei.website.blog.domain.Blog;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BlogRepository extends JpaRepository<Blog,Long> {

    public List<Blog> findByTag(String tag);

    public List<Blog> findByUserId(Long userId);
}
