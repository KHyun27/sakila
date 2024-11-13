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
	
	// redirect:/on/actorOne : actorOne에서 filmActor 추가 구현
	@PostMapping("/on/addFilmActorByActor")
	public String addFilmByActorByActor(Model model, FilmActor filmActor, RedirectAttributes redirectAttributes) {
	    
	    log.debug("filmId : " + filmActor.getFilmId());
	    log.debug("actorId : " + filmActor.getActorId());
	    
	    boolean isExists = filmActorService.isFilmActorExists(filmActor);
	    if (isExists) {
	        // 이미 존재하는 Film이라면 리다이렉트하면서 메시지를 전달
	        redirectAttributes.addFlashAttribute("addFilmActorMsg", "등록된 Film 입니다");
	        return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	    }
	    
	    // 중복되지 않으면 관계 추가
	    int addFilmRow = filmActorService.addFilmActor(filmActor);
	    if (addFilmRow == 0) {
	        redirectAttributes.addFlashAttribute("addFilmActorMsg", "Film 등록 실패!");
	        return "redirect:/on/filmOne?filmId=" + filmActor.getFilmId();
	    }
	    
	    return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	}
	
	// redirect:/on/filmOne : filmOne에서 filmActor 추가 구현
	@PostMapping("/on/addFilmActorByFilm")
	public String addFilmActorByFilm(Model model, FilmActor filmActor, RedirectAttributes redirectAttributes) {
	    
	    log.debug("filmId : " + filmActor.getFilmId());
	    log.debug("actorId : " + filmActor.getActorId());
	    
	    boolean isExists = filmActorService.isFilmActorExists(filmActor);
	    if (isExists) {
	        // 이미 존재하는 Actor라면 리다이렉트하면서 메시지를 전달
	        redirectAttributes.addFlashAttribute("addFilmActorMsg", "등록된 Actor 입니다");
	        return "redirect:/on/filmOne?filmId=" + filmActor.getFilmId();
	    }
	    
	    // 중복되지 않으면 관계 추가
	    int addActorRow = filmActorService.addFilmActor(filmActor);
	    if (addActorRow == 0) {
	        redirectAttributes.addFlashAttribute("addFilmActorMsg", "Actor 등록 실패!");
	        return "redirect:/on/filmOne?filmId=" + filmActor.getFilmId();
	    }
	    
	    return "redirect:/on/filmOne?filmId=" + filmActor.getFilmId();
	}
	
	// actorOne에서 삭제요청
	@GetMapping("/on/removeFilmActorByActor")
	public String removeFilmActorByActor(FilmActor filmActor) {
		
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		
		int removeFilmActorByActorRow = filmActorService.removeFilmActor(filmActor);
		
		return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	}
	
	// filmOne에서 삭제요청
	@GetMapping("/on/removeFilmActorByFilm")
	public String removeFilmActorByFilm(FilmActor filmActor) {
		
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		
		int removeFilmActorByFilmRow = filmActorService.removeFilmActor(filmActor);
		
		return "redirect:/on/filmOne?filmId=" + filmActor.getFilmId();
	}
	
	
}
