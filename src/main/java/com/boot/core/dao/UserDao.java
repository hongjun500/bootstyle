package com.boot.core.dao;

import com.boot.core.pojo.User;
import org.apache.ibatis.annotations.Param;

/**
 * @author hongjun500
 * @date 2019/2/24 13:57
 */
public interface UserDao {

    //根据账号和密码来登录
    public User getUser(@Param("user_code")String usercode,@Param("user_password")String password);
}
