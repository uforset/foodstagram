package com.circle.foodstagram.common;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.circle.foodstagram.common.attach.model.vo.Attach;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class AttachUtils {

	private String uploadPath; // 저장경로지정 /resources/question_upfiles/
	
	/** 다중 MultipartFile에서 VO 설정 및 업로드 파일 처리 후 List 리턴 */
	public List<Attach> getAttachListByMultiparts(MultipartFile[] boFiles, String category, String path, HttpServletRequest request)
			throws IOException {
		List<Attach> atchList = new ArrayList<Attach>();
		//String savePath = request.getSession().getServletContext()
		uploadPath = request.getSession().getServletContext().getRealPath("resources");
		for (int i = 0; i < boFiles.length; i++) {
			MultipartFile multipart = boFiles[i];
			Attach vo = this.getAttachByMultipart(multipart, category, path);
			if (vo != null) {
				atchList.add(vo);
			}
		}
		return atchList;
	}

	/** MultipartFile에서 VO 설정 및 업로드 파일 처리 후 리턴, 없는 경우 null */
	public Attach getAttachByMultipart(MultipartFile multipart, String category, String path) throws IOException {
		if (!multipart.isEmpty()) {
			int pos = multipart.getOriginalFilename().lastIndexOf(".");
	        String ext = multipart.getOriginalFilename().substring(pos + 1);
			String fileName = UUID.randomUUID().toString() + "." + ext; // 랜덤uid + 확장자 붙여줌
			Attach vo = new Attach();
			//vo.orsetAtchOriginalName(multipart.getOriginalFilename());
			vo.setAtch_original_name(multipart.getOriginalFilename());
			//vo.setAtchFileSize(multipart.getSize());
			vo.setAtch_file_size(multipart.getSize());
			//vo.setAtchContentType(multipart.getContentType());
			vo.setAtch_content_type(multipart.getContentType());
			//vo.setAtchFileName(fileName);
			vo.setAtch_file_name(fileName);
			//vo.setAtchCategory(category);
			vo.setAtch_category(category);
			//vo.setAtchPath(path);
			vo.setAtch_path(path);
			//vo.setAtchFancySize(fancySize(multipart.getSize()));
			vo.setAtch_fancy_size(fancySize(multipart.getSize()));
			
			String filePath = uploadPath + File.separatorChar + path;
			// 저장경로 resources + / + path
			FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(filePath, fileName));
			// multipart.transferTo(new File(filePath, fileName)); // 비슷한 역할
			//multipart.transferTo(new File(filePath, fileName));
			// 여기서 실제 파일이 저장(regist에서 실행됐다), inputStream을 file로 변환하는 메소드
			
			return vo;
		} else {
			return null;
		}
	}

	private DecimalFormat df = new DecimalFormat("#,###.0");

	private String fancySize(long size) {
		if (size < 1024) { // 1k 미만
			return size + " Bytes";
		} else if (size < (1024 * 1024)) { // 1M 미만
			return df.format(size / 1024.0) + " KB";
		} else if (size < (1024 * 1024 * 1024)) { // 1G 미만
			return df.format(size / (1024.0 * 1024.0)) + " MB";
		} else {
			return df.format(size / (1024.0 * 1024.0 * 1024.0)) + " GB";
		}
	}
	
	/** 다중 Attach 에서 각각 업로드한 파일 삭제 처리후 List<Integer>리턴(atch_no) */
	public List<Integer> getDeletAtchNoList(List<Attach> attaches, String path, HttpServletRequest request) {
		List<Integer> atchNoList = new ArrayList<Integer>();
		uploadPath = request.getSession().getServletContext().getRealPath("resources");
		for(Attach a : attaches) {
			atchNoList.add(deleteFile(a, path)); // 파일 삭제후 리시트에 넣어줌
		}
		return atchNoList; //삭제목록 (atch_no) 리턴
	}
	
	/** 업로드한 파일 삭제처리후 atch_no 리턴 */
	public int deleteFile(Attach attach, String path) {
		File file = new File(uploadPath + File.separatorChar + path + File.separatorChar + attach.getAtch_file_name());
		if(file.exists()) {// 파일이존재하면
			log.info(attach.getAtch_file_name() + "파일 삭제.");
			log.info(attach.getAtch_original_name() + "파일 삭제.");
			file.delete(); // 파일 삭제	
		}
		return attach.getAtch_no();
	}
	
	
	
}
