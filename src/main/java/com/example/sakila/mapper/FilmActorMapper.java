package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {

	int insertFilmActor(FilmActor filmActor);
	
	// on/actorOne -> /on/removeFilmActor : 배우 삭제시 film_actor를 삭제
	int deleteFilmActor(FilmActor filmActor); // Integer deleteFilmActorByActor
	
	// on/actorOne : 이미 존재하는 filmList 확인
	boolean isFilmActorExists(FilmActor filmActor);
	
	// /on/actorOne → /on/removeActor 호출 actor 삭제 시 연결된 Film 같이 삭제
	int deleteFilmByActor(int actorId);
	
	// on/filmOne → /on/removeFilm : film 삭제시 film_actor를 삭제
	Integer deleteFilmActorByFilm(int filmId);
}
