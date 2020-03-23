package com.luwei.website.blog.controller;

import com.luwei.website.blog.domain.Blog;
import com.luwei.website.blog.domain.Category;
import com.luwei.website.blog.domain.Comment;
import com.luwei.website.blog.domain.User;
import com.luwei.website.blog.service.BlogService;
import com.luwei.website.blog.service.CategoryService;
import com.luwei.website.blog.service.CommentService;
import com.luwei.website.blog.service.UserService;
import com.luwei.website.blog.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/blog")
public class BlogController {
    @Autowired
    public BlogService blogService;
    @Value("${web.upload-path}")
    private String filePath;

    @Autowired
    public CategoryService categoryService;
    @Autowired
    public CommentService commentService;
    @Autowired
    public UserService userService;


    @GetMapping("/postBlog")
    public String postBlog(Model model){
        List<Category> categoryList = categoryService.findAll();
        model.addAttribute("categoryList",categoryList);
        return "blog/post_blog";
    }

    @PostMapping("/postBlog")
    public String savePostBlog(@Valid Blog blog, BindingResult bindingResult, HttpServletRequest request,
                               HttpServletResponse response, RedirectAttributes attributes, @RequestParam(value="filePath") MultipartFile file){

        if (!file.isEmpty()) {
            String contentType = file.getContentType();
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));

            String filePath1 = filePath+"blogimg/";

            try {
                filePath1 = URLDecoder.decode(filePath1, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            String file_name = System.currentTimeMillis() + suffixName;
            File dest = new File(filePath1);
            // 检测是否存在目录
            if (!dest.exists()) {
                dest.mkdirs();// 新建文件夹
            }
            try {
                FileUtils.uploadFile(file.getBytes(), filePath1, file_name);
            } catch (Exception e) {
                // TODO: handle exception
            }
            blog.setFilePath(file_name);
        } else {
//            blog.setFilePath();
        }
        blog.setCreateDate(new Date());
        blog.setModifyDate(new Date());

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();
        //将数据存储到session中
        User user = (User)session.getAttribute("userInfo");
        if(user!=null){
            blog.setUserId(user.getId());
            Blog blog1 = blogService.addBlog(blog);
            if(blog1 != null){
                attributes.addAttribute("id",blog1.getId());
                return "redirect:/blog/postSuccess";
            }
        }
        attributes.addAttribute("id",0);
        return "redirect:/blog/postFail";
    }

    @GetMapping("/postSuccess")
    public String postSuccess(@RequestParam("id")String id,Model model){
        if(id!=null){
            Blog blog = blogService.getOne(Long.parseLong(id));
            model.addAttribute("blog",blog);
            return "base/post_success";
        }else {
            return "base/404";
        }
    }

    @GetMapping("/postFail")
    public String postFail(@RequestParam("id")String id){
        if("0".equals(id)){
            return "base/post_fail";
        }else{
            return "base/404";
        }

    }

    @RequestMapping("/showBlog")
    public String showBlog(@RequestParam("id")String id, Model model){
        Blog blog = blogService.getOne(Long.parseLong(id));
        HashMap<String, List<Comment>> allCommentMap= new HashMap<>();
        HashMap<String, User> userMap= new HashMap<>();
        List<Comment> commentList = commentService.findByBlogId(Long.parseLong(id));
        commentList  = commentList.stream().map(
                comment->{
                    List<Comment> commentList1 = commentService.findByParentId(comment.getId());
                    User user = userService.getOne(comment.getUserId());
                    userMap.put(String.valueOf(comment.getId()),user);
                    if(commentList1 !=null){
                        commentList1 = commentList1.stream().map(replyComment->{
                            User user1 = userService.getOne(replyComment.getUserId());
                            userMap.put(String.valueOf(replyComment.getId()),user1);return replyComment;
                        }).collect(Collectors.toList());
                        allCommentMap.put(String.valueOf(comment.getId()),commentList1);
                    }else{
                        allCommentMap.put(String.valueOf(comment.getId()),null);
                    }
                    return comment;
                }
        ).collect(Collectors.toList());
        model.addAttribute("userMap",userMap);
        model.addAttribute("commentList",commentList);
        model.addAttribute("allCommentMap",allCommentMap);
        model.addAttribute("blog",blog);
        return "blog/article";
    }

    @GetMapping("/updateBlog")
    public String updateBlog(@RequestParam("id")String id,Model model){
        Blog blog = blogService.getOne(Long.parseLong(id));
        List<Category> categoryList = categoryService.findAll();
        model.addAttribute("categoryList",categoryList);
        model.addAttribute("blog",blog);
        return "blog/update_blog";
    }

