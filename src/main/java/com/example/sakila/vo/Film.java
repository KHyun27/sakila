package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	
	private int filmId; // PK
	private String title; 
	private String description;
	private String releaseYear;
	private int languageId; // FK → language.language_id
	private int originalLanguageId; // FK → language.language_id
	private int rentalDuration;
	private int rentalRate;
	private int length;
	private int replacementCost;
	private String rating;
	private String specialFeatures;
	private String lastUpdate;

}
