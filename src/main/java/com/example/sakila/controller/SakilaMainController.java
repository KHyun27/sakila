package com.example.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SakilaMainController {
	
	@GetMapping("/on/sakilaMain")
	public String sakilaMain() {
		
		log.debug("RUN : /on/sakilaMain");
		
		return "on/sakilaMain";
	}
	

}
