package com.circle.foodstagram.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board_reply implements Serializable{
   private static final long serialVersionUID = 2949188448663996791L;
   private int b_no;                  // 게시글 번호
   private int b_reply_no;               // 댓글 번호
   private String b_reply_content;         // 댓글 내용
   private Date b_reply_date;            // 작성 날짜
   private Date b_reply_up_date;         // 수정 날짜
   
   public Board_reply () {}

   public Board_reply(int b_no, int b_reply_no, String b_reply_content, Date b_reply_date, Date b_reply_up_date) {
      super();
      this.b_no = b_no;
      this.b_reply_no = b_reply_no;
      this.b_reply_content = b_reply_content;
      this.b_reply_date = b_reply_date;
      this.b_reply_up_date = b_reply_up_date;
   }

   public int getB_no() {
      return b_no;
   }

   public void setB_no(int b_no) {
      this.b_no = b_no;
   }

   public int getB_reply_no() {
      return b_reply_no;
   }

   public void setB_reply_no(int b_reply_no) {
      this.b_reply_no = b_reply_no;
   }

   public String getB_reply_content() {
      return b_reply_content;
   }

   public void setB_reply_content(String b_reply_content) {
      this.b_reply_content = b_reply_content;
   }

   public Date getB_reply_date() {
      return b_reply_date;
   }

   public void setB_reply_date(Date b_reply_date) {
      this.b_reply_date = b_reply_date;
   }

   public Date getB_reply_up_date() {
      return b_reply_up_date;
   }

   public void setB_reply_up_date(Date b_reply_up_date) {
      this.b_reply_up_date = b_reply_up_date;
   }

   @Override
   public String toString() {
      return "Board_reply [b_no=" + b_no + ", b_reply_no=" + b_reply_no + ", b_reply_content=" + b_reply_content
            + ", b_reply_date=" + b_reply_date + ", b_reply_up_date=" + b_reply_up_date + "]";
   }

}