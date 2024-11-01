package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	
	private int filmId; // PK
	private String title; // FK
	private String description;
	private String releaseYear;
	private int languageId; // FK
	private int originalLanguageId; // FK
	private int rentalDuration;
	private int rentalRate;
	private int length;
	private int replacementCost;
	private String rating;
	private String specialFeatures;
	private String lastUpdate;

}
