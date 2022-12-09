package com.circle.foodstagram.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.board.model.dao.BoardReplyDao;
import com.circle.foodstagram.board.model.vo.BoardReply;


@Service("boardReplyService")
public class BoardReplyServiceImpl implements BoardReplyService {

	@Autowired
	private BoardReplyDao boardReplyDao;

	@Override
	public int insertBoardReply(BoardReply boardReply) {
		return boardReplyDao.insertBoardReply(boardReply);
	}

	@Override
	public int updataBoardReply(BoardReply boardReply) {
		return boardReplyDao.updataBoardReply(boardReply);
	}

	@Override
	public int deleteBoardReply(int b_reply_no) {
		return boardReplyDao.deleteBoardReply(b_reply_no);
	}

	@Override
	public ArrayList<BoardReply> selectReplyList(int b_no) {
		return boardReplyDao.selectReplyList(b_no);
	}

}