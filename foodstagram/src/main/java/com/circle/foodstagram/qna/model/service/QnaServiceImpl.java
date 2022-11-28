package com.circle.foodstagram.qna.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.qna.model.dao.AnswerDao;
import com.circle.foodstagram.qna.model.dao.QuestionDao;
import com.circle.foodstagram.qna.model.vo.Answer;
import com.circle.foodstagram.qna.model.vo.Question;


@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private AnswerDao answerDao;
	@Autowired
	private QuestionDao questionDao;
	
	@Override
	public int insertQuestion(Question question) {
		// TODO Auto-generated method stub
		return questionDao.insertQuestion(question);
	}

	@Override
	public int updateQuestion() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQuestion() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Question> selectAllQuestionList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Question selectQuestion(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Question> selectMyQuestionList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return questionDao.selectMyQuestionList(map);
	}

	@Override
	public int selectMyListCount(String userid) {
		// TODO Auto-generated method stub
		return questionDao.selectMyListCount(userid);
	}

	@Override
	public int updateAnswerCheck() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAnswer() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAnswer() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Answer selectAnswer() {
		// TODO Auto-generated method stub
		return null;
	}



}
