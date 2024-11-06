package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	
	int insertActor(Actor actor);
	
	// actorList 출력
	List<Actor> selectActorList(Map<String, Object> map);
	
	// actorListCount
	int selectActorCount(String searchWord);
	
	// /on/actorOne
	Actor selectActorOne(int actorId);
	
	// /on/actorList by Film
	List<Actor> selectActorListByFilm(int filmId);

}
