package com.example.sakila.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmCategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.Film;
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
	@Autowired InventoryService inventoryService;
	@Autowired FilmCategoryService filmCategoryService;
	
	@GetMapping("/on/filmOne")
	public String filmOne(Model model, @RequestParam Integer filmId, @RequestParam(required = false) String searchName) {
		
		// 1) 현재 필름
		Map<String, Object> film = filmService.getFilmOne(filmId);
		log.debug("film : " + film.toString()); // debug
		
		// 2) 전체 카테고리 리스트
		List<Category> allCategoryList = categoryService.getCategoryList();
		log.debug("allCategoryList : " + allCategoryList.toString()); // debug
		
		// 3) 현재 필름의 카테고리
		List<Map<String, Object>> filmCategoryList = filmCategoryService.getFilmCategoryListByFilm(filmId);
		log.debug("filmCategoryList : " + filmCategoryList.toString()); // debug
		
		// 4) 검색 배우 리스트(searchName이 null이 아닐때만)
		if(searchName != null) { // 검색이가 null이 아니라면
			List<Actor> searchActorList = actorService.getActorListByActor(searchName);
			log.debug("searchActorList : " + searchActorList.toString()); // debug
			model.addAttribute("searchActorList", searchActorList); // 4)
		}
		
		// 5) 현재필름의 배우 리스트
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		log.debug("actorList : " + actorList.toString()); // debug
		
		
		model.addAttribute("film", film); // 1)
		model.addAttribute("allCategoryList", allCategoryList); // 2)
		model.addAttribute("filmCategoryList", filmCategoryList); // 3)
		model.addAttribute("actorList", actorList); // 5)
		
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
	

	@GetMapping("/on/removeFilm")
	public String removeFilm(@RequestParam Integer filmId, RedirectAttributes redirectAttributes) {
		
		Integer inventoryCount = inventoryService.getCountInventoryByFilm(filmId);
		if(inventoryCount != 0) {
			redirectAttributes.addFlashAttribute("removeFilmMsg", "Film이 Inventory에 존재합니다.");
			return "redirect:/on/filmOne?filmId=" + filmId; 
		}
		
		filmService.removeFilmByKey(filmId);
				
		return "redirect:/on/filmList";
	}
	
	@GetMapping("/on/modifyFilm")
	public String modifyFilm(Model model, @RequestParam int filmId) {
		Map<String, Object> film = filmService.getFilmOne(filmId);
		List<Language> languageList = languageService.getLanguageList();
		// log.debug("film : " + film.toString());
		if(film.get("specialFeatures") != null) {
			// debug
			log.debug("specialFeatures : "+ film.get("specialFeatures"));
			
			String specialFeatures = (String)film.get("specialFeatures");
			List<String> specialFeaturesList = Arrays.asList(specialFeatures.split(","));
			
			model.addAttribute("specialFeaturesList", specialFeaturesList);
		}
		
		model.addAttribute("film", film);
		model.addAttribute("languageList", languageList);
		return "on/modifyFilm";
	}
	
	@PostMapping("/on/modifyFilm")
	public String modifyActor(Film film) {
		log.debug(film.toString());
		int modifyFilmRow = filmService.modifyFilm(film);
		return "redirect:/on/filmOne?filmId=" + film.getFilmId();
	}
	
	

}
