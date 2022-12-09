package com.circle.foodstagram.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.board.model.vo.BoardAttach;
import com.circle.foodstagram.common.Paging;

@Service("BoardAttachServiceImpl")
public class BoardAttachDao {

	@Autowired
	private SqlSessionTemplate session;

	public int insertAttach(BoardAttach boardAttach) {
		return session.insert("boardattachMapper.insertAttach", boardAttach);
	}

	public ArrayList<BoardAttach> selectAttchList(int b_no) {
		List<BoardAttach> list = session.selectList("boardattachMapper.selectAttchList", b_no);
		return (ArrayList<BoardAttach>) list;
	}

}