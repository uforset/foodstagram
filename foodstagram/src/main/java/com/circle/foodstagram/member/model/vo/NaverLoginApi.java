package com.circle.foodstagram.member.model.vo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NaverLoginApi {
	
	@RequestMapping(value="main.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String moveNcallback() {
		return "common/main";
	}

}