    @PostMapping("/updateBlog")
    public String updateBlog(@Valid Blog blog, BindingResult bindingResult, HttpServletRequest request,
                             HttpServletResponse response, RedirectAttributes attributes, @RequestParam(value="filePath") MultipartFile file){
        System.out.println("here is updateBlog");
        Blog blog1 = blogService.getOne(blog.getId());
        blog.setUserId(blog1.getUserId());
        if (!file.isEmpty()) {
            String contentType = file.getContentType();
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));

            String filePath1 = filePath+"blogimg/";

            try {
                filePath1 = URLDecoder.decode(filePath1, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            String file_name = System.currentTimeMillis() + suffixName;
            File dest = new File(filePath1);
            // 检测是否存在目录
            if (!dest.exists()) {
                dest.mkdirs();// 新建文件夹
            }
            try {
                FileUtils.uploadFile(file.getBytes(), filePath1, file_name);
            } catch (Exception e) {
                // TODO: handle exception
            }
            blog.setFilePath(file_name);
        } else {
            blog.setFilePath(blog1.getFilePath());
        }
        blog.setCreateDate(blog1.getCreateDate());
        blog.setModifyDate(new Date());
        blog.setDeleteFlag(blog1.getDeleteFlag());
        Blog blog2 = blogService.updateBlog(blog);
        if(blog2 != null){
            return "redirect:/user/userBlog";
        }else{
            return "base/404";
        }
    }

    @GetMapping("/deleteBlog")
    public String deleteBlog(@RequestParam("id")String id,RedirectAttributes attributes){
        try {
            Blog blog = blogService.getOne(Long.parseLong(id));
             blogService.deleteBlog(blog);
             return "redirect:/user/userBlog";
        }catch (Exception e){
            return "base/404";
        }
    }

    @RequestMapping("/classifiedDisplay")
    public String classifiedDisplay(@RequestParam(name = "tag",required = false)String tag,Model model){
        List<Blog> blogList = new ArrayList<>();
        List<Category> categoryList = categoryService.findAll();
        if(tag != null){
            blogList = blogService.findByTag(tag);
            model.addAttribute("tag",tag);
        }else{
            blogList = blogService.findAll();
        }
        model.addAttribute("blogList",blogList);
        model.addAttribute("categoryList",categoryList);
        return "blog/classified_display";
    }
    @RequestMapping("/classifiedByDev")
    public String classifiedByDev(Model model){
        List<Blog> blogList = new ArrayList<>();
        List<Category> categoryList = categoryService.findByChildNameAndDeleteFlag("业务开发",0);
        categoryList = categoryList.stream().map(category->{
            List<Blog> blogList1 = blogService.findByTag(category.getName());
            blogList1 = blogList1.stream().map(blog->{
                blogList.add(blog);
                return  blog;
            }).collect(Collectors.toList());
            return category;
        }).collect(Collectors.toList());
        model.addAttribute("blogList",blogList);
//        model.addAttribute("categoryList",categoryList);
        return "blog/classified_by_dev";
    }
    @RequestMapping("/classifiedByArc")
    public String classifiedByArc(Model model){
        List<Blog> blogList = new ArrayList<>();
        List<Category> categoryList = categoryService.findByChildNameAndDeleteFlag("架构之路",0);
        categoryList = categoryList.stream().map(category->{
            List<Blog> blogList1 = blogService.findByTag(category.getName());
            blogList1 = blogList1.stream().map(blog->{
                blogList.add(blog);
                return  blog;
            }).collect(Collectors.toList());
            return category;
        }).collect(Collectors.toList());
        model.addAttribute("blogList",blogList);
//        model.addAttribute("categoryList",categoryList);
        return "blog/classified_by_dev";
    }
    @RequestMapping("/classifiedByInt")
    public String classifiedByInt(Model model){
        List<Blog> blogList = new ArrayList<>();
        List<Category> categoryList = categoryService.findByChildNameAndDeleteFlag("人工智能",0);
        categoryList = categoryList.stream().map(category->{
            List<Blog> blogList1 = blogService.findByTag(category.getName());
            blogList1 = blogList1.stream().map(blog->{
                blogList.add(blog);
                return  blog;
            }).collect(Collectors.toList());
            return category;
        }).collect(Collectors.toList());
        model.addAttribute("blogList",blogList);
//        model.addAttribute("categoryList",categoryList);
        return "blog/classified_by_dev";
    }

}
