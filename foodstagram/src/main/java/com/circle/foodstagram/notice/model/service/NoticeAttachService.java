package com.circle.foodstagram.notice.model.service;

import java.util.List;

import com.circle.foodstagram.notice.model.vo.NoticeAttach;

public interface NoticeAttachService {

	int insertAttach(NoticeAttach noticeAttach); // 원글 등록용

	public List<NoticeAttach> getAttachListByParent(int atch_parent_no);
	
	NoticeAttach getAttach(int atch_no);
	int deleteAttach(int atch_no);
	
	//다운로드 횟수증가
	int increaseDownHit(int atch_no);

	//ArrayList<NoticeAttach> selectAttchList(int noticeno);
}
