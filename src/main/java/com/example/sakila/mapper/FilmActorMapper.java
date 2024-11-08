package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {

	int insertFilmActor(FilmActor filmActor);
	
	// on/actorOne -> /on/removeFilmActor
	int deleteFilmActor(FilmActor filmActor);
	
	boolean isFilmActorExists(FilmActor filmActor);
	
}
