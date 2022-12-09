package com.circle.foodstagram.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.board.model.vo.BoardAttach;
import com.circle.foodstagram.board.model.vo.BoardReply;
import com.circle.foodstagram.common.Paging;

public interface BoardAttachService {

	int insertAttach(BoardAttach boardAttach); // 원글 등록용

	ArrayList<BoardAttach> selectAttchList(int b_no);

}