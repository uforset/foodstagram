package com.circle.foodstagram.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.circle.foodstagram.qna.model.vo.Answer;

@Repository("answerDao")
public class AnswerDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public int updateAnswerCheck() {
		return 0;
	}
	public int insertAnswer() {
		return 0;
	}
	public int updateAnswer() {
		return 0;
	}

	public Answer getAnswer(int ref) {
		return session.selectOne("answerMapper.getAnswer",ref);
	}
}
