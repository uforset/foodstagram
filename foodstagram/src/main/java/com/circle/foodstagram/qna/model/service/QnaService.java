package com.circle.foodstagram.qna.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.circle.foodstagram.qna.model.vo.Answer;
import com.circle.foodstagram.qna.model.vo.Question;

public interface QnaService {

	int insertQuestion(Question question);
	int updateQuestion(Question question);
	int deleteQuestion(int q_no);
	
	ArrayList<Question> selectAllQuestionList(Map<String, Object> map);
	int selectListCount();
	
	Question getQuestion(int id);
	Answer getAnswer(int ref);
	
	ArrayList<Question> selectMyQuestionList(Map<String, Object> map);
	int selectMyListCount(String userid);
	
	int updateAnswerCheck();
	
	int insertAnswer(Answer answer);
	int updateAnswer(Answer answer);
	int deleteAnswer(int a_id);
	
}
