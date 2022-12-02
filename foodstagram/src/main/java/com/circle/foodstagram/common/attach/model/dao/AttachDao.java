package com.circle.foodstagram.common.attach.model.dao;

import java.util.List;

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

	public List<Attach> getAttachListByParent(int atch_parent_no, String atch_category) {
		Attach attach = new Attach();
		attach.setAtch_parent_no(atch_parent_no);
		attach.setAtch_category(atch_category);
		return session.selectList("attachMapper.getAttachListByParent", attach);
	}

	public Attach getAttach(int atch_no) {
		return session.selectOne("attachMapper.getAttach", atch_no);
	}

	public int deleteAttach(int atch_no) {
		return session.delete("attachMapper.deleteAttach", atch_no);
	}

	public int increaseDownHit(int atch_no) {
		return session.update("attachMapper.increaseDownHit",atch_no);
	}
	
}
