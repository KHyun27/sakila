package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	
	private Integer filmId; // PK
	private String title; 
	private String description; // default : null
	private Integer releaseYear; // default : null
	private Integer languageId; // FK → language.language_id
	private Integer originalLanguageId; // FK → language.language_id
	private Integer rentalDuration;
	private Double rentalRate;
	private Integer length; // default : null
	private Double replacementCost;
	private String rating;
	private String specialFeatures; // default : null
	private String lastUpdate;

}
