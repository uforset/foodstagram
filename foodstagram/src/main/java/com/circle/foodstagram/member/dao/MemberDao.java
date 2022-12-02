package com.circle.foodstagram.member.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.circle.foodstagram.common.Paging;
import com.circle.foodstagram.common.SearchPaging;
import com.circle.foodstagram.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int insertMember(Member member) {
		int result= session.insert("memberMapper.insertMember", member);
		return result;
	}
	
	public Member selectMember(String userid) {
		return session.selectOne("memberMapper.selectMember", userid);
	}

	public int selectDupCheckId(String userid) {
		return session.selectOne("memberMapper.selectCheckId", userid);
	}

	public Member selectLogin(Member member) {
		return session.selectOne("memberMapper.selectLogin", member);
	}
	
	public String find_id(Member member) {
		return session.selectOne("memberMapper.findId",member);
	}

	public int updateMember(Member member) {
		return session.update("memberMapper.updateMember", member);
	}

	public int deleteMember(String userid) {
		return session.delete("memberMapper.deleteMember", userid);
	}

	public int pwUpdate(Member member) {
		return session.update("memberMapper.pwUpdate", member);
	}

	public ArrayList<Member> selectList() {
		List<Member> list = session.selectList("memberMapper.selectList");
		return (ArrayList<Member>)list;
	}

	
	// 검색 처리용 ---------------------------------
	public ArrayList<Member> selectSearchUserid(String keyword){
		List<Member> list = session.selectList(
				"memberMapper.selectSearchUserid", keyword);
		return (ArrayList<Member>)list;
	}
	
	public ArrayList<Member> selectSearchEmail(String keyword) {
		List<Member> list = session.selectList(
				"memberMapper.selectSearchEmail", keyword);
		return (ArrayList<Member>)list;
	}
	
	public ArrayList<Member> selectSearchLoginOK(String keyword){
		List<Member> list = session.selectList(
				"memberMapper.selectSearchLoginOK", keyword);
		return (ArrayList<Member>)list;
	}

	public int selectListCount() {
		return session.selectOne("memberMapper.getListCount");
	}

	public int updateLoginOK(Member member) {
		return session.update("memberMapper.updateLoginOK", member);
	}

	public ArrayList<Member> selectList2() {
		List<Member> list = session.selectList("memberMapper.selectList2");
		return (ArrayList<Member>)list;
	}

//페이지 처리-----------------------------------
	public ArrayList<Member> selectList(Paging page) {
		List<Member> list = session.selectList("memberMapper.selectList", page);
		return (ArrayList<Member>)list;
	}

	public int getSearchIdCount(String keyword) {
		return session.selectOne("memberMapper.getSearchIdCount", keyword);
	}

	public ArrayList<Member> searchId(SearchPaging searchpaging) {
		List<Member> list = session.selectList("memberMapper.searchId", searchpaging);
		return (ArrayList<Member>)list;
	}

	public ArrayList<Member> searchLoginok(SearchPaging searchpaging) {
		List<Member> list = session.selectList("memberMapper.searchLoginok", searchpaging);
		return (ArrayList<Member>)list;
	}

	public int getSearchLoginCount(String keyword) {
		return session.selectOne("memberMapper.getSearchLoginCount", keyword);
	}

	public ArrayList<Member> searchEmail(SearchPaging searchpaging) {
		List<Member> list = session.selectList("memberMapper.searchEmail", searchpaging);
		return (ArrayList<Member>)list;
	}

	public int getSearchEmailCount(String keyword) {
		return session.selectOne("memberMapper.getSearchEmailCount", keyword);
	}

	public int aupdateMember(Member member) {
		return session.update("memberMapper.aupdateMember", member);
	}



	
}
