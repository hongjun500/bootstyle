package com.boot.core.service;

import com.boot.core.pojo.User;


/**
 * @author hongjun500
 * @date 2019/2/24 13:58
 */
public interface UserService {

    //根据账号和密码来登录
    public User getUser(String usercode,String password);

    //获取管理用户的信息
    public User adminUser();


}
