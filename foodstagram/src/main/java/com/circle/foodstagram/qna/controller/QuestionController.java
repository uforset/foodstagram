package com.circle.foodstagram.qna.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.circle.foodstagram.member.model.vo.Member;
import com.circle.foodstagram.qna.model.service.QnaService;
import com.circle.foodstagram.qna.model.vo.Question;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class QuestionController {

	@Autowired
	QnaService qnaService;
	
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
	
	
}
