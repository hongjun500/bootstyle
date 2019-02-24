package com.boot.core.interceptor;
import com.boot.core.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//登录拦截器
public class LoginInterceptor implements HandlerInterceptor{
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception{
        //获取请求的url
        String url=request.getRequestURI();
        //除了登录请求外，其他的URL都进行拦截控制
        if(url.indexOf("/login")>=0){     //如果是登录请求，则放行
            return true;
        }

        //获取Session
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("USER_SESSION");//获取到Session

        //判断Session中是否有用户数据，如果有，则返回true，继续向下执行
        if(user!=null){
            return true;
        }
        //不符合条件的给出提示信息
        request.setAttribute("msg","您还没有登录，请先登录！");
        //转发到登录页面
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)throws Exception{

    }
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,Object handler,Exception ex) throws Exception{

    }
}
