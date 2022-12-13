package com.circle.foodstagram.food.model.service;

import java.util.ArrayList;

import com.circle.foodstagram.food.model.vo.Food;

public interface FoodService {
	ArrayList<Food> selectFoodList();		//영양정보 리스트
	Food selectFood(String fname);			//영양정보 상세내역
}
