package com.circle.foodstagram.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.common.Paging;

@Service("BoardServiceImpl")
public class BoardDao {
   
   @Autowired
   private SqlSessionTemplate session;

   public int insertOriginBoard(Board board) {
      return session.insert("boardMapper.insertOrigin", board);
   }

   public int selectListCount() {
      return session.selectOne("boardMapper.getListCount");
   }

   public ArrayList<Board> selectList(Paging page) {
      List<Board> list = session.selectList("boardMapper.selectList", page);
      return (ArrayList<Board>)list;
   }

   public Object bListFive() {
      return session.selectList("boardmapper.boardListFive");
   }

   public List<Board> infiniteScrollDownPOST() {
      return session.selectList("boardMapper.infiniteScrollDownPOST");
   }

}