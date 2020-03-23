package com.luwei.website.blog.controller;

import com.luwei.website.blog.domain.Category;
import com.luwei.website.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    public CategoryService categoryService;

    @RequestMapping("/listCategory")
    public String listCategory(Model model){
        List<Category> categoryList = categoryService.findAll();
        model.addAttribute("categoryList",categoryList);
        return "category/list_category";
    }

    @PostMapping("/addCategory")
    public String addCategory(@Valid Category category, RedirectAttributes attributes){
        category.setCreateDate(new Date());
        category.setModifyDate(new Date());
        Category category1 = categoryService.addCategory(category);
        if(category1 != null){
            return "redirect:/category/listCategory";
        }else{
            return "base/404";
        }
    }
    @PostMapping("/updateCategory")
    public String updateCategory(@Valid Category category, RedirectAttributes attributes){
        Category category1 = categoryService.getOne(category.getId());
        category.setCreateDate(category1.getCreateDate());
        category.setModifyDate(new Date());
        Category category2 = categoryService.addCategory(category);
        if(category2 != null){
            return "redirect:/category/listCategory";
        }else{
            return "base/404";
        }
    }
    @RequestMapping("/deleteCategory")
    public String deleteCategory(@RequestParam("id")String id,RedirectAttributes attributes){
        try {
            categoryService.deleteCategory(Long.parseLong(id));
        }catch (Exception e){
            return "base/404";
        }
        return "redirect:/category/listCategory";

    }

}
