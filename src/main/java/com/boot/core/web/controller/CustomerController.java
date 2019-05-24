package com.boot.core.web.controller;

import com.boot.common.util.Page;
import com.boot.core.pojo.BaseDict;
import com.boot.core.pojo.Customer;
import com.boot.core.pojo.User;
import com.boot.core.service.BaseDictService;
import com.boot.core.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
public class CustomerController {
    //依赖注入
    @Autowired
    private CustomerService customerService;
    @Autowired
    private BaseDictService baseDictService;

    // 客户行业
    @Value("${customer.industry.type}")
    private String INDUSTRY_TYPE;
    // 客户性别
    @Value("${customer.sex.type}")
    private String SEX_TYPE;
    // 客户级别
    @Value("${customer.level.type}")
    private String LEVEL_TYPE;

   //客户显示集合
    @RequestMapping(value = "/list.do")
    public String tolist(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "8") Integer rows,
                         String custName,String custSex,
                         String custIndustry, String custLevel,Customer customer, Model model){


        Page<Customer> customers;
        customers = customerService.findCustomerList(page,rows,custName,custSex,custIndustry,custLevel);

        model.addAttribute("page",customers);

        List<BaseDict> industryType=baseDictService.findBaseDictByTypeCode(INDUSTRY_TYPE);
        List<BaseDict> sexType=baseDictService.findBaseDictByTypeCode(SEX_TYPE);
        List<BaseDict> levelType=baseDictService.findBaseDictByTypeCode(LEVEL_TYPE);

        //查询的客户总数；
       Integer count=customerService.selectCustomerListCount(customer);
       model.addAttribute("count",count);

        model.addAttribute("sexType", sexType);
        model.addAttribute("industryType", industryType);
        model.addAttribute("levelType", levelType);

        model.addAttribute("custSex", custSex);
        model.addAttribute("custIndustry", custIndustry);
        model.addAttribute("custLevel", custLevel);
        return "customer_list";
    }


    //客户查询
    @RequestMapping(value = "/search.do")
    public String  search(Model model){
        List<BaseDict> industryType=baseDictService.findBaseDictByTypeCode(INDUSTRY_TYPE);
        List<BaseDict> sexType=baseDictService.findBaseDictByTypeCode(SEX_TYPE);
        List<BaseDict> levelType=baseDictService.findBaseDictByTypeCode(LEVEL_TYPE);

        model.addAttribute("sexType", sexType);
        model.addAttribute("industryType", industryType);
        model.addAttribute("levelType", levelType);


        return "customer_search";//跳转至搜索页面
    }

    //执行搜索操作
   @RequestMapping(value = "/searchDo.do")
   public String Search( @RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "8")Integer rows, String custSex,String custName, String custIndustry, String custLevel,Model model){
       Page<Customer> customers=customerService.findCustomerList(page,rows, custName,custSex,custIndustry,custLevel);

       model.addAttribute("page",customers);

       List<BaseDict> sexType=baseDictService.findBaseDictByTypeCode(SEX_TYPE);
       List<BaseDict> industryType=baseDictService.findBaseDictByTypeCode(INDUSTRY_TYPE);
       List<BaseDict> levelType=baseDictService.findBaseDictByTypeCode(LEVEL_TYPE);

       model.addAttribute("sexType", sexType);
       model.addAttribute("industryType", industryType);
       model.addAttribute("levelType", levelType);

       model.addAttribute("custName", custName);
       model.addAttribute("custSex",custSex);
       model.addAttribute("custIndustry", custIndustry);
       model.addAttribute("custLevel", custLevel);
       return "customer_search";
   }

   //会员列表显示集合
   @RequestMapping(value = "/vipList.do")
   public String toVipList(@RequestParam(defaultValue = "1") Integer page,
                        @RequestParam(defaultValue = "6") Integer rows,
                        String custName,String custSex,
                        String custIndustry, String custLevel,
                        Customer customer, Model model){


       Page<Customer> customers;
       customers = customerService.findVipList(page,rows,custName,custSex,custIndustry,custLevel);

       model.addAttribute("page",customers);

       List<BaseDict> industryType=baseDictService.findBaseDictByTypeCode(INDUSTRY_TYPE);
       List<BaseDict> sexType=baseDictService.findBaseDictByTypeCode(SEX_TYPE);
       List<BaseDict> levelType=baseDictService.findBaseDictByTypeCode(LEVEL_TYPE);

       //查询的会员总数；
       Integer count=customerService.selectVipListCount(customer);
       model.addAttribute("count",count);


       model.addAttribute("sexType", sexType);
       model.addAttribute("industryType", industryType);
       model.addAttribute("levelType", levelType);

       model.addAttribute("custName", custName);
       model.addAttribute("custSex", custSex);
       model.addAttribute("custIndustry", custIndustry);
       model.addAttribute("custLevel", custLevel);
       return "vip_list";
   }

    //添加
    @RequestMapping(value = "/create.do")
    @ResponseBody
    public String customerCreate(Customer customer,HttpSession session) {
        // 获取Session中的当前用户信息
        User user = (User) session.getAttribute("USER_SESSION");
        // 将当前用户id存储在客户对象中
        customer.setCust_create_id(user.getUser_id());
        // 创建Date对象
        Date date = new Date();
        // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
        Timestamp timeStamp = new Timestamp(date.getTime());
        customer.setCust_createtime(timeStamp);


        // 执行Service层中的创建方法，返回的是受影响的行数
        int rows = customerService.createCustomer(customer);
        if(rows>0){
            return "OK";
        }else{
            return "FAIL";
        }
    }
   //删除客户
    @RequestMapping(value = "/delete.do")
    @ResponseBody
    public String customerDelete(Integer id){
         int rows=customerService.deleteCustomer(id);
         if (rows>0){
             return "OK";
         }else {
             return "FAIL";
         }
    }

    //获取客户id值
    @RequestMapping(value = "/getCustomerById.do")
    @ResponseBody
    public Customer getCustomerById(Integer id){
        Customer customer = customerService.getCustomerById(id);
        return customer;
    }
    //执行修改客户
    @RequestMapping(value ="/update.do")
    @ResponseBody
    public String customerUpdate(Customer customer){
        int rows=customerService.updateCustomer(customer);
        if (rows>0){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    //批量删除
    @RequestMapping(value = "/deleteCustomers.do")
    public String  customerDeletes(int[] check_value){
        if (check_value == null ) {
            return "redirect:list.do";
        }
        //直接传数组
         customerService.deleteCustomers(check_value);
        // 重定向
         return "redirect:list.do";

    }
}
