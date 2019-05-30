package com.boot.core.web.controller;

import com.boot.core.pojo.Customer;
import com.boot.core.pojo.User;
import com.boot.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * @author hongjun500
 * @date 2019/2/24 14:15
 * 用户登录控制器类
 */
@Controller
public class UserController {

    //注入
    @Autowired
    private UserService userService;


    //登录
    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public String login(String usercode, String password, Model model, HttpSession httpSession){

        User user=this.userService.getUser(usercode,password);
        if(user==null){
            model.addAttribute("msg","账号或密码错误，请重新输入!");
            return "login";
        }else {
            httpSession.setAttribute("USER_SESSION",user);
            return "redirect:success.do";    //重定向到success
        }

    }


    @RequestMapping(value = "/success.do")
    public String Success(){
        return "administration";   //跳转至管理页面
    }
    //退出登录
    @RequestMapping(value ="/logout.do")
    public String logout(HttpSession httpSession){
        httpSession.invalidate();
        return "redirect:login.do";
    }
    @RequestMapping(value = "/login.do",method = RequestMethod.GET)
    public String toLogin(){
        return "login";
    }


    //用户管理显示集合
    @RequestMapping(value = "/adminUserList.do")
    public String toAdminUser(String userName,Model model){
        List<User> user=userService.findAdminUserList(userName);
        model.addAttribute("adminUserList",user);


        model.addAttribute("adminUserName",userName);
        return "admin_userList";
    }

}
