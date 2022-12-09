package com.circle.foodstagram.member.model.vo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.github.scribejava.core.builder.api.DefaultApi20;

@Controller
public class NaverLoginApi extends DefaultApi20 {
	
	protected NaverLoginApi() {}
	
	private static class InstanceHolder{
		private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	}
	
	public static NaverLoginApi instance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
				
	}

	@Override
	protected String getAuthorizationBaseUrl() {			
		return "https://nid.naver.com/oauth2.0/authorize";
	}
	

}
