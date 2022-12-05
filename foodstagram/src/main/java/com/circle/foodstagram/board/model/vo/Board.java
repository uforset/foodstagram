package com.circle.foodstagram.board.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import com.circle.foodstagram.common.attach.model.vo.Attach;

public class Board implements Serializable {
   
   private static final long serialVersionUID = -1670120064714218199L;
   private int b_no;                  // 게시글 번호
   private String userid;               // 유저 아이디
   private String b_content;            // 게시글 내용
   private Date b_create_date;            // 작성 날짜
   private Date b_up_date;               // 수정 날짜            
   private int b_readcount;            // 조회수
   private int b_open;                  // 공개정보
   
   private List<Attach> attaches ;         // 첨부파일 리스트
   private int[] delAtchNos;              // 삭제를 위한 글 번호
   
   private Board_reply board_reply;      // 댓글 테이블
   
   private Board_like board_like;         // 좋아요 테이블
   
   private Board_tag board_tag;         // 태그 묶는 테이블
   
   private Tag tag;                  // 태그 테이블
   
   public Board () {}

   public Board(int b_no, String userid, String b_content, Date b_create_date, Date b_up_date, int b_readcount,
         int b_open, List<Attach> attaches, int[] delAtchNos, Board_reply board_reply, Board_like board_like,
         Board_tag board_tag, Tag tag) {
      super();
      this.b_no = b_no;
      this.userid = userid;
      this.b_content = b_content;
      this.b_create_date = b_create_date;
      this.b_up_date = b_up_date;
      this.b_readcount = b_readcount;
      this.b_open = b_open;
      this.attaches = attaches;
      this.delAtchNos = delAtchNos;
      this.board_reply = board_reply;
      this.board_like = board_like;
      this.board_tag = board_tag;
      this.tag = tag;
   }

   public int getB_no() {
      return b_no;
   }

   public void setB_no(int b_no) {
      this.b_no = b_no;
   }

   public String getUserid() {
      return userid;
   }

   public void setUserid(String userid) {
      this.userid = userid;
   }

   public String getB_content() {
      return b_content;
   }

   public void setB_content(String b_content) {
      this.b_content = b_content;
   }

   public Date getB_create_date() {
      return b_create_date;
   }

   public void setB_create_date(Date b_create_date) {
      this.b_create_date = b_create_date;
   }

   public Date getB_up_date() {
      return b_up_date;
   }

   public void setB_up_date(Date b_up_date) {
      this.b_up_date = b_up_date;
   }

   public int getB_readcount() {
      return b_readcount;
   }

   public void setB_readcount(int b_readcount) {
      this.b_readcount = b_readcount;
   }

   public int getB_open() {
      return b_open;
   }

   public void setB_open(int b_open) {
      this.b_open = b_open;
   }

   public List<Attach> getAttaches() {
      return attaches;
   }

   public void setAttaches(List<Attach> attaches) {
      this.attaches = attaches;
   }

   public int[] getDelAtchNos() {
      return delAtchNos;
   }

   public void setDelAtchNos(int[] delAtchNos) {
      this.delAtchNos = delAtchNos;
   }

   public Board_reply getBoard_reply() {
      return board_reply;
   }

   public void setBoard_reply(Board_reply board_reply) {
      this.board_reply = board_reply;
   }

   public Board_like getBoard_like() {
      return board_like;
   }

   public void setBoard_like(Board_like board_like) {
      this.board_like = board_like;
   }

   public Board_tag getBoard_tag() {
      return board_tag;
   }

   public void setBoard_tag(Board_tag board_tag) {
      this.board_tag = board_tag;
   }

   public Tag getTag() {
      return tag;
   }

   public void setTag(Tag tag) {
      this.tag = tag;
   }

   @Override
   public String toString() {
      return "Board [b_no=" + b_no + ", userid=" + userid + ", b_content=" + b_content + ", b_create_date="
            + b_create_date + ", b_up_date=" + b_up_date + ", b_readcount=" + b_readcount + ", b_open=" + b_open
            + ", attaches=" + attaches + ", delAtchNos=" + Arrays.toString(delAtchNos) + ", board_reply="
            + board_reply + ", board_like=" + board_like + ", board_tag=" + board_tag + ", tag=" + tag + "]";
   }

}