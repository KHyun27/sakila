package com.example.sakila.vo;

import lombok.Data;

@Data
public class Inventory {
	
	private int inventoryId; // PK
	private int filmId; // FK → film.film_id
	private int storeId; // FK → store.store_id
	private String lastUpdate;

}
