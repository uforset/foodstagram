package com.circle.foodstagram.food.model.service;

import java.util.ArrayList;

import com.circle.foodstagram.food.model.vo.Food;

public interface FoodService {
	ArrayList<Food> selectAll();
	Food selectFood(int fno);
}
