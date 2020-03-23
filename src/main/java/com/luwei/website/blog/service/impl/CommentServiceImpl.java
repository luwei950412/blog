package com.luwei.website.blog.service.impl;

import com.luwei.website.blog.domain.Comment;
import com.luwei.website.blog.repository.CommentRepository;
import com.luwei.website.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    public CommentRepository commentRepository;

    @Override
    @Transactional
    public Comment addComment(Comment comment) {
        Comment comment1 = commentRepository.save(comment);
        return comment1;
    }

    @Override
    @Transactional
    public void deleteComment(Comment comment) {
        commentRepository.delete(comment);
    }

    @Override
    @Transactional
    public Comment updateComment(Comment comment) {
        Comment comment1 = commentRepository.save(comment);
        return comment1;
    }

    @Override
    public List<Comment> findAll() {
        List<Comment> commentList = commentRepository.findAll();
        return commentList;
    }

    @Override
    public List<Comment> findByBlogId(Long blogId) {
        List<Comment> commentList = commentRepository.findByBlogIdAndParentId(blogId,Long.parseLong("-1"));
        return commentList;
    }

    @Override
    public List<Comment> findByParentId(Long parentId) {
        List<Comment> commentList = commentRepository.findByParentId(parentId);
        return commentList;
    }

    @Override
    public List<Comment> findByUserId(Long userId) {
        List<Comment> commentList = commentRepository.findByUserId(userId);
        return commentList;
    }

    @Override
    public Comment getOne(Long id) {
        Comment comment = commentRepository.getOne(id);
        return comment;
    }
}
