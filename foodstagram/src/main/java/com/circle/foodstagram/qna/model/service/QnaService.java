package com.circle.foodstagram.qna.model.service;

import java.util.ArrayList;

import com.circle.foodstagram.qna.model.vo.Answer;
import com.circle.foodstagram.qna.model.vo.Question;

public interface QnaService {

	int insertQuestion();
	int updateQuestion();
	int deleteQuestion();
	
	ArrayList<Question> selectAllQuestionList();
	int selectListCount();
	
	Question selectQuestion(int id);
	
	ArrayList<Question> selectMyQuestionList();
	int selectMyListCount();
	
	int updateAnswerCheck();
	
	int insertAnswer();
	int updateAnswer();
	Answer selectAnswer();
}
