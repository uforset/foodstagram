package com.circle.foodstagram.food.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.circle.foodstagram.food.model.service.FoodService;
import com.circle.foodstagram.food.model.vo.Food;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FoodController {
	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);

	@Autowired
	private FoodService foodService;


	// 푸드 영양정보 요청 처리용
	@RequestMapping(value="foodDetail.do", method=RequestMethod.GET)
	public String foodDetailMethod(Model model,
			@RequestParam("fname") String fname, 
			@RequestParam(name = "page", required = false) String page,
			HttpSession session) { 
		
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		Food food = foodService.selectFood(fname);
				
		model.addAttribute("fname", fname);
		return "food/foodDetailView";
		
	}
}