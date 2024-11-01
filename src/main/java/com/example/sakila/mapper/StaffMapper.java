package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	
	// /off/login.jsp
	Staff loginStaff(Staff staff);
	
	// /on/staffOne.jsp
	Staff selectStaffOne(int staffId);

}
