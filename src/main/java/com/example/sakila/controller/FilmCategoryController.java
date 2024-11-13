package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.service.FilmCategoryService;
import com.example.sakila.vo.FilmCategory;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Slf4j
@Controller
public class FilmCategoryController {
	
	@Autowired FilmCategoryService filmCategoryService;
	
	// Film에 Cateogry 추가
	@PostMapping("/on/addFilmCategory")
	public String addFilmCategory(FilmCategory filmCategory) {
		
		log.debug("filmCategory : " + filmCategory.toString()); // debug
		
		int filmCategoryRow = filmCategoryService.addFilmCategory(filmCategory);
		
		return "redirect:/on/filmOne?filmId=" + filmCategory.getFilmId();
	}
	
	// Film에 등록된 Category 삭제
	@GetMapping("/on/removeFilmCategory")
	public String removeFilmCategory(FilmCategory filmCategory) {
		
		
		int filmCategoryRemoveRow = filmCategoryService.removeFilmCategory(filmCategory);
		
		return "redirect:/on/filmOne?filmId=" + filmCategory.getFilmId();
	}
	
	

}
