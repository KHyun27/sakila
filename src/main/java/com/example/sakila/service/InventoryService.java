package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.vo.Inventory;

@Service
@Transactional
public class InventoryService {
	
	@Autowired InventoryMapper inventoryMapper;
	
	public Integer getCountInventoryByFilm(Integer filmId) {
		return inventoryMapper.selectCountInventoryByFilm(filmId);
	}
	
	public List<Map<String, Object>> getInventoryListByStore(Integer storeId, Integer currentPage, Integer rowPerPage) {
		Map<String, Object> paramMap = new HashMap<>();
		
		int beginRow = (currentPage - 1) * rowPerPage;
		
		paramMap.put("storeId", storeId);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		return inventoryMapper.selectInventoryListByStore(paramMap);
	}
	
	public Integer addInventory(Inventory inventory) {
		return inventoryMapper.insertInventory(inventory);
	}
	
	public Integer removeInventoryByKey(Integer inventoryId) {
		return inventoryMapper.deleteInventoryByKey(inventoryId);
	}
	
	public Map<String, Object> getFilmName(Integer inventoryId) {
		return inventoryMapper.selectFilmByInventoryId(inventoryId);
	}
}
