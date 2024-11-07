package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm {
	
	private String title; 
	private String description; // default : null
	private Integer releaseYear; // default : null
	private int languageId; 
	private Integer originalLanguageId;
	private int rentalDuration;
	private double rentalRate;
	private Integer length; // default : null
	private double replacementCost;
	private String rating;
	private List<String> specialFeatures; // default : null
	// private String[] specialFeatures;
	
	// 빌드 패턴
//	public Film changeFilm() {
//		Film film = new Film();
//		film.setTitle(this.title);
//		return film;
//	}

}
