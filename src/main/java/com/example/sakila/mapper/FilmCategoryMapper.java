package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmCategory;

@Mapper
public interface FilmCategoryMapper {
	
	Integer deleteFilmCateogryByFilm(int filmId);
	
	// 11/12 과제
	Integer deleteFilmCateogryByCategory(int categoryId);
	// 카테고리 리스트
	// 카테고리 추가
	
	// /on/filmOne : 특정 필름의 카테고리 리스트
	List<Map<String, Object>> selectFilmCategoryListByFilm(Integer filmId);
	
	// /on/addFilmCategory
	Integer insertFilmCategory(FilmCategory filmCategory);
	
	Integer deleteFilmCategory(FilmCategory filmCategory);

}
