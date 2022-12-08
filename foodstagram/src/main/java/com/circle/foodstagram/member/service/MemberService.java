package com.circle.foodstagram.member.service;

import java.util.ArrayList;

import com.circle.foodstagram.common.Paging;
import com.circle.foodstagram.common.SearchPaging;
import com.circle.foodstagram.member.model.vo.Member;


public interface MemberService {
	
	int insertMember(Member member);
	int selectDupCheckId(String userid);
	Member selectMember(String userid);
	String find_id(Member member);
	int updateMember(Member member);
	int deleteMember(String userid);
	int pwUpdate(Member member);
	int selectListCount(); //총 게시글 갯수 조회용(페이지 수 계산용)
	int updateLoginOK(Member member);
	ArrayList<Member> selectSearchUserid(String keyword);
	ArrayList<Member> selectSearchEmail(String keyword);
	ArrayList<Member> selectSearchLoginOK(String keyword);
	ArrayList<Member> selectList2(Object object);
	ArrayList<Member> selectList();//추가
	ArrayList<Member> selectList(Paging page); //한 페이지 출력할 게시글 조회용
	int getSearchIdCount(String keyword);
	int getSearchEmailCount(String keyword);
	int getSearchLoginCount(String keyword);
	ArrayList<Member> searchId(SearchPaging searchpaging);
	ArrayList<Member> searchLoginok(SearchPaging searchpaging);
	ArrayList<Member> searchEmail(SearchPaging searchpaging);
	int aupdateMember(Member member);
	int selectSearchUserCount(String keyword);
	ArrayList<Member> selectSearchUser(SearchPaging searchpaging);
}
