package com.circle.foodstagram.common.attach.model.service;

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
	
}
