package com.circle.foodstagram.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.circle.foodstagram.qna.model.service.QnaService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AnswerController {

	@Autowired
	QnaService qnaService;

}
