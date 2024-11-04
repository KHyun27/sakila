package com.example.sakila.vo;

import lombok.Data;

@Data
public class FilmActor {
	
	private int actorId; // PK, FK → actor.actor_id
	private int filmId;  // FK → film.film_id
	private String lastUpdate;

}
