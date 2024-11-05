package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class ActorController {
	
	@Autowired ActorService actorService;
	
	@GetMapping("/on/addActor")
	public String addActor() {
		return "on/addActor";
	}
	
	@PostMapping("/on/addActor")
	public String addActor(ActorForm actorForm, HttpSession session) { // input type = "file"
		/*
		log.debug("actorForm.getFirstName() : " + actorForm.getFirstName());
		log.debug("actorForm.getLastName() : " + actorForm.getLastName());
		log.debug("actorForm.getActorFile() : " + actorForm.getActorFile());
		if(actorForm.getActorFile() != null) {
			log.debug("actorForm.getActorFile().size() : " + actorForm.getActorFile().size());
		}
		*/
		String path = session.getServletContext().getRealPath("/upload/");
		actorService.addActor(actorForm, path);
		
		return "redirect:/on/actorList";
	}
	
	@GetMapping("/on/actorList")
	public String actorList(@RequestParam(defaultValue = "1") int currentPage,
							@RequestParam(defaultValue = "10") int rowPerPage) {
		
		return "on/actorList";
	}
	
	
	

}
