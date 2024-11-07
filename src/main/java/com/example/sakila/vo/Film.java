package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	
	private int filmId; // PK
	private String title; 
	private String description; // default : null
	private Integer releaseYear; // default : null
	private int languageId; // FK → language.language_id
	private Integer originalLanguageId; // FK → language.language_id
	private int rentalDuration;
	private double rentalRate;
	private Integer length; // default : null
	private double replacementCost;
	private String rating;
	private String specialFeatures; // default : null
	private String lastUpdate;

}
