package com.circle.foodstagram.common.attach.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.circle.foodstagram.common.attach.model.vo.Attach;

@Repository("attachDao")
public class AttachDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public int insertAttach(Attach attach) {
		return session.insert("attachMapper.insertAttach",attach);
	}
	
}
