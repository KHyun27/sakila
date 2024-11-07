package com.example.sakila.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

@Service
@Transactional
public class ActorFileService {
	
	@Autowired ActorFileMapper actorFileMapper;
	
	// /on/actorOne - actorId의 파일 가져오기
	public List<ActorFile> selectActorFileListByActor(int actorId) {
		return actorFileMapper.selectActorFileListByActor(actorId);
	}
	
	// /on/actorOne → /on/addActorFile - 이미지 파일 추가
	public void addActorFile(ActorForm actorForm, String path) {
		
		if(actorForm.getActorFile() != null) {
			// 파일 입력, ActorFile 입력
			List<MultipartFile> fileList = actorForm.getActorFile();
			for(MultipartFile mf : fileList) {
				ActorFile actorFile = new ActorFile();
				int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				String originname = mf.getOriginalFilename().substring(0, dotIdx);
				String filename = UUID.randomUUID().toString().replace("-", "");
				String ext = mf.getOriginalFilename().substring(dotIdx + 1);
				
				actorFile.setActorId(actorForm.getActorId());
				actorFile.setOriginname(originname);
				actorFile.setFilename(filename);
				actorFile.setExt(ext);
				actorFile.setType(mf.getContentType());
				actorFile.setSize(mf.getSize());
				
				int insertActorFileRow = actorFileMapper.insertActorFile(actorFile);
				if(insertActorFileRow == 1) {
					// 물리적 파일 저장
					try {
						mf.transferTo(new File(path + filename + "." + ext));
					} catch (Exception e) {
						e.printStackTrace();
						// 예외 발생하고 예외처리 하지 않아야지 @Transactional이 작동한다.
						// RuntimeException을 인위적으로 발생
						throw new RuntimeException();
					} 
				}
			}
		}
	}

}
