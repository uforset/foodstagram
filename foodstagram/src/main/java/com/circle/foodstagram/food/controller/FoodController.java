package com.circle.foodstagram.food.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.circle.foodstagram.food.model.service.FoodService;
import com.circle.foodstagram.food.model.vo.Food;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FoodController {
	private static final Logger logger = LoggerFactory.getLogger(FoodController.class);

	@Autowired
	private FoodService foodService;


	// 푸드 영양정보 이동 용도
	@RequestMapping("foodDetail.do")
	public String foodDetailMethod(@RequestParam("fno") int fno, Model model) { 
		
		Food food = foodService.selectFood(fno);
		model.addAttribute("food", food);		
		return "food/foodDetailView";
		
	}
}