package com.circle.foodstagram.common.attach.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.circle.foodstagram.common.attach.model.service.AttachService;
import com.circle.foodstagram.common.attach.model.vo.Attach;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class AttachController {

	@Autowired
	private AttachService attachService;

	// 파일 다운로드처리
	@GetMapping("attachDownload.do/{atch_no:[0-9]{1,16}}")
	public void fileDownloadMethod(
			@PathVariable(name = "atch_no") int atch_no, 
			HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		try {

			// 서비스를 통해 첨부파일 가져오기
			Attach vo = attachService.getAttach(atch_no);
	
			//파일저장 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("resources");
			
			// 파일명에 한글이 있는경우 처리
			String originalName = new String(vo.getAtch_original_name().getBytes("utf-8"), "iso-8859-1");
			String filePath = uploadPath + File.separatorChar + vo.getAtch_path();
			String fileName = vo.getAtch_file_name();
			
			//경로에 있는 파일 찾기
			File f = new File(filePath, fileName);
			if (!f.isFile()) {
				throw new FileNotFoundException("해당 첨부파일이 존재하지 않습니다.");
			}
			
			// 다운로드를 위한 헤더 생성
			response.setHeader("Content-Type", "application/octet-stream;");
			response.setHeader("Content-Disposition", "attachment;filename=\"" + originalName + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary;");
			response.setContentLength((int) f.length()); // 진행률
			response.setHeader("Pragma", "no-cache;");
			response.setHeader("Expires", "-1;");
			// 저장된 파일을 응답객체의 스트림으로 내보내기,  response의 outputStream에  해당파일을 복사
			FileUtils.copyFile(f, response.getOutputStream());
			response.getOutputStream().close();
			attachService.increaseDownHit(atch_no);
			
			
		} catch (FileNotFoundException e) { 
			printMessage(response, "해당 첨부파일이 존재하지 않습니다.");
		} catch (IOException e) {
			log.info("IOException발생..");
			response.reset();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
		} catch (Exception e) {
			log.info("파일 다운로드 처리중 예외발생.." + e.getMessage());
			e.printStackTrace();
		}
	}
	
	
	//정상적인 다운로드가 안될 경우 메시지 처리
	private void printMessage(HttpServletResponse resp, String msg) throws Exception {
			resp.setCharacterEncoding("utf-8");
			resp.setHeader("Content-Type", "text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			//target이 지정되지 않은 경우 history.back() 으로 처리
			out.println("<script type='text/javascript'>");
			out.println(" alert('" + msg + "');");
			out.println(" self.close();");
			out.println("</script>");
			out.println("<h4>첨부파일 문제 " + msg + "</h4>");
			out.println("<button onclick='self.close()'>닫기</button>");
		}
}
