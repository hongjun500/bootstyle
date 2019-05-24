package com.boot.core.service.impl;

import com.boot.core.dao.UserDao;
import com.boot.core.pojo.User;
import com.boot.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hongjun500
 * @date 2019/2/24 14:07
 * 用户登录业务逻辑类
 */
@Service
public class UserServiceImpl implements UserService {

    //注入
    @Autowired
    private UserDao userDao;

    @Override
    public User getUser(String usercode, String password) {
         User user=this.userDao.getUser(usercode,password);
         return user;
    }

    @Override
    public List<User> findAdminUserList() {
        List<User> userList=userDao.getAdminUserList();
        return userList;
    }


}
