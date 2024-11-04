package com.example.sakila.vo;

import lombok.Data;

@Data
public class FilmCategory {
	
	private int filmId; // PK,FK → film.film_id
	private int categoryId; // FK → category.category_id
	private String lastUpdate;

}
