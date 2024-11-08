package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmService {
	
	@Autowired FilmMapper filmMapper;
	
	// /on/actorOne
	public List<Film> selectFileTitleListByActor(int actorId, int filmListCurrentPage, int filmListRowPerPage) {
		Map<String, Object> paramMap = new HashMap<>();

		int filmBeginRow = (filmListCurrentPage - 1) * filmListRowPerPage;
		paramMap.put("actorId", actorId);
		paramMap.put("filmListBeginRow", filmBeginRow);
		paramMap.put("filmListRowPerPage", filmListRowPerPage);

		return filmMapper.selectFilmTitleListByActor(paramMap);
	}

	// /on/filmOne
	public Map<String, Object> getFilmOne(int filmId) {
		return filmMapper.selectFilmOne(filmId);
	}
	
	// /on/addFilm
	public int addFilm(FilmForm filmForm) {
		Film film = new Film();
			film.setTitle(filmForm.getTitle());
		if(filmForm.getDescription().equals("")) {
			film.setDescription(null);
		} else {
			film.setDescription(filmForm.getDescription());
		}
		// film.setDescription(filmForm.getDescription().equals("") ? null : filmForm.getDescription()); // 삼항연산자
		film.setReleaseYear(filmForm.getReleaseYear());
		film.setLanguageId(filmForm.getLanguageId());
		film.setOriginalLanguageId(filmForm.getOriginalLanguageId());
		film.setRentalDuration(filmForm.getRentalDuration());
		film.setRentalRate(filmForm.getRentalRate());
		film.setLength(filmForm.getLength());
		film.setReplacementCost(filmForm.getReplacementCost());
		film.setRating(filmForm.getRating());
		// specialFeatures 배열 → ,문자열
		if(filmForm.getSpecialFeatures() == null) {
			film.setSpecialFeatures(null);
		} else {
			String specialFeatures = filmForm.getSpecialFeatures().get(0); // , 는 두번째 부터 있어야 함으로 첫번째 값을 먼저 넣고 
			for(int i = 1; i < filmForm.getSpecialFeatures().size(); i++) {
				specialFeatures += "," + filmForm.getSpecialFeatures().get(i); // 그 뒤 값을 넣어줌
			}
			film.setSpecialFeatures(specialFeatures);
		}
		log.debug("Inserting film: {}", film.toString());
		return filmMapper.insertFilm(film);
	}
	
	public List<Film> getFilmListByTitle(String searchTitle) {
		return filmMapper.selectFilmListByTitle(searchTitle);
	}
}
