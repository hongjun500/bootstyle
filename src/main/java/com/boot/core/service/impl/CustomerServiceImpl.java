package com.boot.core.service.impl;

import com.boot.common.util.Page;
import com.boot.core.dao.CustomerDao;
import com.boot.core.pojo.Customer;
import com.boot.core.service.CustomerService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Service(value = "customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService{
//    注入customerDao
    @Autowired
    private CustomerDao customerDao;

    public Page<Customer> findCustomerList(Integer page,Integer rows,String custName, String custSex, String custIndustry, String custLevel){
        Customer customer=new Customer();
        if(StringUtils.isNotBlank(custName)){
            customer.setCust_name(custName);
        }
        if (StringUtils.isNotBlank(custSex)){
            customer.setCust_sex(custSex);
        }
        if(StringUtils.isNotBlank(custIndustry)){
            customer.setCust_industry(custIndustry);
        }
        if(StringUtils.isNotBlank(custLevel)){
            customer.setCust_level(custLevel);
        }

        //当前页
        customer.setStart((page-1) * rows);

        // 每页数
        customer.setRows(rows);

        List<Customer> customers=customerDao.selectCustomerList(customer);
        // 查询客户列表总记录数
        Integer count = customerDao.selectCustomerListCount(customer);
        // 创建Page返回对象
        Page<Customer> result = new Page<>();
        result.setPage(page);
        result.setRows(customers);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    @Override
    public Page<Customer> findVipList(Integer page, Integer rows, String custName, String custSex, String custIndustry, String custLevel) {
        Customer customer=new Customer();
        if(StringUtils.isNotBlank(custName)){
            customer.setCust_name(custName);
        }
        if (StringUtils.isNotBlank(custSex)){
            customer.setCust_sex(custSex);
        }
        if(StringUtils.isNotBlank(custIndustry)){
            customer.setCust_industry(custIndustry);
        }
        if(StringUtils.isNotBlank(custLevel)){
            customer.setCust_level(custLevel);
        }

        //当前页
        customer.setStart((page-1) * rows);

        // 每页数
        customer.setRows(rows);

        List<Customer> customers=customerDao.selectVipList(customer);
        // 查询vip客户列表总记录数
        Integer count = customerDao.selectVipListCount(customer);

        // 创建Page返回对象
        Page<Customer> result = new Page<>();
        result.setPage(page);
        result.setRows(customers);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    //查询客户总数
    @Override
    public Integer selectCustomerListCount(Customer customer) {
        return customerDao.selectCustomerListCount(customer);

    }

    @Override
    public Integer selectVipListCount(Customer customer){
        return customerDao.selectVipListCount(customer);
    }

    //添加客户
    @Override
    public int createCustomer(Customer customer) {

        return customerDao.createCustomer(customer);
    }
   //删除客户
    @Override
    public int deleteCustomer(Integer id){
        return customerDao.deleteCustomer(id);
    }

    //获取客户ID
    @Override
    public Customer getCustomerById(Integer id) {
        Customer customer=customerDao.getCustomerById(id);
        return customer;
    }
    //修改客户
    @Override
    public int updateCustomer(Customer customer){
        return customerDao.updateCustomer(customer);
    }

    //批量删除
    @Override
    public int deleteCustomers(int[] id_arr) {
        return customerDao.deleteCustomers(id_arr);
    }

}
