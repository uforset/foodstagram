package com.circle.foodstagram.qna.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.circle.foodstagram.qna.model.vo.Question;

@Repository("questionDao")
public class QuestionDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public int insertQuestion() {
		return 0;
		}
	public int updateQuestion() {
		return 0;
		}
	public int deleteQuestion() {
		return 0;
		}
	
	public ArrayList<Question> selectAllQuestionList(){
		return null;
		}
	public int selectListCount() {
		return 0;
		}
	
	public Question selectQuestion(int id) {
		return null;
		}
	
	public ArrayList<Question> selectMyQuestionList(Map<String, Object> map){
		List<Question> list = session.selectList("questionMapper.selectMyQuestionList",map);
		return (ArrayList<Question>)list;
		}
	public int selectMyListCount(String userid) {
		return session.selectOne("questionMapper.selectMyListCount",userid);
		}
}
