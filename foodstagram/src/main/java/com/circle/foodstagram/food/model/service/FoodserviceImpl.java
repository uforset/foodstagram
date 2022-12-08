package com.circle.foodstagram.food.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.food.model.dao.FoodDao;
import com.circle.foodstagram.food.model.vo.Food;

@Service("foodService")
public class FoodserviceImpl implements FoodService{

	@Autowired
	private FoodDao foodDao;
	
	@Override
	public Food selectFood(int fno) {
		return foodDao.selectFood(fno);
	}

	@Override
	public ArrayList<Food> selectAll() {
		return foodDao.selectList();
	}

}
