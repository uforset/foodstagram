package com.circle.foodstagram.notice.model.service;

import java.util.ArrayList;

import com.circle.foodstagram.notice.model.vo.Notice;
import com.circle.foodstagram.common.Paging;
import com.circle.foodstagram.common.SearchPaging;
import com.circle.foodstagram.common.SearchDate;

public interface NoticeService {
	ArrayList<Notice> selectAll();
	Notice selectNotice(int noticeno);
	int insertNotice(Notice notice);
	int updateNotice(Notice notice);
	int deleteNotice(int noticeno);
	int updateAddReadcount(int noticeno);
	ArrayList<Notice> selectSearchTitle(SearchPaging searchpaging);
	ArrayList<Notice> selectSearchDate(SearchPaging searchpaging);
	int selectListCount();
	ArrayList<Notice> selectList(Paging page);
	int selectSearchTListCount(String keyword);
	int selectSearchDListCount(SearchDate date);

	
}
