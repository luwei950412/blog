package com.luwei.website.blog.controller;

import com.luwei.website.blog.domain.Blog;
import com.luwei.website.blog.domain.User;
import com.luwei.website.blog.service.BlogService;
import com.luwei.website.blog.service.UserService;
import com.luwei.website.blog.utils.AppMD5Util;
import com.luwei.website.blog.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    public UserService userService;
    @Autowired
    public BlogService blogService;
    @Autowired
    private JavaMailSender javaMailSender;

    @Value("${web.upload-path}")
    private String filePath;

    @GetMapping("/register")
    public String register(){
        return "user/register";
    }
    @PostMapping("/isExistUsername")
    @ResponseBody
    public String isExistUsername(@RequestParam("username") String username){
        User user = userService.findByUsername(username);
        if(user == null){
            return "true";
        }else{
            return "false";
        }
    }
    @PostMapping("/register")
    @ResponseBody
    public String addUser(@Valid User user,HttpServletRequest request,HttpServletResponse response){
        user.setStatus(0);
        user.setPassword(AppMD5Util.getMD5(user.getPassword()));
        user.setCreateDate(new Date());
        user.setModifyDate(new Date());
        user.setHeadimg("default.png");
        User user1 = userService.addUser(user);

        if(user1 != null){
            String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();//获取服务器路径
            String realpath=request.getSession().getServletContext().getRealPath("/");//获取真实路径
            try {
                boolean test = sendemail(user.getEmail(),user.getUsername(),path,realpath);
                if(test == false){
                    return "send_fail";
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            return "success";
        }else{
            return "error";
        }
    }
    @GetMapping("/verifyMail")
    public String verifyMail(@RequestParam("id")String id,RedirectAttributes attributes){
        User user = userService.getOne(Long.parseLong(id));
        user.setStatus(1);
        User user1 = userService.addUser(user);
        if(user1 != null){
            return "redirect:/";
        }else{
            return "base/404";
        }
    }
    @RequestMapping("/sendVerifyMailSuccess")
    public String sendVerifyMailSuccess(){
        return "base/verify_mail";
    }
    @RequestMapping("/sendVerifyMailFail")
    public String sendVerifyMailFail(@RequestParam("username")String username,Model model){
        model.addAttribute("username",username);
        return "base/verify_mail_fail";
    }
    @RequestMapping("/reSendVerifyMail")
    public String reSendVerifyMail(@RequestParam("username")String username,HttpServletRequest request,HttpServletResponse response){
        User user = userService.findByUsername(username);
        String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();//获取服务器路径
        String realpath=request.getSession().getServletContext().getRealPath("/");//获取真实路径
        try {
            boolean test = sendemail(user.getEmail(),user.getUsername(),path,realpath);
            if(test == false){
                return "send_fail";
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "redirect:/user/sendVerifyMailSuccess";
    }

    @PostMapping("/login")
    @ResponseBody
    public String frontLogin(@Valid User user, HttpServletRequest request, HttpServletResponse response)throws IOException {
        User user1 = userService.findByUsername(user.getUsername());
        if(user1 != null) {
            if (user1.getPassword().equals(AppMD5Util.getMD5(user.getPassword()))) {
                if(user1.getStatus() == 0){
                    return "no_verify";
                }else{
                    response.setCharacterEncoding("UTF-8");
                    response.setContentType("text/html;charset=UTF-8");
                    //使用request对象的getSession()获取session，如果session不存在则创建一个
                    HttpSession session = request.getSession();
                    //将数据存储到session中
                    session.setAttribute("userInfo", user1);
                    return "success";
                }
            } else {
                return "error";
            }
        }else{
            return "no_user";
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(RedirectAttributes redirectAttributes, HttpServletRequest request) {
        //使用权限管理工具进行用户的退出，跳出登录，给出提示信息
        try {
            HttpSession session1 = request.getSession();
            session1.setAttribute("userInfo",null);
//            session1.invalidate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("message", "您已安全退出");
        return "redirect:/";
    }
    @GetMapping("/userCenter")
    public String userCenter(){
        return "user/user_center";
    }
    @GetMapping("/userModifyPassword")
    public String userModifyPassword(){
        return "user/user_modify_password";
    }

    @GetMapping("userBlog")
    public String userBlog(HttpServletRequest request, HttpServletResponse response, Model model){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();
        //将数据存储到session中
        User user = (User)session.getAttribute("userInfo");
        List<Blog> blogList = new ArrayList<>();
        if(user !=null){
           blogList = blogService.findByUserId(user.getId());
        }
        model.addAttribute("blogList",blogList);
        return "user/user_blog";
    }

    @PostMapping("/updatePassword")
    @ResponseBody
    public String updatePassword(@Valid User user,HttpServletRequest request,HttpServletResponse response){
        System.out.println(user.getId()+"here is password modify");
        User user1 = userService.findByUsername(user.getUsername());
        user1.setPassword(AppMD5Util.getMD5(user.getPassword()));
//        user1.setPassword(user.getPassword());
        User user2 = userService.addUser(user1);
        if(user2 != null){
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            //使用request对象的getSession()获取session，如果session不存在则创建一个
            HttpSession session = request.getSession();
            //将数据存储到session中
            session.setAttribute("userInfo", user2);
            return "success";
        }else{
            return "error";
        }

    }

    @PostMapping("/updateUser")
    public String updateFrontUser(@Valid User user , BindingResult bindingResult, HttpServletRequest request,
                                  HttpServletResponse response, RedirectAttributes attributes,@RequestParam(value="headimg") MultipartFile file){
        User user1 = userService.findByUsername(user.getUsername());
        System.out.println("here is front modify");
        user.setId(user1.getId());
        user.setCreateDate(user1.getCreateDate());
        user.setModifyDate(new Date());
        user.setPassword(user1.getPassword());
        if (!file.isEmpty()) {
            String contentType = file.getContentType();
            String fileName = file.getOriginalFilename();
            String suffixName = fileName.substring(fileName.lastIndexOf("."));

            String filePath1 = filePath+"headimg/";

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
            user.setHeadimg(file_name);
        } else {
            user.setHeadimg(user1.getHeadimg());
        }
        user.setStatus(user1.getStatus());
        userService.updateUser(user);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //使用request对象的getSession()获取session，如果session不存在则创建一个
        HttpSession session = request.getSession();
        //将数据存储到session中
        session.setAttribute("userInfo", user);
        return "redirect:/user/userCenter";
    }


    //发送邮件
    public boolean sendemail(String semail, String username, String path, String realpath) throws UnsupportedEncodingException {
        try {
            User user = userService.findByUsername(username);

            MimeMessage mimeMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setFrom("13218016163@163.com");
            helper.setTo(user.getEmail());
            helper.setSubject("【主题为：芦苇的博客--用户注册邮箱验证】");
            helper.setText(path+"/user/verifyMail?id="+user.getId());
            javaMailSender.send(mimeMessage);
            return true;
        } catch (Exception e) {
            System.out.println("send fail");
            e.printStackTrace();
            return false;
        }

    }

}
