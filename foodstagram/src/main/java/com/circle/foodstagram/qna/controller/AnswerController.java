package com.circle.foodstagram.qna.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.circle.foodstagram.qna.model.service.QnaService;
import com.circle.foodstagram.qna.model.vo.Answer;
import com.circle.foodstagram.qna.model.vo.Question;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AnswerController {

	@Autowired
	QnaService qnaService;

	@GetMapping("answerModify.do/{id}")
	public String moveAnswerModifyForm(
				@PathVariable Integer id, Model model) {
		try {
			Question q;
			Answer a;
			if( (q = qnaService.getQuestion(id)) != null) {
				a = qnaService.getAnswer(q.getQ_no());
				
				model.addAttribute("q", q);
				model.addAttribute("a", a);
				return "qna/answerEdit";
			} else {
				model.addAttribute("message", "질문 가져오는중 오류발생");
				return "common/error";
			}
		} catch (Exception e){
			model.addAttribute("message", "답변 가져오는중 오류발생" );
			return "common/error";
		}
	}
	
	@PostMapping("insertAnswer.do")
	@ResponseBody
	public String insertAnswerMethod(			
			Answer answer,
			HttpServletRequest request) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
	
		if (qnaService.insertAnswer(answer) > 0  ) {
			log.info("답변 입력 성공" + answer.toString());
			
			strResult = "{ \"result\":\"success\" }";
		} else {
			log.info("답변 입력 실패");
		}	
		
		return strResult;
	}
	
	@PostMapping("updateAnswer.do")
	@ResponseBody
	public String updateAnswerMethod(
			Answer answer,
			HttpServletRequest request) {
		String strResult = "{ \"result\":\"FAIL\" }";
		
		try {
			if (qnaService.updateAnswer(answer) > 0) {
				log.info("답변수정 성공.");
				strResult = "{ \"result\":\"success\" }";
			} else {
				log.info("답변수정 중 오류발생.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return strResult;
	}
	
	@PostMapping("answerDelete.do")
	@ResponseBody
	public String deleteAnswerMethod(
			Answer answer,
			HttpServletRequest request) {
		String strResult = "{ \"result\":\"FAIL\" }";
		
		if(qnaService.deleteAnswer(answer.getA_id()) > 0) {
			log.info("답변삭제 성공!");
			strResult = "{ \"result\":\"success\" }";
		} else {
			log.info("답변삭제 실패..");
		}

		return strResult;
	}
}
