package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.service.FilmActorService;
import com.example.sakila.vo.FilmActor;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class FilmActorController {
	
	@Autowired FilmActorService filmActorService;
	
	@PostMapping("/on/addFilmByActor")
	public String addFilmByActor(Model model, FilmActor filmActor) {
		
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		
		boolean exists = filmActorService.isFilmActorExists(filmActor);
	    if (exists) {
	        // 이미 존재하는 관계라면 리다이렉트하거나 알림 메시지를 처리
	        log.debug("The film-actor relationship already exists.");
	        model.addAttribute("existsMsg", "이미 존재하는 Film 입니다");
	        return "on/actorOne?actorId=" + filmActor.getActorId();
	    }
	    // 중복되지 않으면 관계 추가
	    int addFilmRow = filmActorService.addFilmActor(filmActor);
	    
	    if (addFilmRow != 1) {
	    	return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	    }
		
		
		return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	}
	
	@GetMapping("/on/removeFilmActor")
	public String removeFilmActor(FilmActor filmActor) {
		
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		
		int removeFilmRow = filmActorService.removeFilmActor(filmActor);
		
		return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	}
	
	
}
