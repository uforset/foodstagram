package com.circle.foodstagram.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.circle.foodstagram.qna.model.service.QnaService;

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
	
	@GetMapping("questionList.do")
	public String moveQuestionList() {
		return "qna/questionList";
	}
	
	// end
}
