package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String addActor(Model model, ActorForm actorForm, HttpSession session) { // input type = "file"
		/*
		log.debug("actorForm.getFirstName() : " + actorForm.getFirstName());
		log.debug("actorForm.getLastName() : " + actorForm.getLastName());
		log.debug("actorForm.getActorFile() : " + actorForm.getActorFile());
		if(actorForm.getActorFile() != null) {
			log.debug("actorForm.getActorFile().size() : " + actorForm.getActorFile().size());
		}
		*/
		List<MultipartFile> list = actorForm.getActorFile();
		for(MultipartFile f : list) { // 이미지파일은 *.jpg or *png만 가능
			if(!(f.getContentType().equals("image/jpeg") || f.getContentType().equals("image/png"))) {
				model.addAttribute("msg", "이미지 파일만 입력이 가능합니다");
				return "on/addActor";
			}
		}
		
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
	public String actorOne(Model model, @RequestParam int actorId, @RequestParam(defaultValue = "") String searchTitle) {
		// searchWord = "" 이면 actorOne 상세보기 요청이고, "" 아니면 film 검색 요청
		Actor actor = actorService.getActorOne(actorId);
		List<ActorFile> actorFileList = actorFileService.selectActorFileListByActor(actorId);
		List<Film> filmList = filmService.selectFileTitleListByActor(actorId);
		
		log.debug(actor.toString());
		log.debug(actorFileList.toString());
		log.debug(filmList.toString());
		
		if(!searchTitle.equals("")) { // Film title 검색어가 있다면..
			// film 검색결과 리스트를 추가
			List<Film> searchFilmList = filmService.getFilmListByTitle(searchTitle);
			model.addAttribute("searchFilmList", searchFilmList);
		}
		
		model.addAttribute("actor", actor);
		model.addAttribute("actorFileList", actorFileList);
		model.addAttribute("filmList", filmList);
		
		return "on/actorOne";
	}
	
	@GetMapping("/on/modifyActor")
	public String modifyActor(Model model, int actorId) {
		log.debug("actorId : " + actorId);
		model.addAttribute("actorId", actorId);
		return "on/modifyActor";
	}
	
	@PostMapping("/on/modifyActor")
	public String modifyActor(Actor actor) {
		int modifyActorRow = actorService.modifyActor(actor);
		return "redirect:/on/actorOne?actorId=" + actor.getActorId();
	}
	
	
	
	

}
