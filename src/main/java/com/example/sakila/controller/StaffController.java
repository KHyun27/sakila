package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.AddressMapper;
import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Staff;
import com.example.sakila.vo.Store;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StaffController {
	
	@Autowired StaffMapper staffMapper;
	@Autowired StoreMapper storeMapper;
	@Autowired AddressMapper addressMapper;
	
	@GetMapping("/on/staffOne")
	public String staffOne(Model model, HttpSession session) {
		
		int staffId = ((Staff)(session.getAttribute("loginStaff"))).getStaffId();
		Map<String, Object> staff = staffMapper.selectStaffOne(staffId);
		model.addAttribute("staff", staff);
		log.debug(staff.toString());
		
		return "on/staffOne";
	}
	
	// addStaff Form : leftMenu.a태그, addStaff.jsp.주소검색(searchAddress)
	@GetMapping("/on/addStaff")
	public String addStaff(Model model, @RequestParam(defaultValue = "") String searchAddress) {
		log.debug("searchAddress : " + searchAddress);
		
		// model(storeList)
		List<Map<String, Object>> storeList = storeMapper.selectStoreList();
		model.addAttribute("storeList", storeList);
		// log.debug("storeList : " + storeList.toString());
		// model(addressList) ← 검색 후 searchAddress가 공백이 아니면
		if(!searchAddress.equals("")) { // searchAddress.equals("") == false
			List<Address> addressList = addressMapper.selectAddressListByWord(searchAddress);
			log.debug(addressList.toString());
			model.addAttribute("addressList", addressList);
		}
		return "on/addStaff";
	}
	
	// addStaff Action
	@PostMapping("/on/addStaff")
	public String addStaff(Staff staff) { // 커맨드 객체 생성 → 커맨드객체.set(request.getParameter()) : 필드 값을 분해
		// insert 호출
		log.debug(staff.toString());
		int addStaffRow = staffMapper.insertStaff(staff);
		log.debug("addStaffRow : " + addStaffRow);
		if(addStaffRow == 0) { // 입력 실패 시 입력페이지로 포워딩
			return "on/addStaff";
		}
		return "redirect:/on/staffList";
	}
	
	// staffList Form
	@GetMapping("/on/staffList")
	public String staffList(Model model, @RequestParam(defaultValue = "1") int currentPage, 
										 @RequestParam(defaultValue = "2") int rowPerPage) { // defaultValue : currentPage가 null로 들어오면 1로 처리
		// model(staffList)
		Map<String, Object> map = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		log.debug(map.toString());
		
		List<Staff> staffList = staffMapper.selectStaffList(map);
		log.debug(staffList.toString());
		
		int count = staffMapper.selectStaffCount();
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage++;
		}
		
		model.addAttribute("staffList", staffList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		return "on/staffList";
	}
	
	// Staff Active 수정
	@GetMapping("modifyStaffActive")
	public String modifyStaffActive(Staff staff, @RequestParam(defaultValue = "1") int currentPage) {
		if (staff.getActive() == 1) {
			staff.setActive(2);
		} else {
			staff.setActive(1);
		}
		int modifyActiveRow = staffMapper.updateStaff(staff); // 어떤 컬럼값을 수정하든 mapper 메서드는 하나다!
		return "redirect:/on/staffList?currentPage=" + currentPage;
	}
	
	
	

}
