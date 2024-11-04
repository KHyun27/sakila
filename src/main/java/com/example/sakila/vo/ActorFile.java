package com.example.sakila.vo;

import lombok.Data;

@Data
public class ActorFile {
	
	private int actorFileId; // PK
	private int actorId; // FK → actor.actor_id
	private String originname;
	private String filename;
	private String ext;
	private String type;
	private long size;
	private String createDate;

}
