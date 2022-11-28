package com.circle.foodstagram.qna.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.circle.foodstagram.qna.model.vo.Question;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository("questionDao")
public class QuestionDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public int insertQuestion(Question question) {
		// 파일있으면 넣어줘야함 게시글 등록한후에 그 게시글 기본키이용해서 넣어줌 
		int i = session.insert("questionMapper.insertQuestion",question);
		log.info("질문 입력 후 질문번호 확인"+question.getQ_no());
		return i;
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
