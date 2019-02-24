package com.boot.core.dao;

import com.boot.core.pojo.Customer;

import java.util.List;

public interface CustomerDao {
    //客户列表
    public List<Customer> selectCustomerList(Customer customer);


    // 客户总数
    public Integer selectCustomerListCount(Customer customer);

    //添加客户
     public int createCustomer(Customer customer);

     //删除客户
     public int deleteCustomer(Integer id);

     //修改客户(先获取其ID)
     public Customer getCustomerById(Integer id);
     public int updateCustomer(Customer customer);

     //批量删除客户
     public int deleteCustomers(int[] id_arr);
}
