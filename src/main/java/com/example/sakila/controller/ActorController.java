package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorFileService;
import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;
import com.example.sakila.vo.Film;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class ActorController {
	
	@Autowired ActorService actorService;
	@Autowired ActorFileService actorFileService;
	@Autowired FilmService filmService;
	
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
	public String actorList(Model model,
							@RequestParam(defaultValue = "1") int currentPage,
							@RequestParam(defaultValue = "10") int rowPerPage,
							@RequestParam(required = false) String searchWord) {
		
		log.debug("searchWord : " + searchWord);
		
		// int lastPage = actorService.getTotalCount(rowPerPage, searchWord);
		List<Actor> actorList = actorService.getActorList(currentPage, rowPerPage, searchWord);
		
		int lastPage = actorService.getLastPageBySearchWord(rowPerPage, searchWord);
		
		model.addAttribute("actorList", actorList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		
		log.debug("currentPage : " + currentPage);
		log.debug("lastPage : " + lastPage);
		
		return "on/actorList";
	}
	
	@GetMapping("/on/actorOne")
	public String actorOne(Model model, @RequestParam int actorId) {
		Actor actor = actorService.getActorOne(actorId);
		List<ActorFile> actorFileList = actorFileService.selectActorFileListByActor(actorId);
		List<Film> filmList = filmService.selectFileTitleListByActor(actorId);
		
		log.debug(actor.toString());
		log.debug(actorFileList.toString());
		log.debug(filmList.toString());
		
		model.addAttribute("actor", actor);
		model.addAttribute("actorFileList", actorFileList);
		model.addAttribute("filmList", filmList);
		return "on/actorOne";
	}
	
	

}
