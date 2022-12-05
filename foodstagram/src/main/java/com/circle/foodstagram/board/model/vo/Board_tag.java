package com.circle.foodstagram.board.model.vo;

import java.io.Serializable;

public class Board_tag implements Serializable{
   
   private static final long serialVersionUID = 1454399410603060519L;
   private int b_no;                  // 게시글 번호
   private int btag_id;               // 태그 id
   private int tag_no;                  // 태그 번호
   
   public Board_tag () {}

   public Board_tag(int b_no, int btag_id, int tag_no) {
      super();
      this.b_no = b_no;
      this.btag_id = btag_id;
      this.tag_no = tag_no;
   }

   public int getB_no() {
      return b_no;
   }

   public void setB_no(int b_no) {
      this.b_no = b_no;
   }

   public int getBtag_id() {
      return btag_id;
   }

   public void setBtag_id(int btag_id) {
      this.btag_id = btag_id;
   }

   public int getTag_no() {
      return tag_no;
   }

   public void setTag_no(int tag_no) {
      this.tag_no = tag_no;
   }

   @Override
   public String toString() {
      return "Board_tag [b_no=" + b_no + ", btag_id=" + btag_id + ", tag_no=" + tag_no + "]";
   }

}