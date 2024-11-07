package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm {
	
	private String title; 
	private String description;
	private String releaseYear;
	private int languageId; 
	private int originalLanguageId;
	private int rentalDuration;
	private double rentalRate;
	private int length;
	private double replacementCost;
	private String rating;
	private List<String> specialFeatures;
	// private String[] specialFeatures;
	
	// 빌드 패턴
//	public Film changeFilm() {
//		Film film = new Film();
//		film.setTitle(this.title);
//		return film;
//	}

}
