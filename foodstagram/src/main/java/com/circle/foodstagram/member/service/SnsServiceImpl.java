package com.circle.foodstagram.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.member.dao.SnsDao;
import com.circle.foodstagram.member.model.vo.GoogleVO;
import com.circle.foodstagram.member.model.vo.KakaoVO;
import com.circle.foodstagram.member.model.vo.NaverVO;

@Service("snsService")
public class SnsServiceImpl implements SnsService{
	
	@Autowired
	private SnsDao snsDao;
	

	@Override
	public int insertNaverVO(NaverVO naverVO) {
		return snsDao.insertNaverVO(naverVO);
	}

	@Override
	public int insertGoogleVO(GoogleVO googleVO) {
		return snsDao.insertGoogleVO(googleVO);
	}

	@Override
	public int insertKakaoVO(KakaoVO kakaoVO) {
		return snsDao.insertKakaoVO(kakaoVO);
	}

	@Override
	public NaverVO selectNaverVO(String userid) {
		return snsDao.selectNaverVO(userid);
	}

	@Override
	public KakaoVO selectKakaoVO(String userid) {
		return snsDao.selectKakaoVO(userid);
	}
	
	@Override
	public GoogleVO selectGoogleVO(String userid) {
		return snsDao.selectGoogleVO(userid);
	}

}
