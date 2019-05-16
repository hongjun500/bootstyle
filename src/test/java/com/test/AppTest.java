package com.test;

import com.boot.core.dao.UserDao;
import com.boot.core.pojo.BaseDict;
import com.boot.core.pojo.Customer;
import com.boot.core.pojo.User;
import com.boot.core.service.BaseDictService;
import com.boot.core.service.CustomerService;
import com.boot.core.service.UserService;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * @author hongjun500
 * @date 2019/2/24 13:51
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class AppTest {

//    @Autowired
//    private UserService userService;
//    @Test
//    public void login(){
//        User user=userService.getUser("hongjun500","88688");
//        Assert.assertNotNull(user);
//    }

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserService userService;

    @Autowired
    private BaseDictService baseDictService;

    @Autowired
    private CustomerService customerService;

    //客户来源
    @Value("${customer.from.type}")
    private String FROM_TYPE;

    //客户所属行业
    @Value("${customer.industry.type}")
    private String INDUSTRY_TYPE;

    //客户级别
    @Value("${customer.level.type}")
    private String LEVEL_TYPE;


    @Test
    public void testUserDao(){
        User user = userDao.getUser("admin","123456");

        Assert.assertEquals("管理员",user.getUser_name());
    }

    @Test
    public void testBaseDict(){
        List<BaseDict> baseDictList = baseDictService.findBaseDictByTypeCode(INDUSTRY_TYPE);

        Assert.assertEquals("客户所属行业",baseDictList.get(0).getDict_type_name());

        List<BaseDict> baseDictList2 = baseDictService.findBaseDictByTypeCode(FROM_TYPE);

        Assert.assertEquals("客户来源",baseDictList2.get(0).getDict_type_name());

        List<BaseDict> baseDictList6 = baseDictService.findBaseDictByTypeCode(LEVEL_TYPE);

        Assert.assertEquals("客户级别",baseDictList6.get(0).getDict_type_name());
    }

//    @Test
//    @Ignore
//    public void testCustomerService(){
//        List<Customer> customerList = customerService.findCustomerList(null);
//
//        Assert.assertEquals("网络营销",customerList.get(0).getCust_industry());
//
//        Customer newCustomer = new Customer();
//
//        newCustomer.setCust_name("王五");
//        newCustomer.setCust_user_id(18);
//        newCustomer.setCust_create_id(1);
//
//        newCustomer.setCust_industry("5");
//        newCustomer.setCust_level("8");
//        newCustomer.setCust_linkman("1");
//        newCustomer.setCust_phone("027-83625877");
//
//
//        Date date = new Date();
//        Timestamp timestamp = new Timestamp(date.getTime());
//        newCustomer.setCust_createtime(timestamp);
//
//        customerService.createCustomer(newCustomer);
//
//        Random r = new Random();
//        r.nextInt(3);
//
//    }

    @Test
    @Ignore
    public void add50Customers(){
        String[] lastNames = {"张","李","王","赵"};
        String[] firstNames = {"三","四","五","六"};

        Random random = new Random();
        for(int i=0;i<50;i++){


            String name = lastNames[random.nextInt(4)]+firstNames[random.nextInt(4)];

            String source = Integer.toString(random.nextInt(2) + 1);

            String industry = Integer.toString(random.nextInt(5) + 3);

            String level = Integer.toString(random.nextInt(2) + 8);

            System.out.println(name+","+source+","+industry+","+level);

            Customer newCustomer = new Customer();

            newCustomer.setCust_name(name);
            newCustomer.setCust_user_id(1);
            newCustomer.setCust_create_id(1);

            newCustomer.setCust_industry(industry);
            newCustomer.setCust_level(level);
            newCustomer.setCust_linkman("1");
            newCustomer.setCust_phone("027-83625877");

            Date date = new Date();
            Timestamp timestamp = new Timestamp(date.getTime());
            newCustomer.setCust_createtime(timestamp);

            customerService.createCustomer(newCustomer);
        }

    }
}
