package com.luwei.website.blog.service.impl;

import com.luwei.website.blog.domain.Blog;
import com.luwei.website.blog.repository.BlogRepository;
import com.luwei.website.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.*;
import javax.transaction.Transactional;
import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    public BlogRepository blogRepository;

    @Override
    @Transactional
    public Blog addBlog(Blog blog) {
        Blog blog1 = blogRepository.save(blog);
        return blog1;
    }

    @Override
    @Transactional
    public void deleteBlog(Blog blog) {
        blogRepository.delete(blog);

    }

    @Override
    @Transactional
    public Blog updateBlog(Blog blog) {
        Blog blog1 = blogRepository.save(blog);
        return blog1;
    }

    @Override
    public List<Blog> findAll() {
        List<Blog> blogList = blogRepository.findAll();
        return blogList;
    }

    @Override
    public List<Blog> findByTag(String tag) {
        List<Blog> blogList = blogRepository.findByTag(tag);
        return blogList;
    }

    @Override
    public List<Blog> findByUserId(Long userId) {
        List<Blog> blogList = blogRepository.findByUserId(userId);
        return blogList;
    }

    @Override
    public Blog getOne(Long id) {
        Blog blog = blogRepository.getOne(id);
        return blog;
    }
}
