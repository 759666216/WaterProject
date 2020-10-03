package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;

@Controller
public class testController {

    @RequestMapping("/upload")
    public String upload(){
        return "upload";
    }

    /**
     * 跳转登陆demo
     * @return
     */
    @GetMapping({"/","login_page"})
    public String userlogin(){
        return "login";
    }

    /**
     * 跳转登陆demo
     * @return
     */
    @GetMapping("/login_error")
    public String login_error(){
        return "login";
    }

    @RequestMapping("/index")
    public String index(HttpServletRequest request){
        //获取到登录用户的IP
        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        System.out.println("ip="+ip);
        return "index";
    }

    @RequestMapping("/file")
    public String file(){
        return "file";
    }

    @RequestMapping("/logManage")
    public String logManage(){
        return "logManage";
    }

}
