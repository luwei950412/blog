package com.luwei.website.blog.service.impl;

import com.luwei.website.blog.domain.Category;
import com.luwei.website.blog.repository.CategoryRepository;
import com.luwei.website.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    public CategoryRepository categoryRepository;
    @Override
    public Category addCategory(Category category) {
        Category category1 = categoryRepository.save(category);
        return category1;
    }

    @Override
    public void deleteCategory(Long id) {
        Category category = categoryRepository.getOne(id);
        category.setDeleteFlag(1);
        Category category1 = categoryRepository.save(category);
    }

    @Override
    public Category updateCategory(Category category) {
        Category category1 = categoryRepository.save(category);
        return category1;
    }

    @Override
    public List<Category> findAll() {
        List<Category> categoryList = categoryRepository.findByDeleteFlag(0);
        return categoryList;
    }

    @Override
    public Category getOne(Long id) {
        Category category = categoryRepository.getOne(id);
        return category;
    }

    @Override
    public List<Category> findByChildNameAndDeleteFlag(String childName, Integer deleteFlag) {
        List<Category> categoryList = categoryRepository.findByChildNameAndDeleteFlag(childName,deleteFlag);
        return categoryList;
    }
}
