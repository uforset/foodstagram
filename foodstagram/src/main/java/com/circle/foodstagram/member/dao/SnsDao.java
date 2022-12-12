package com.circle.foodstagram.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.circle.foodstagram.member.model.vo.GoogleVO;
import com.circle.foodstagram.member.model.vo.KakaoVO;
import com.circle.foodstagram.member.model.vo.NaverVO;

@Repository("snsDao")
public class SnsDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public int insertNaverVO(NaverVO naverVO) {
		return session.insert("snsMapper.insertNaverVO", naverVO);
	}

	public int insertGoogleVO(GoogleVO googleVO) {
		return session.insert("snsMapper.insertGoogleVO", googleVO);
	}

	public int insertKakaoVO(KakaoVO kakaoVO) {
		return session.insert("snsMapper.insertKakaoVO", kakaoVO);
	}

	public NaverVO selectNaverVO(String userid) {
		return session.selectOne("snsMapper.selectNaverVO", userid);
	}

	public KakaoVO selectKakaoVO(String userid) {
		System.out.println("출력" + userid);
		return session.selectOne("snsMapper.selectKakaoVO", userid);
	}
	
	public GoogleVO selectGoogleVO(String userid) {
		return session.selectOne("snsMapper.selectGoogleVO", userid);
	}



	
}


















