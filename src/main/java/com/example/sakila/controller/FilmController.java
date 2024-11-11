package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class FilmController {
	
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	@Autowired LanguageService languageService;
	@Autowired CategoryService categoryService;
	
	@GetMapping("/on/filmOne")
	public String filmOne(Model model, @RequestParam int filmId) {
		Map<String, Object> film = filmService.getFilmOne(filmId);
		// debug
		log.debug("film : " + film.toString());
		model.addAttribute("film", film);
		
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		model.addAttribute("actorList", actorList);
		
		return "on/filmOne";
	}
	
	// /on/filmOne → /on/addFilm
	@GetMapping("/on/addFilm")
	public String addFilm(Model model) {
		// languageList
		List<Language> languageList = languageService.getLanguageList();
		// debug
		log.debug(languageList.toString());
		model.addAttribute("languageList", languageList);
		return "on/addFilm";
	}
	
	@PostMapping("/on/addFilm")
	public String addFilm(FilmForm filmForm) {
		// debug
		log.debug(filmForm.toString());
		// filmService : FilmForm → Film
		filmService.addFilm(filmForm);
		return "redirect:/on/filmList";
	}
	
	// /on/filmList
	@GetMapping("/on/filmList")
	public String filmList(Model model, @RequestParam(required = false) Integer categoryId, 
						   @RequestParam(defaultValue = "1") int currentPage,
						   @RequestParam(defaultValue = "10") int rowPerPage) {
		// debug
		log.debug("categoryId : " + categoryId);
		log.debug("currentPage : " + currentPage);
		log.debug("rowPerPage : " + rowPerPage);
		
		// film 전체 리스트
		List<Map<String, Object>> filmList = filmService.getFilmList(currentPage, rowPerPage, categoryId);
		// debug
		log.debug("All filmList : " + filmList);
		model.addAttribute("filmList", filmList);
		
		// Model에 category List 추가
		List<Category> categoryList = categoryService.getCategoryList();
		// debug
		log.debug("categoryList : " + categoryList);
		model.addAttribute("categoryList", categoryList);
		
		int lastPage = filmService.getLastPageByFilmList(rowPerPage, categoryId);
		
		// 같이 넘겨야할 모델값 현재페이지, 현재 카테고리ID
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("currentCategoryId", categoryId);
		
		return "on/filmList";
	}
	
	

}
