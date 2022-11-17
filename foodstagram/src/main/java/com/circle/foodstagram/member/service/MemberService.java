package com.circle.foodstagram.member.service;

import java.util.ArrayList;

import com.circle.foodstagram.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member member);
	int selectDupCheckId(String userid);
	Member selectMember(String userid);
	String find_id(Member member);
	int updateMember(Member member);
	int deleteMember(String userid);
	int pwUpdate(Member member);
	int selectListCount();
	int updateLoginOK(Member member);
	ArrayList<Member> selectSearchUserid(String keyword);
	ArrayList<Member> selectSearchLoginOK(String keyword);
	ArrayList<Member> selectList2(Object object);

}
