package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.CustomerService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.service.RentalService;
import com.example.sakila.service.StoreService;
import com.example.sakila.util.TeamColor;
import com.example.sakila.vo.Customer;
import com.example.sakila.vo.Rental;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RentalController {
	
	@Autowired RentalService rentalService;
	@Autowired CustomerService customerService;
	@Autowired InventoryService inventoryService;
	@Autowired StoreService storeService;
	
	@GetMapping("/on/addRental")
	public String addRental(Model model, 
							@RequestParam Integer inventoryId,
							@RequestParam(required = false) String searchName) {
		
		log.debug(TeamColor.G +"searchName : " + searchName + TeamColor.RESET);
		log.debug(TeamColor.B +"inventoryId : " + inventoryId + TeamColor.RESET);
		if(searchName != null && !searchName.equals("")) {
			// CustomerService 호출
			List<Customer> customerList = customerService.getCustomerListByName(searchName);
			model.addAttribute("customerList", customerList);
			log.debug("customerList : " + customerList.toString());
		}
		
		// 인벤토리 추가할때 film title 조회
		Map<String, Object> rentalFilm = inventoryService.getFilmName(inventoryId);
		log.debug(TeamColor.B +"rentalFilm : " + rentalFilm + TeamColor.RESET);
		// 인벤토리 추가할때 store manager name 조회
		String staffName = storeService.getStaffName(inventoryId);
		log.debug(TeamColor.B +"staffName : " + staffName + TeamColor.RESET);
		
		model.addAttribute("rentalFilm", rentalFilm);
		model.addAttribute("staffName", staffName);
		model.addAttribute("inventoryId", inventoryId);
		return "on/addRental";
	}
	
	@PostMapping("/on/addRental")
	public String addRental(Rental rental) {
		
		Integer addRentalRow = rentalService.addRental(rental);
		
		return "redirect:/on/customerOne?customerId=" + rental.getCustomerId();
	}
	

}
