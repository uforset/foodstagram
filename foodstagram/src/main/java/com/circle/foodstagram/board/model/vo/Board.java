package com.circle.foodstagram.board.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import com.circle.foodstagram.common.attach.model.vo.Attach;

public class Board implements Serializable {

	private static final long serialVersionUID = -1670120064714218199L;
	private int b_no; 						// 게시글 번호
	private String userid; 					// 유저 아이디
	private String b_content; 				// 게시글 내용
	private Date b_create_date; 			// 작성 날짜
	private Date b_up_date; 				// 수정 날짜
	private int b_readcount; 				// 조회수
	private int b_open; 					// 공개정보
	private String b_category;				// 음식종류
	private int b_like;						// 좋아요

	public Board() {
	}

	public Board(int b_no, String userid, String b_content, Date b_create_date, Date b_up_date, int b_readcount,
			int b_open, String b_category, int b_like) {
		super();
		this.b_no = b_no;
		this.userid = userid;
		this.b_content = b_content;
		this.b_create_date = b_create_date;
		this.b_up_date = b_up_date;
		this.b_readcount = b_readcount;
		this.b_open = b_open;
		this.b_category = b_category;
		this.b_like = b_like;
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

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public int getB_like() {
		return b_like;
	}

	public void setB_like(int b_like) {
		this.b_like = b_like;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Board [b_no=" + b_no + ", userid=" + userid + ", b_content=" + b_content + ", b_create_date="
				+ b_create_date + ", b_up_date=" + b_up_date + ", b_readcount=" + b_readcount + ", b_open=" + b_open
				+ ", b_category=" + b_category + ", b_like=" + b_like + "]";
	}
	
	
}