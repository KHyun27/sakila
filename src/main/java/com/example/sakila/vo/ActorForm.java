package com.example.sakila.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ActorForm { // ActorCommand
	
	private int actorId; // actorFile을 입력받기 위해 추가
	private String firstName;
	private String lastName;
	private List<MultipartFile> actorFile;
	

}
