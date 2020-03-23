package com.luwei.website.blog.service;

import com.luwei.website.blog.domain.Comment;

import java.util.List;

public interface CommentService {

    public Comment addComment(Comment comment);

    public void deleteComment(Comment comment);

    public Comment updateComment(Comment comment);

    public List<Comment> findAll();

    public List<Comment> findByBlogId(Long blogId);

    public List<Comment> findByParentId(Long parentId);

    public List<Comment> findByUserId(Long userId);

    public Comment getOne(Long id);
}
