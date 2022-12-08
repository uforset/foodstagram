package com.circle.foodstagram.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.board.model.vo.BoardAttach;
import com.circle.foodstagram.board.model.vo.BoardReply;
import com.circle.foodstagram.common.Paging;

@Service("BoardReplyServiceImpl")
public class BoardReplyDao {

	@Autowired
	private SqlSessionTemplate session;

	public int insertBoardReply(BoardReply boardReply) {
		return session.insert("boardreplyMapper.insertBoardReply", boardReply);
	}

	public int updataBoardReply(BoardReply boardReply) {
		return session.update("boardreplyMapper.updataBoardReply", boardReply);
	}

	public int deleteBoardReply(int b_reply_no) {
		return session.delete("boardreplyMapper.deleteBoardReply", b_reply_no);
	}

	public ArrayList<BoardReply> selectReplyList(int b_no) {
		List<BoardReply> list = session.selectList("boardreplyMapper.selectReplyList", b_no);
		return (ArrayList<BoardReply>) list;
	}


}