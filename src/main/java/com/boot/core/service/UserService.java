package com.boot.core.service;

import com.boot.core.pojo.User;

import java.util.List;


/**
 * @author hongjun500
 * @date 2019/2/24 13:58
 */
public interface UserService {

    //根据账号和密码来登录
    public User getUser(String usercode,String password);

    public List<User> findAdminUserList(String userName);


}
