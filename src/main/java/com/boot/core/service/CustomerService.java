package com.boot.core.service;

import com.boot.common.util.Page;
import com.boot.core.pojo.Customer;

public interface CustomerService {

//   查询客户的集合
    public Page<Customer> findCustomerList(Integer page, Integer rows,
                                           String custName, String custSex,
                                           String custIndustry, String custLevel);
//    查询客户总数
    public Integer selectCustomerListCount(Customer customer);
    //添加客户
    public int createCustomer(Customer customer);

    //删除客户
    public int deleteCustomer(Integer id);

    //修改客户，先获取id
    public Customer getCustomerById(Integer id);
    public int updateCustomer(Customer customer);

    //批量删除客户
    public  int deleteCustomers(int[] id_arr);

}
