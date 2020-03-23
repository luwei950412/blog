package com.luwei.website.blog.service;

import com.luwei.website.blog.domain.Blog;

import java.util.List;

public interface BlogService {

    public Blog addBlog(Blog blog);

    public void deleteBlog(Blog blog);

    public Blog updateBlog(Blog blog);

    public List<Blog> findAll();

    public List<Blog> findByTag(String tag);

    public List<Blog> findByUserId(Long userId);

    public Blog getOne(Long id);
}
