package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	
	// /off/login.jsp
	Staff loginStaff(Staff staff);
	
	// /on/staffOne.jsp
	Map<String, Object> selectStaffOne(int staffId);
	
	// on/addStaff.jsp
	int insertStaff(Staff staff);
	
	// on/staffList.jsp
	List<Staff> selectStaffList(Map<String, Object> map);
	
	// on/staffList.jsp
	int selectStaffCount();
	
	// on/staffList.jsp - 업데이트문 하나로 모든 컬럼을 개별수정 가능하게
	int updateStaff(Staff staff);
}
