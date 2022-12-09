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

	public Food selectFood(int fno) {
		return session.selectOne("foodMapper.selectFood", fno);
	}

	public ArrayList<Food> selectList() {
		List<Food> list = session.selectList("foodMapper.selectFoodAll");
		return (ArrayList<Food>)list;
	}

}
