package com.example.sakila.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	
	// /off/login.jsp
	Staff loginStaff(Staff staff);
	
	// /on/staffOne.jsp
	Map<String, Object> selectStaffOne(int staffId);

}
