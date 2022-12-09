package com.circle.foodstagram.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.board.model.vo.BoardAttach;
import com.circle.foodstagram.common.Paging;
import com.circle.foodstagram.common.SearchPaging;

public interface BoardService {

	int insertBoard(Board board); 								// 원글 등록용
	int updateBoard(Board board); 								// 원글 수정용
	int deleteBoard(int b_no); 									// 원글 삭제용
	ArrayList<BoardAttach> selectListAll(); 					// 게시판 이미지 리스트
	ArrayList<BoardAttach> selectListMy(String userid); 		// 내 이미지 리스트
	ArrayList<BoardAttach> selectListFriend(String userid); 	// 친구 이미지 리스트
	Board selectBoard(int b_no); 								// 상세보기
	ArrayList<BoardAttach> searchBoard(String Tag); 			// 게시판 이미지 검색
	void updateAddReadcount(int b_no); 							// 조회수
	int addLikeupdateBoard(int b_no);							// 좋아요
	
}