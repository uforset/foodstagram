package com.circle.foodstagram.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.common.Paging;


public interface BoardService {
   
   int insertOriginBoard(Board board); //원글 등록용

   int selectListCount();

   ArrayList<Board> selectList(Paging paging);

   Object bListFive();

   List<Board> infiniteScrollDownPOST(Integer bnoToStart);


}