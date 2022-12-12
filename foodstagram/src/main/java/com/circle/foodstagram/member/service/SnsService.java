package com.circle.foodstagram.member.service;

import com.circle.foodstagram.member.model.vo.GoogleVO;
import com.circle.foodstagram.member.model.vo.KakaoVO;
import com.circle.foodstagram.member.model.vo.NaverVO;


public interface SnsService {
	
	int insertNaverVO(NaverVO naverVO);
	int insertGoogleVO(GoogleVO googleVO);
	int insertKakaoVO(KakaoVO kakaoVO);
	NaverVO selectNaverVO(String userid);
	KakaoVO selectKakaoVO(String userid);
	GoogleVO selectGoogleVO(String userid);

}
