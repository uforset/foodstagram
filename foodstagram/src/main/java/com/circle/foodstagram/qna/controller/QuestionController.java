package com.circle.foodstagram.qna.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.circle.foodstagram.common.AttachUtils;
import com.circle.foodstagram.common.attach.model.service.AttachService;
import com.circle.foodstagram.common.attach.model.vo.Attach;
import com.circle.foodstagram.member.model.vo.Member;
import com.circle.foodstagram.qna.model.service.QnaService;
import com.circle.foodstagram.qna.model.vo.Question;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class QuestionController {

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private AttachUtils attachUtils;
	
	@Autowired
	private AttachService attachService;
	
	// 페이지 이동 메소드
	@GetMapping("question.do")
	public String moveQuestionView() {
		return "qna/question";
	}
	
	@GetMapping("questionReg.do")
	public String moveQuestionRegForm() {
		return "qna/questionReg";
	}
	
	@GetMapping("questionList.do") //임시
	public String moveQuestionList() {
		return "qna/questionList";
	}
	
	// end
	
	//나의 질문리스트 (사용자)
	@GetMapping("myQuestionListView.do")
	public ModelAndView myQuestionListMethod(
			@RequestParam(name="page", required=false) String page,
			//@RequestParam(name="userid",required=false) String userid,
			HttpSession session,
			ModelAndView mv) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		String userid = ((Member)session.getAttribute("loginMember")).getUserid();
		//로그인 판단 인터셉터에서 하면 좋을지도
		if(userid == null) {
			mv.addObject("message", " 로그인 상태가 아님.");
			mv.setViewName("common/error");
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int listCount=0;
		int limit = 10; 
		listCount= qnaService.selectMyListCount(userid);
		log.info("당신의 질문개수 : " + listCount);
		// 페이징 계산
		int maxPage = (int)((double)listCount / limit + 0.9);

		int endPage = (int)(Math.ceil(currentPage / 10.0)) * 10;
		int startPage = endPage-9;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		//페이징 계산 처리 끝 ---------------------------------------
		ArrayList<Question> list = null;
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("userid", userid);
		list = qnaService.selectMyQuestionList(map); //나의 질문리스트 검색 row userid전달
		if(list != null && list.size() > 0) {
			log.info("리스트확인");
			log.info(list);
			for(Question q : list) {
				log.info(q);
			}
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);
			
			mv.setViewName("qna/questionList");
		} else {
			mv.addObject("message", 
					currentPage + " 나의 질문 목록 조회 실패.");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "insertQuestion.do", method = RequestMethod.POST)
	public String fileUpload(
			@RequestParam(name="boFiles", required=false)MultipartFile[] boFiles
			, Question question
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
						 attachUtils.getAttachListByMultiparts(boFiles, "Question", "question_upfiles", request);
		         //실제로 파일경로에 선택된 파일 올리고 List<Attach> return  (파일업로드)
				 // (boFiles, 게시판, 폴더이름)
				 log.info(attaches);
				 question.setAttaches(attaches);
			}
			
		} catch (Exception e) {
			log.info("파일 업로드중 에러발생");
			e.printStackTrace();
		}
		
		// 글등록
		if( qnaService.insertQuestion(question) > 0 ) {
			log.info("질문등록성공" + question.toString());
			//strResult = "{ \"result\":\"success\" }";
		} else {
			log.info("질문등록실패");
		}		
		List<Attach> attaches= question.getAttaches();
		int q_no = question.getQ_no();
		if( attaches != null && attaches.size()>0) {
			for(Attach a : attaches) { // 하나씩 db에 저장
				a.setAtch_parent_no(q_no); // 저장한 게시글번호 첨부파일vo에 세팅
				log.info("db에저장할 첨부파일vo" + a);
				if( attachService.insertAttach(a) > 0 ) {// 하나씩 db에 저장
					log.info("성공! " + a);
				} else {
					log.info("실패..." + a);
					return strResult;
				}
			}
		}
		strResult = "{ \"result\":\"success\" }";	
		return strResult;
	}
	
	@GetMapping("qnaDetail.do")
	public String moveQuestionDetailMethod(
			Model model
			,int q_no) {
		
		Question q = qnaService.getQuestion(q_no);	// 이거하나로 질문에연결된 첨부파일도 List에 세팅이 됨 resultMap 이용 mapper참고	
		log.info(q); 
		
		// 답글이 있을경우 답글도 넣어줌
		
		model.addAttribute("q", q);
		//model.addAttribute("a", a);
		
		
		return "qna/qnaDetail";
	}
	
}
