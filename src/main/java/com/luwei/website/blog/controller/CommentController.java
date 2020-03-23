package com.luwei.website.blog.controller;

import com.luwei.website.blog.domain.Comment;
import com.luwei.website.blog.domain.User;
import com.luwei.website.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;

@RequestMapping("/comment")
@Controller
public class CommentController {

    @Autowired
    public CommentService commentService;

    @PostMapping("/addComment")
    public String addComment(@Valid Comment comment, RedirectAttributes attributes, HttpServletRequest request){
        HttpSession session = request.getSession();
        //将数据存储到session中
        User user = (User)session.getAttribute("userInfo");
        comment.setCreateDate(new Date());
        comment.setModifyDate(new Date());
        comment.setUserId(user.getId());
        if(comment.getParentId()==null){
            comment.setParentId(Long.parseLong("-1"));
        }
//        String content = comment.getContent();

        Comment comment1 = commentService.addComment(comment);
        if(comment1!=null){
            attributes.addAttribute("id",comment.getBlogId());
            return "redirect:/blog/showBlog";
        }else{
            return "base/404";
        }
    }
    @GetMapping("/deleteComment")
    public String deleteComment(@RequestParam("id")String id,@RequestParam("blogId")String blogId,RedirectAttributes attributes){
        Comment comment = commentService.getOne(Long.parseLong(id));
        commentService.deleteComment(comment);
        attributes.addAttribute("id",comment.getBlogId());
        return "redirect:/blog/showBlog";
    }
}
