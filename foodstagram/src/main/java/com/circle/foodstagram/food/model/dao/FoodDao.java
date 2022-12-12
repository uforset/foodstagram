package com.circle.foodstagram.food.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.circle.foodstagram.food.model.vo.Food;

@Repository("foodDao")
public class FoodDao {

	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Food> selectFoodList() {
		List<Food> list = session.selectList("foodMapper.selectFoodList");
		return (ArrayList<Food>)list;
	}

	public Food selectFood(String fname) {
		return session.selectOne("foodMapper.selectFood", fname);
	}

}
