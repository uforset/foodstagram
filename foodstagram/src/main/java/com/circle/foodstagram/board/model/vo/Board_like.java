package com.circle.foodstagram.board.model.vo;

import java.io.Serializable;

public class Board_like implements Serializable{
   
   private static final long serialVersionUID = -4497367740005578188L;
   private int b_no;                  // 게시글 번호
   private int b_like_no;               // 좋아요 번호
   private int b_like;                  // 좋아요
   
   public Board_like () {}

   public Board_like(int b_no, int b_like_no, int b_like) {
      super();
      this.b_no = b_no;
      this.b_like_no = b_like_no;
      this.b_like = b_like;
   }

   public int getB_no() {
      return b_no;
   }

   public void setB_no(int b_no) {
      this.b_no = b_no;
   }

   public int getB_like_no() {
      return b_like_no;
   }

   public void setB_like_no(int b_like_no) {
      this.b_like_no = b_like_no;
   }

   public int getB_like() {
      return b_like;
   }

   public void setB_like(int b_like) {
      this.b_like = b_like;
   }

   @Override
   public String toString() {
      return "Board_like [b_no=" + b_no + ", b_like_no=" + b_like_no + ", b_like=" + b_like + "]";
   }

}