package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.staffMapper;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	@Autowired private staffMapper staffMapper;
	
	// Login Form
	@GetMapping("/off/login")
	public String login() {
		log.debug("RUN : /off/login");
		return "off/login";
	}
	
	// Login Action
	@PostMapping("/off/login")
	public String login(Model model, HttpSession session,
						@RequestParam(name ="staffId") int staffId,
						@RequestParam(name = "password") String password) {
						// int staffId = Integer.parseInt(request.getParameter("staffId"));
						// String password = request.getParameter("password");
		
		Staff paramStaff = new Staff();
		paramStaff.setStaffId(staffId);
		paramStaff.setPassword(password);
		
		Staff loginStaff = staffMapper.loginStaff(paramStaff);
		if(loginStaff == null) {
			log.debug("로그인 실패!");
			model.addAttribute("loginMsg", "로그인 실패!");
			return "off/login";
		}
		
		session.setAttribute("loginStaff", loginStaff);
		log.debug("로그인 성공!, Session loginStaff 속성 추가");
		
		return "redirect:/on/sakilaMain";
	}
	

}
