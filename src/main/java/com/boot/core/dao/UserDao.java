package com.boot.core.dao;

import com.boot.core.pojo.User;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * @author hongjun500
 * @date 2019/2/24 13:57
 */
public interface UserDao {

    //根据账号和密码来登录
    public User getUser(@Param("user_code")String usercode,@Param("user_password")String password);

    //查询管理员列表
    public List<User> getAdminUserList();
}
