package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorFileMapper {
	
	int insertActorFile(ActorFile actorFile);
	
	// /on/actorOne
	List<ActorFile> selectActorFileListByActor(int actorId);
	
	// /on/removeActorFile
	int deleteActorFile(int actorFileId);
	
	// /on/removeActorFile:Service 파일 이름 가져오기
	ActorFile selectActorFileOne(int actorFileId);
<<<<<<< HEAD
	
	// /on/actorOne → /on/removeActor 호출 actor 삭제 시 파일 같이 삭제
	int deleteActorFileByActor(int actorId);
=======
>>>>>>> refs/remotes/origin/master

}
