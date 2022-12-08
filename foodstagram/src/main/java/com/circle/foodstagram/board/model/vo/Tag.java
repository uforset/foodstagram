package com.circle.foodstagram.board.model.vo;

import java.io.Serializable;

public class Tag implements Serializable{
   
   private static final long serialVersionUID = 6156940078815405206L;
   private int tag_no;                  // 태그 번호
   private String tag_name;            // 태그 이름
   
   public Tag () {}

   public Tag(int tag_no, String tag_name) {
      super();
      this.tag_no = tag_no;
      this.tag_name = tag_name;
   }

   public int getTag_no() {
      return tag_no;
   }

   public void setTag_no(int tag_no) {
      this.tag_no = tag_no;
   }

   public String getTag_name() {
      return tag_name;
   }

   public void setTag_name(String tag_name) {
      this.tag_name = tag_name;
   }

   @Override
   public String toString() {
      return "Tag [tag_no=" + tag_no + ", tag_name=" + tag_name + "]";
   }

}