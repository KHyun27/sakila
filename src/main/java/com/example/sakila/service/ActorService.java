package com.example.sakila.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.mapper.ActorMapper;
import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

@Service
@Transactional
public class ActorService {

	@Autowired ActorMapper actorMapper;
	@Autowired ActorFileMapper actorFileMapper;
	@Autowired FilmActorMapper filmActorMapper;

	public void addActor(ActorForm actorForm, String path) {
		Actor actor = new Actor();
		actor.setFirstName(actorForm.getFirstName());
		actor.setLastName(actorForm.getLastName());

		int insertActorRow = actorMapper.insertActor(actor);
		int actorId = actor.getActorId(); // mybatis selectKey의 값

		if (insertActorRow == 1 && actorForm.getActorFile() != null) {
			// 파일 입력, ActorFile 입력
			List<MultipartFile> fileList = actorForm.getActorFile();
			for (MultipartFile mf : fileList) {
				ActorFile actorFile = new ActorFile();
				int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				String originname = mf.getOriginalFilename().substring(0, dotIdx);
				String filename = UUID.randomUUID().toString().replace("-", "");
				String ext = mf.getOriginalFilename().substring(dotIdx + 1);

				actorFile.setActorId(actorId);
				actorFile.setOriginname(originname);
				actorFile.setFilename(filename);
				actorFile.setExt(ext);
				actorFile.setType(mf.getContentType());
				actorFile.setSize(mf.getSize());

				int insertActorFileRow = actorFileMapper.insertActorFile(actorFile);
				if (insertActorFileRow == 1) {
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

	public List<Actor> getActorList(int currentPage, int rowPerPage, String searchWord) {
		Map<String, Object> paramMap = new HashMap<>();

		int beginRow = (currentPage - 1) * rowPerPage;
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);

		return actorMapper.selectActorList(paramMap);
	}

	public int getLastPageBySearchWord(int rowPerPage, String searchWord) {
		int count = actorMapper.selectActorCount(searchWord);
		System.out.println("count :" + count);
		int lastPage = count / rowPerPage;
		if (count % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
	
	public int getLastPageByActorFilmList(int actorId, int filmListRowPerPage) {
		int filmListCount = actorMapper.selectActorFilmListCount(actorId);
		int filmListLastPage = filmListCount / filmListRowPerPage;
		if (filmListCount % filmListRowPerPage != 0) {
			filmListLastPage++;
		}
		return filmListLastPage;
	}

	// /on/actorOne
	public Actor getActorOne(int actorId) {
		return actorMapper.selectActorOne(actorId);
	}

	// /on/filmOne
	public List<Actor> getActorListByFilm(int filmId) {
		return actorMapper.selectActorListByFilm(filmId);
	}

	// /on/modifyActor
	public int modifyActor(Actor actor) {
		return actorMapper.updateActor(actor);
	}

	// /on/actorOne → /on/removeActor : Actor 삭제 시 actor,file,film 전부 삭제
	public void removeActor(int actorId, String path) {
		// 1) film_actor 삭제 ( 없을 수도 있다 )
		filmActorMapper.deleteFilmByActor(actorId);
		// 2) actor_file 삭제
		List<ActorFile> actorFileList = actorFileMapper.selectActorFileListByActor(actorId);
		actorFileMapper.deleteActorFileByActor(actorId);
		// 3) actor 삭제
		int deleteActorRow = actorMapper.deleteActor(actorId);
		// 4) 물리적 파일 삭제
		if (deleteActorRow == 1 && actorFileList != null && actorFileList.size() > 0) { // actor 삭제 했고, 물리적 파일이 존재
																						// 한다면...
			for (ActorFile actorFile : actorFileList) {
				String fullname = path + actorFile.getFilename() + "." + actorFile.getExt();
				File file = new File(fullname);
				file.delete();
			}
		}
	}
}
