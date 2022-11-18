package com.circle.foodstagram.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.notice.model.vo.Notice;
import com.circle.foodstagram.common.Paging;
import com.circle.foodstagram.common.SearchPaging;
import com.circle.foodstagram.notice.model.service.NoticeService;
import com.circle.foodstagram.common.SearchDate;
import com.circle.foodstagram.notice.model.dao.NoticeDao;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public ArrayList<Notice> selectAll() {  
		return noticeDao.selectList();
	}

	@Override
	public Notice selectNotice(int noticeno) {	   
		return noticeDao.selectOne(noticeno);
	}

	@Override
	public int insertNotice(Notice notice) {  
		return noticeDao.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {   
		return noticeDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeno) {   
		return noticeDao.delectNotice(noticeno);
	}

	@Override
	public ArrayList<Notice> selectSearchTitle(SearchPaging searchpaging) {
		return noticeDao.selectSearchTitle(searchpaging);
	}

	@Override
	public ArrayList<Notice> selectSearchDate(SearchPaging searchpaging) {
		return noticeDao.selectSearchDate(searchpaging);
	}

	@Override
	public int updateAddReadcount(int noticeno) {
		return noticeDao.updateAddReadcount(noticeno);
	}

	@Override
	public int selectListCount() {
		return noticeDao.selectListCount();
	}

	@Override
	public ArrayList<Notice> selectList(Paging page) {
		return noticeDao.selectList(page);
	}

	@Override
	public int selectSearchTListCount(String keyword) {
		return noticeDao.selectSearchTListCount(keyword);
	}

	@Override
	public int selectSearchDListCount(SearchDate date) {
		return noticeDao.selectSearchWListCount(date);
	}

}
