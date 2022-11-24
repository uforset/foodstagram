package com.circle.foodstagram.localstore.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LocalstoreController {
	private static final Logger logger = 
			LoggerFactory.getLogger(LocalstoreController.class);

	// 지역 키워드 검색 -> 맛집 리스트업 용도
	@RequestMapping(value="searchLocalstore.do", method=RequestMethod.GET)
	public String searchLocalstoreMethod(
			@RequestParam("keyword") String keyword, Model model) {
		
		if(keyword.length() > 0) {
			model.addAttribute("keyword", keyword);
			return "search/localStoreView";
		}else {
			model.addAttribute("message", 
					keyword + "검색 키워드가 없습니다.");
			return "common/error";
		}
	}
	
}
