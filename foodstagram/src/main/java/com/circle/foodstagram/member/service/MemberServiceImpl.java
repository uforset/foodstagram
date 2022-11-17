package com.circle.foodstagram.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.member.dao.MemberDao;
import com.circle.foodstagram.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	@Override
	public int selectDupCheckId(String userid) {
		return memberDao.selectDupCheckId(userid);
	}

	@Override
	public Member selectMember(String userid) {
		return memberDao.selectMember(userid);
	}

	@Override
	public String find_id(Member member) {
		String result = "";
		try {
		 result= memberDao.find_id(member);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result ;
	}

	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}

	@Override
	public int deleteMember(String userid) {
		return memberDao.deleteMember(userid);
	}

	@Override
	public int pwUpdate(Member member) {
		return memberDao.pwUpdate(member);
	}

	@Override
	public int selectListCount() {
		return memberDao.selectListCount();
	}

	@Override
	public int updateLoginOK(Member member) {
		return memberDao.updateLoginOK(member);
	}

	@Override
	public ArrayList<Member> selectSearchUserid(String keyword) {
		return memberDao.selectSearchUserid(keyword);
	}

	@Override
	public ArrayList<Member> selectSearchLoginOK(String keyword) {
		return memberDao.selectSearchLoginOK(keyword);
	}

	@Override
	public ArrayList<Member> selectList2(Object object) {
		return memberDao.selectList2();
	}
}
