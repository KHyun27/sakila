package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Customer;

@Mapper
public interface CustomerMapper {
	
	// /on/addCustomer
	Integer insertCustomer(Customer customer);
	
	// /on/customerList
	List<Customer> selectCustomerList(Map<String, Object> paramMap);
	
	// /on/customerList
	Integer selectCustomerCount(String searchWord);
	
	// /on/addRental
	List<Customer> selectCustomerListByName(String searchName);

}
