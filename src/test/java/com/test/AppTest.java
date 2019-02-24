package com.test;

import com.boot.core.pojo.User;
import com.boot.core.service.UserService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author hongjun500
 * @date 2019/2/24 13:51
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class AppTest {

    @Autowired
    private UserService userService;
    @Test
    public void login(String usercode,String password){
        User user=userService.getUser(usercode,password);
        Assert.assertNotNull(user);
    }
}
