package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.AddressService;
import com.example.sakila.service.CustomerService;
import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Customer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController { 
	
	@Autowired CustomerService customerService;
	@Autowired StoreService storeService;
	@Autowired AddressService addressService;
	
	@GetMapping("/on/addCustomer")
	public String addCustomer(Model model, @RequestParam(required = false) String searchAddress) {
		
		// storeList
		List<Map<String, Object>> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		// addressList ← searchAddress != null
		if(searchAddress != null && !searchAddress.equals("")) {
			List<Address> addressList = addressService.getAddressListByWord(searchAddress);
			model.addAttribute("addressList", addressList);
		}
		
		return "on/addCustomer";
	}
	
	@PostMapping("/on/addCustomer")
	public String addCustomer(Customer customer) {
		
		// 고객 추가
		Integer insertCustomerRow = customerService.addCustomer(customer);  
		if(insertCustomerRow == 0) {
			return "redirect:/on/addCustomer";
		}
		// 전체리스트, 지점별 리스트
		
		log.debug("customer : " + customer.toString());
		
		return "redirect:/on/customerList";
	}
	
	@GetMapping("/on/customerList")
	public String customerList(Model model, @RequestParam(defaultValue = "1") Integer currentPage, 
											@RequestParam(defaultValue = "10") Integer rowPerPage, 
											@RequestParam(required = false) String searchWord) {
		
		Map<String, Object> resultMap = customerService.getCustomerList(currentPage, rowPerPage, searchWord);
		
		model.addAttribute("currentPage", currentPage);
		// 가독성을 위해서 resultMap 풀어서 .. 
		model.addAttribute("startPagingNum", resultMap.get("startPagingNum"));
		model.addAttribute("endPagingNum", resultMap.get("endPagingNum"));
		model.addAttribute("customerList", resultMap.get("customerList"));
		model.addAttribute("lastPage", resultMap.get("lastPage"));
		
		return "on/customerList";
	}
	
	
	

}
