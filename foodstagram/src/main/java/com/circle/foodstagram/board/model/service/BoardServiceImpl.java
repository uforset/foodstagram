package com.circle.foodstagram.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.board.model.dao.BoardDao;
import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.board.model.vo.BoardAttach;


@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public int insertBoard(Board board) {
		return boardDao.insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		return boardDao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int b_no) {
		return boardDao.deleteBoard(b_no);
	}

	@Override
	public ArrayList<BoardAttach> selectListAll() {
		return boardDao.selectListAll();
	}
	
	@Override
	public ArrayList<BoardAttach> selectListMy(String userid) {
		return boardDao.selectListMy(userid);
	}
	
	@Override
	public ArrayList<BoardAttach> selectListFriend(String userid) {
		return boardDao.selectListFriend(userid);
	}

	@Override
	public Board selectBoard(int b_no) {
		return boardDao.selectBoard(b_no);
	}

	@Override
	public ArrayList<BoardAttach> searchBoard(String Tag) {
		return boardDao.searchBoard(Tag);
	}

	@Override
	public void updateAddReadcount(int b_no) {
		boardDao.updateAddReadcount(b_no);
	}

	@Override
	public int addLikeupdateBoard(int b_no) {
		return boardDao.addLikeupdateBoard(b_no);
	}


}