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
	public int insertAnswer( Answer answer ) {
		return session.insert("answerMapper.insertAnswer",answer);
	}
	public int updateAnswer(Answer answer) {
		return session.update("answerMapper.updateAnswer", answer);
	}

	public Answer getAnswer(int ref) {
		return session.selectOne("answerMapper.getAnswer",ref);
	}
	public int deleteAnswer(int a_id) {
		return session.delete("answerMapper.deleteAnswer", a_id);
	}
}
