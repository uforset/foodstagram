package com.circle.foodstagram.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.notice.model.dao.NoticeAttachDao;
import com.circle.foodstagram.notice.model.vo.NoticeAttach;

@Service("noticeAttachService")
public class NoticeAttachServiceImpl implements NoticeAttachService {

	@Autowired
	private NoticeAttachDao noticeAttachDao;
	
	@Override
	public int insertAttach(NoticeAttach noticeAttach) {
		return noticeAttachDao.insertAttach(noticeAttach);
	}
	
	/*
	 * @Override public ArrayList<NoticeAttach> selectAttchList(int noticeno) {
	 * return noticeAttachDao.selectAttachList(noticeno); }
	 */

	@Override
	public List<NoticeAttach> getAttachListByParent(int atch_parent_no) {
		return noticeAttachDao.getAttachListByParent(atch_parent_no);
	}

	@Override
	public NoticeAttach getAttach(int atch_no) {
		return noticeAttachDao.getAttach(atch_no);
	}

	@Override
	public int deleteAttach(int atch_no) {
		return noticeAttachDao.deleteAttach(atch_no);
	}
	
	@Override
	public int increaseDownHit(int atch_no) {
		return noticeAttachDao.increaseDownHit(atch_no);
	}
}
