package com.example.sakila.vo;

import lombok.Data;

@Data
public class City {
	
	private int cityId; // PK
	private String city;
	private int countryId; // FK → country.country_id
	private String lastUpdate;

}
