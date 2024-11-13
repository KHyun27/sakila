package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InventoryMapper {
	
	// /on/removeFilm : Film삭제 시 Inventory가 있는지 확인
	Integer selectCountInventoryByFilm(Integer filmId);
	
	// /on/inventoryList : storeId 별 inventoryList 조회
	List<Map<String, Object>> selectInventoryListByStore(Map<String, Object> paramMap);
	
}
