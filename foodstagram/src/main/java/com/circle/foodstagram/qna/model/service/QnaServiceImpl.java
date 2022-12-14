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
	public int updateQuestion(Question question) {
		// TODO Auto-generated method stub
		return questionDao.updateQuestion(question);
	}

	@Override
	public int deleteQuestion(int q_no) {
		return questionDao.deleteQuestion(q_no);
	}

	@Override
	public ArrayList<Question> selectAllQuestionList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return questionDao.selectAllQuestionList(map);
	}

	@Override
	public int selectListCount() {
		return questionDao.selectListCount();
	}

	@Override
	public Question getQuestion(int id) {
		return questionDao.getQuestion(id);
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
	public int insertAnswer(Answer answer) {
		return answerDao.insertAnswer(answer);
	}

	@Override
	public int updateAnswer(Answer answer) {
		// TODO Auto-generated method stub
		return answerDao.updateAnswer(answer);
	}

	@Override
	public Answer getAnswer(int ref) {
		return answerDao.getAnswer(ref);
	}

	@Override
	public int deleteAnswer(int a_id) {
		return answerDao.deleteAnswer(a_id);
	}



}
