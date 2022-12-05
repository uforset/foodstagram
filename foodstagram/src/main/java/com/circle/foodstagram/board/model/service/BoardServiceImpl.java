package com.circle.foodstagram.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.board.model.dao.BoardDao;
import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.common.Paging;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
   
   @Autowired
   private BoardDao boardDao;
   
   @Override
   public int insertOriginBoard(Board board) {
      return boardDao.insertOriginBoard(board);
   }

   @Override
   public int selectListCount() {
      return boardDao.selectListCount();
   }

   @Override
   public ArrayList<Board> selectList(Paging page) {
      return boardDao.selectList(page);
   }

   @Override
   public Object bListFive() {
      return boardDao.bListFive();
   }

   @Override
   public List<Board> infiniteScrollDownPOST(Integer bnoToStart) {
      return boardDao.infiniteScrollDownPOST();
   }

}