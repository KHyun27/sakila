package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.Inventory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InventoryController {
	
	@Autowired InventoryService inventoryService;
	@Autowired FilmService filmSerivice;
	
	@GetMapping("/on/inventoryList")
	public String inventoryList(Model model, @RequestParam Integer storeId, 
								@RequestParam(defaultValue = "1") Integer currentPage, 
								@RequestParam(defaultValue = "15") Integer rowPerPage) {
		
		List<Map<String, Object>> inventoryList = inventoryService.getInventoryListByStore(storeId, currentPage, rowPerPage);
		// log.debug("inventoryList : " + inventoryList.toString()); // debug
		model.addAttribute("inventoryList", inventoryList);
		model.addAttribute("storeId", storeId);
		
		return "on/inventoryList";
	}
	
	@GetMapping("/on/addInventory")
	public String addInventory(Model model, @RequestParam Integer storeId, @RequestParam(required = false) String searchTitle) {
		
		// btnSearchTitle 으로 요청 시
		if(searchTitle != null && !searchTitle.equals("")) {
			// 영화 검색 목록 모델에 추가
			log.debug("searchTitle : " + searchTitle);
			List<Film> filmList = filmSerivice.getFilmListByTitle(searchTitle);
			model.addAttribute("filmList", filmList);
		}
		
		model.addAttribute("storeId", storeId);
		model.addAttribute("searchTitle", searchTitle);
		
		return "on/addInventory";
	}
	
	@PostMapping("/on/addInventory")
	public String addInventory(Inventory inventory) {
		
		int insertInventoryRow = inventoryService.addInventory(inventory);
		
		return "redirect:/on/inventoryList?storeId=" + inventory.getStoreId();
	}
	
	@GetMapping("/on/removeInventoryByKey")
	public String removeInventoryByKey(Inventory inventory) {
		int removeInventoryRow = inventoryService.removeInventoryByKey(inventory.getInventoryId());
		return "redirect:/on/inventoryList?storeId=" + inventory.getStoreId();
	}
	
	

}
