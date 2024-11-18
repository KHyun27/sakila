package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CustomerMapper;
import com.example.sakila.vo.Customer;

@Service
@Transactional
public class CustomerService {
	
	@Autowired CustomerMapper customerMapper;
	
	public Integer addCustomer(Customer customer) {
		return customerMapper.insertCustomer(customer);
	}
	
	public Map<String, Object> getCustomerList(Integer currentPage, Integer rowPerPage, String searchWord) {
		Integer beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		// 한 페이지 당 페이징 갯수는 10개씩이라고 가정
		Integer numPerPage = 10;
		// 페이징 첫 번째 페이지 넘버
		Integer startPagingNum = (currentPage - 1) / 10 * 10 + 1;
		// 페이징 마지막 페이지 넘버
		Integer endPagingNum = startPagingNum + (numPerPage - 1);
		// 현재 페이지가 95이면 91 ~ 100 출력인데 마지막 페이지가 98이면 91~98까지 출력해야 한다.
		Integer lastPage = this.getLastPageBySearchWord(rowPerPage, searchWord);
		if(lastPage < endPagingNum) {
			endPagingNum = lastPage;
		}

		List<Customer> customerList = customerMapper.selectCustomerList(paramMap);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("startPagingNum", startPagingNum);
		resultMap.put("endPagingNum", endPagingNum);
		resultMap.put("customerList", customerList);
		resultMap.put("lastPage", lastPage);
		
		return resultMap;
	}
	
	// customerList의 LastPage
	public Integer getLastPageBySearchWord(Integer rowPerPage, String searchWord) {
		int count = customerMapper.selectCustomerCount(searchWord);
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
		
}
