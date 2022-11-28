package com.circle.foodstagram.qna.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.circle.foodstagram.qna.model.vo.Answer;
import com.circle.foodstagram.qna.model.vo.Question;

public interface QnaService {

	int insertQuestion(Question question);
	int updateQuestion();
	int deleteQuestion();
	
	ArrayList<Question> selectAllQuestionList();
	int selectListCount();
	
	Question selectQuestion(int id);
	
	ArrayList<Question> selectMyQuestionList(Map<String, Object> map);
	int selectMyListCount(String userid);
	
	int updateAnswerCheck();
	
	int insertAnswer();
	int updateAnswer();
	Answer selectAnswer();
}
