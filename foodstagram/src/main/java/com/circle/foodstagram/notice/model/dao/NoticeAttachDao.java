package com.circle.foodstagram.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.notice.model.vo.NoticeAttach;

@Service("NoticeAttachServiceImpl")
public class NoticeAttachDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public int insertAttach(NoticeAttach noticeAttach) {
		return session.insert("noticeAttachMapper.insertAttach", noticeAttach);
	}

	/*
	 * public ArrayList<NoticeAttach> selectAttachList(int noticeno) {
	 * List<NoticeAttach>list =
	 * session.selectList("noticeAttachMapper.selectAttachList", noticeno); return
	 * (ArrayList<NoticeAttach>) list; }
	 */

	public List<NoticeAttach> getAttachListByParent(int atch_parent_no) {
		NoticeAttach nattach = new NoticeAttach();
		nattach.setAtch_parent_no(atch_parent_no);
		return session.selectList("noticeAttachMapper.getAttachListByParent", nattach);
	}
	
	public int deleteNotice(int noticeno) {
		return session.delete("noticeAttachMapper.insertAttach", noticeno);
	}

	public NoticeAttach getAttach(int atch_no) {
		return session.selectOne("noticeAttachMapper.getAttach", atch_no);
	}

	public int increaseDownHit(int atch_no) {
		return session.update("noticeAttachMapper.increaseDownHit",atch_no);		
	}

	public int deleteAttach(int atch_no) {
		return session.delete("noticeAttachMapper.deleteAttach", atch_no);

	}

}
