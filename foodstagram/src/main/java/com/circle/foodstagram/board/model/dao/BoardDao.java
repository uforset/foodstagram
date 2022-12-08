package com.circle.foodstagram.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.board.model.vo.BoardAttach;
import com.circle.foodstagram.common.Paging;

@Service("BoardServiceImpl")
public class BoardDao {

	@Autowired
	private SqlSessionTemplate session;

	public int insertBoard(Board board) {
		return session.insert("boardMapper.insertBoard", board);
	}

	public int updateBoard(Board board) {
		return session.update("boardMapper.updateBoard", board);
	}

	public int deleteBoard(int b_no) {
		return session.delete("boardMapper.deleteBoard", b_no);
	}

	public ArrayList<BoardAttach> selectListAll() {
		List<BoardAttach> list=session.selectList("boardMapper.selectListAll");
		return (ArrayList<BoardAttach>)list;
	}
	
	public ArrayList<BoardAttach> selectListMy(String userid) {
		List<BoardAttach> list=session.selectList("boardMapper.selectListMy", userid);
		return (ArrayList<BoardAttach>)list;
	}
	
	public ArrayList<BoardAttach> selectListFriend(String userid) {
		List<BoardAttach> list=session.selectList("boardMapper.selectListFriend", userid);
		return (ArrayList<BoardAttach>)list;
	}

	public Board selectBoard(int b_no) {
		return session.selectOne("boardMapper.selectBoard", b_no);
	}

	public ArrayList<BoardAttach> searchBoard(String Tag) {
		List<BoardAttach> list=session.selectList("boardMapper.searchBoard", Tag);
		return (ArrayList<BoardAttach>)list;
	}

	public void updateAddReadcount(int b_no) {
		System.out.println("boardDao : " + b_no);
		session.update("boardMapper.updateAddReadcount", b_no);
	}

	public int addLikeupdateBoard(int b_no) {
		return session.update("boardMapper.addLikeupdateBoard", b_no);
	}

}