package com.circle.foodstagram.board.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.circle.foodstagram.board.model.service.BoardService;
import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.common.AttachUtils;
import com.circle.foodstagram.common.Paging;
import com.circle.foodstagram.common.attach.model.service.AttachService;
import com.circle.foodstagram.common.attach.model.vo.Attach;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static JSONParser jsonParser = new JSONParser();
	
	@Autowired
	private BoardService boardService;
	
    @Autowired
    private AttachUtils attachUtils;
   
    @Autowired
    private AttachService attachService;
	
	// 글등록 선택 페이지(사진 찍기 페이지 or 사진 업로드 페이지) 이동
	@RequestMapping("selectbwform.do")
	public String moveWritePage() {
		return "board/selectboardRegistForm";
	}
	
	// 글등록 선택 페이지 -> 사진 찍기 페이지 이동
	@RequestMapping("bwtakepic.do")
	public String moveTakePicPage() {
		return "board/boardTakePictures";
	}
	
	// 글등록 선택 페이지 -> 컴퓨터에 있는 이미지 업로드 페이지 이동
	@RequestMapping("bwform.do")
	public String moveUploadPicPage() {
		return "board/boardUploadPictures";
	}
	
	//이미지로 업로드해서 음식 AI 인식 데이터 추출
	@PostMapping("foodrecognition.do")
	public String foodRecognition(@RequestParam("FoodFile") MultipartFile mfile, Model model, 
			HttpServletRequest request) throws Exception {
		String savePath = request.getSession().getServletContext().getRealPath("resources/namecard_img_files");
		String ocrPath = request.getSession().getServletContext().getRealPath("resources/ocr_python");
		//첨부파일이 있을때만 업로드된 파일을 폴더로 옮김
		if(!mfile.isEmpty()) {
			String filename = mfile.getOriginalFilename();
			if(filename != null && filename.length() > 0) {
				//변경할 파일 이름
				String renameFileName = "namecard";
				renameFileName += "." + filename.substring(filename.lastIndexOf(".") + 1);
					
				//파일 객체 생성
				File originFile = new File(savePath + "\\" + filename);
				File renameFile = new File(savePath + "\\" + renameFileName);
					
				mfile.transferTo(renameFile);
					
				String detectorFile = ocrPath + "\\" + "namecard_detector.exe";
				ProcessBuilder builder = new ProcessBuilder(detectorFile, 
						ocrPath + "/ocrstudent-45a0a578de07.json", savePath + "/namecard.jpg");
				builder.redirectErrorStream(true);
				System.out.println(builder.command());
				Process p = builder.start();
					
				BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream(), "utf-8"));
				StringBuilder buffer = new StringBuilder();
				String line = null;
				while((line = br.readLine()) != null) {
					buffer.append(line);
				}
				String email = buffer.toString();
				System.out.println("추출된 이메일 : " + email);
					
				model.addAttribute("extractedTxt", email);
					
				int exitVal = p.waitFor();
				if(exitVal != 0)  {
					 System.out.println("비정상 종료");
				}
				br.close();
				return "member/boardRegistForm";
					
				} else {
					model.addAttribute("message", "데이터 추출 실패!");
					return "common/error";
				}
				
			} else {
				model.addAttribute("message", "데이터 추출 실패!");
				return "common/error";
			}
			
		}
	
	   @ResponseBody
	   @RequestMapping(value = "binsert.do", method = RequestMethod.POST)
	   public String fileUpload(
	         @RequestParam(name="boFiles", required=false)MultipartFile[] boFiles
	         , Board board
	         , HttpServletRequest request) {
	      
	      String strResult = "{ \"result\":\"FAIL\" }";
	      //question.setQ_date(new Date()); db에서 SYSDATE DEFAULT임
	      
	      if (boFiles != null) {
	         // 첨부파일이 있을때
	         // question.setAttaches(파일리스트); 넣어줌
	      }
	      // 첨부파일 처리

	      try {
	         if(boFiles != null && boFiles.length > 0) {
	             //String savePath = request.getSession().getServletContext().getRealPath("resources/question_upfiles");
	             List<Attach> attaches=
	                   attachUtils.getAttachListByMultiparts(boFiles, "Board", "board_upfiles", request);
	               //실제로 파일경로에 선택된 파일 올리고 List<Attach> return  (파일업로드)
	             // (boFiles, 게시판, 폴더이름)
	             logger.info("attaches" + attaches);
	             board.setAttaches(attaches);
	         }
	         
	      } catch (Exception e) {
	         logger.info("파일 업로드중 에러발생");
	         e.printStackTrace();
	      }
	      
	      // 글등록
	      if( boardService.insertOriginBoard(board) > 0 ) {
	         logger.info("게시글등록성공" + board.toString());
	         //strResult = "{ \"result\":\"success\" }";
	      } else {
	         logger.info("게시글등록실패");
	      }      
	      List<Attach> attaches= board.getAttaches();
	      int q_no = board.getB_no();
	      if( attaches != null && attaches.size()>0) {
	         for(Attach a : attaches) { // 하나씩 db에 저장
	            a.setAtch_parent_no(q_no); // 저장한 게시글번호 첨부파일vo에 세팅
	            logger.info("db에저장할 첨부파일vo" + a);
	            if( attachService.insertAttach(a) > 0 ) {// 하나씩 db에 저장
	               logger.info("성공! " + a);
	            } else {
	               logger.info("실패..." + a);
	               return strResult;
	            }
	         }
	      }
	      strResult = "{ \"result\":\"success\" }";   
	      return strResult;
	   }
	   
	   //게시글 페이지 단위로 목록보기 요청 처리용
	   @RequestMapping(value="blist.do", method= {RequestMethod.POST, RequestMethod.GET})
	   public ModelAndView boardListMethod(
	         @RequestParam(name="page", required=false) String page,
	         ModelAndView mv) {
	      
	      int currentPage = 1;
	      if(page != null) {
	         currentPage = Integer.parseInt(page);
	      }
	      
	      //한 페이지에 게시글 10개씩 출력되게 하는 경우
	      //페이징 계산 처리 -- 별도의 클래스로 작성해도 됨 ---------------
	      //별도의 클래스의 메소드에서 Paging 을 리턴하면 됨
	      int limit = 3;  //한 페이지에 출력할 목록 갯수
	      //전체 페이지 갯수 계산을 위해 총 목록 갯수 조회해 옴
	      int listCount = boardService.selectListCount();
	      //페이지 수 계산
	      //주의 : 목록이 11개이면 페이지 수는 2페이지가 됨
	      // 나머지 목록 1개도 1페이지가 필요함
	      int maxPage = (int)((double)listCount / limit + 0.9);
	      //현재 페이지가 포함된 페이지 그룹의 시작값 지정
	      // => 뷰 아래쪽에 표시할 페이지 수를 10개로 하는 경우
	      int startPage = (currentPage / 10) * 10 + 1;
	      //현재 페이지가 포함된 페이지 그룹의 끝값 지정
	      int endPage = startPage + 10 - 1;
	      
	      if(maxPage < endPage) {
	         endPage = maxPage;
	      }
	      
	      //쿼리문에 전달할 현재 페이지에 적용할 목록의 시작행과 끝행 계산
	      int startRow = (currentPage - 1) * limit + 1;
	      int endRow = startRow + limit - 1;
	      Paging paging = new Paging(startRow, endRow);
	      
	      //페이징 계산 처리 끝 ---------------------------------------
	      
	      ArrayList<Board> list = boardService.selectList(paging);
	      
	      if(list != null && list.size() > 0) {
	         mv.addObject("list", list);
	         mv.addObject("listCount", listCount);
	         mv.addObject("maxPage", maxPage);
	         mv.addObject("currentPage", currentPage);
	         mv.addObject("startPage", startPage);
	         mv.addObject("endPage", endPage);
	         mv.addObject("limit", limit);
	         
	         mv.setViewName("board/boardListView");
	      }else {
	         mv.addObject("message", 
	               currentPage + " 페이지 목록 조회 실패.");
	         mv.setViewName("common/error");
	      }
	      
	      return mv;
	   }
}
