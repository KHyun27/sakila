package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.sakila.service.FilmActorService;
import com.example.sakila.vo.FilmActor;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class FilmActorController {
	
	@Autowired FilmActorService filmActorService;
	
	@PostMapping("/on/addFilmByActor")
	public String addFilmByActor(Model model, FilmActor filmActor, RedirectAttributes redirectAttributes) {
	    
	    log.debug("filmId : " + filmActor.getFilmId());
	    log.debug("actorId : " + filmActor.getActorId());
	    
	    boolean exists = filmActorService.isFilmActorExists(filmActor);
	    if (exists) {
	        // 이미 존재하는 관계라면 리다이렉트하면서 메시지를 전달
	        redirectAttributes.addFlashAttribute("existsMsg", "이미 등록된 Film 입니다");
	        return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	    }
	    // 중복되지 않으면 관계 추가
	    int addFilmRow = filmActorService.addFilmActor(filmActor);
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
