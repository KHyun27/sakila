package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	
	int insertActor(Actor actor);
	
	// /on/actorList 출력 → List출력(page) 
	List<Actor> selectActorList(Map<String, Object> map);
	
	// actorListCount
	int selectActorCount(String searchWord);
	
	// actor Film List
	int selectActorFilmListCount(int actorId);
	
	// /on/actorOne
	Actor selectActorOne(int actorId);
	
	// /on/actorList by Film
	List<Actor> selectActorListByFilm(int filmId);
	
	// /on/modifyActor
	int updateActor(Actor actor);
	
	// /on/removeActor
	int deleteActor(int actorId);
	
	// /on/filmOne → searchName 검색 결과 리스트
	List<Actor> selectActorListByActor(String searchName);

}
