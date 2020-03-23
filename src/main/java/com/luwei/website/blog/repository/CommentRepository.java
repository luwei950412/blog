package com.luwei.website.blog.repository;

import com.luwei.website.blog.domain.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment,Long> {

    List<Comment> findByBlogIdAndParentId(Long blogId,Long parentId);

    List<Comment> findByParentId(Long parentId);

    List<Comment> findByUserId(Long userId);
}
