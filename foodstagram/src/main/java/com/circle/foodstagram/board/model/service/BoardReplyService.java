package com.circle.foodstagram.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.board.model.vo.BoardAttach;
import com.circle.foodstagram.board.model.vo.BoardReply;
import com.circle.foodstagram.common.Paging;

public interface BoardReplyService {

	int insertBoardReply(BoardReply boardReply); // 원글 등록용
	int updataBoardReply(BoardReply boardReply); // 원글 수정용
	int deleteBoardReply(int b_reply_no); // 원글 삭제용
	ArrayList<BoardReply> selectReplyList(int b_no); // 게시판 이미지 리스트

}