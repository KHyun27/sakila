package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreMapper {
	
	List<Map<String, Object>> selectStoreList();
	
	// /on/addRental → store staff name 조회 (inventory + store + staff join 발생)
	String selectStoreStaff(Integer inventoryId);

}
