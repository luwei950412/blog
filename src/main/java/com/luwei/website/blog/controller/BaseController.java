package com.luwei.website.blog.controller;

import com.luwei.website.blog.ueditor.ActionEnter;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
@RequestMapping("/blog")
public class BaseController {

    /**
     *  配置ue服务器统一请求接口路径http://localhost:8086/admin/ue
     */
    @CrossOrigin(origins = "*",allowCredentials = "true")
    @RequestMapping("/ue")
    public  void configUEditor(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("application/json");
        String rootPath = request.getSession().getServletContext().getRealPath("/")+ "/BOOT-INF/classes/static";
        try {
            String exec = new ActionEnter(request, rootPath).exec();
            PrintWriter writer = response.getWriter();
            writer.write(exec);
            writer.flush();
            writer.close();
        } catch (JSONException | IOException e) {
            e.printStackTrace();
        }

    }
}
