package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Store;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	
	@Autowired StoreService storeService;
	
	@GetMapping("/on/storeList")
	public String storeList(Model model) {
		List<Map<String, Object>> storeList = storeService.getStoreList();
		
		// debug
		log.debug("storeList : " + storeList);
		model.addAttribute("storeList", storeList);
		
		return "on/storeList";
	}
	
	@GetMapping("/on/addStore")
	public String addStore() {
		return "on/addStore";
	}
	
	@PostMapping("/on/addStore")
	public String addStore(Store store) {
		return "redirect:/on/storeList";
	}

}
