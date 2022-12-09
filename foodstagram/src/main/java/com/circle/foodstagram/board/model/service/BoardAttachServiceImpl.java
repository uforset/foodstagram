package com.circle.foodstagram.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.board.model.dao.BoardAttachDao;
import com.circle.foodstagram.board.model.vo.BoardAttach;

@Service("boardAttachService")
public class BoardAttachServiceImpl implements BoardAttachService {

	@Autowired
	private BoardAttachDao boardAttachDao;

	@Override
	public int insertAttach(BoardAttach boardAttach) {
		return boardAttachDao.insertAttach(boardAttach);
	}

	@Override
	public ArrayList<BoardAttach> selectAttchList(int b_no) {
		return boardAttachDao.selectAttchList(b_no);
	}

}