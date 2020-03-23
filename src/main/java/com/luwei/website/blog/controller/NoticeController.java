package com.luwei.website.blog.controller;

import com.luwei.website.blog.domain.Notice;
import com.luwei.website.blog.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    public NoticeService noticeService;

    @RequestMapping("/findAll")
    public String findAll(Model model){
        List<Notice> noticeList = noticeService.findAll();
        model.addAttribute("noticeList",noticeList);
        return "user/user_notice";
    }
    @PostMapping("/addNotice")
    public String addNotice(@Valid Notice notice, RedirectAttributes attributes){
        notice.setStatus(0);
        notice.setCreateDate(new Date());
        notice.setModifyDate(new Date());
        Notice notice1 = noticeService.addNotice(notice);
        if(notice1 != null){
            return "redirect:/notice/findAll";
        }else{
            return "redirect:/base/404";
        }
    }
    @PostMapping("/updateNotice")
    public String updateNotice(@Valid Notice notice, RedirectAttributes attributes){
        Notice notice1 = noticeService.getOne(notice.getId());
        notice.setCreateDate(notice1.getCreateDate());
        notice.setModifyDate(new Date());
        Notice notice2 = noticeService.addNotice(notice);
        if(notice2 != null){
            return "redirect:/notice/findAll";
        }else{
            return "redirect:/base/404";
        }
    }

    @GetMapping("/deleteNotice")
    public String deleteNotice(@RequestParam("id")String id,RedirectAttributes attributes){
        try {
            noticeService.deleteNotice(Long.parseLong(id));
            return "redirect:/notice/findAll";
        }catch (Exception e){
            return "redirect:/base/404";
        }
    }

    @RequestMapping("/showNotice")
    public String showNotice(@RequestParam("id")String id,Model model){
        Notice notice = noticeService.getOne(Long.parseLong(id));
        model.addAttribute("notice",notice);
        return "notice/show_notice";
    }

}
