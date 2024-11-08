package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	
	// /on/actorOne
	List<Film> selectFilmTitleListByActor(Map<String, Object> map);
	
	// /on/filmOne (film join language)
	Map<String, Object> selectFilmOne(int filmId);
	
	// /on/addFilm
	int insertFilm(Film film);

	// /on/actorOne - film 검색 요청 시 사용
	List<Film> selectFilmListByTitle(String searchTitle);
}
