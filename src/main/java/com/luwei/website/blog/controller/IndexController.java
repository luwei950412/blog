package com.luwei.website.blog.controller;

import com.luwei.website.blog.domain.Blog;
import com.luwei.website.blog.domain.Category;
import com.luwei.website.blog.domain.Notice;
import com.luwei.website.blog.service.BlogService;
import com.luwei.website.blog.service.CategoryService;
import com.luwei.website.blog.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    public NoticeService noticeService;
    @Autowired
    public BlogService blogService;
    @Autowired
    public CategoryService categoryService;

    @RequestMapping("/")
    public String index(Model model){
        List<Notice> noticeList = noticeService.findByStatus(0);
        List<Blog> blogList = blogService.findAll();
        List<Category> categoryList = categoryService.findAll();
        model.addAttribute("noticeList",noticeList);
        model.addAttribute("blogList",blogList);
        model.addAttribute("categoryList",categoryList);
        return "index";
    }

}
