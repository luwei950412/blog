package com.luwei.website.blog.service;

import com.luwei.website.blog.domain.Category;

import java.util.List;

public interface CategoryService {

    public Category addCategory(Category category);
    public void deleteCategory(Long id);
    public Category updateCategory(Category category);
    public List<Category> findAll();
    public Category getOne(Long id);

    public List<Category> findByChildNameAndDeleteFlag(String childName,Integer deleteFlag);
}
