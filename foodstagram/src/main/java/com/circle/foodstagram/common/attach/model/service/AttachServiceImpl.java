package com.circle.foodstagram.common.attach.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.common.attach.model.dao.AttachDao;
import com.circle.foodstagram.common.attach.model.vo.Attach;

@Service("attachService")
public class AttachServiceImpl implements AttachService {

	@Autowired
	AttachDao attachDao;
	
	@Override
	public int insertAttach(Attach attach) {
		return attachDao.insertAttach(attach);
	}

	@Override
	public List<Attach> getAttachListByParent(int atch_parent_no, String atch_category) {
		return attachDao.getAttachListByParent(atch_parent_no, atch_category);
	}

	@Override
	public Attach getAttach(int atch_no) {
		return attachDao.getAttach(atch_no);
	}

	@Override
	public int deleteAttach(int atch_no) {
		return attachDao.deleteAttach(atch_no);
	}

	@Override
	public int increaseDownHit(int atch_no) {
		return attachDao.increaseDownHit(atch_no);
	}
	
}
