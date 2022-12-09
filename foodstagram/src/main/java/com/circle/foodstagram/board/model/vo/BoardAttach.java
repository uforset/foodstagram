package com.circle.foodstagram.board.model.vo;

import java.io.Serializable;
import java.sql.Date;


public class BoardAttach implements Serializable{

	private static final long serialVersionUID = 3430557652023966158L;
	
	private int atch_no;					// PK
	private int atch_parent_no;				// 부모글 PK
	private String atch_file_name;			// 실제 파일명
	private String atch_original_name;		// 사용자 파일명
	private int atch_file_size;				// 파일 사이즈
	private String atch_fancy_size;			// 단위 종류
	private String atch_content_type;		// 파일 종류
	private Date atch_reg_date;				// 등록일
	private int atch_seq;					// 이미지 순번
	
	public BoardAttach() {
		
	}

	public BoardAttach(int atch_no, int atch_parent_no, String atch_file_name, String atch_original_name,
			int atch_file_size, String atch_fancy_size, String atch_content_type, Date atch_reg_date, int atch_seq) {
		super();
		this.atch_no = atch_no;
		this.atch_parent_no = atch_parent_no;
		this.atch_file_name = atch_file_name;
		this.atch_original_name = atch_original_name;
		this.atch_file_size = atch_file_size;
		this.atch_fancy_size = atch_fancy_size;
		this.atch_content_type = atch_content_type;
		this.atch_reg_date = atch_reg_date;
		this.atch_seq = atch_seq;
	}

	public int getAtch_no() {
		return atch_no;
	}

	public void setAtch_no(int atch_no) {
		this.atch_no = atch_no;
	}

	public int getAtch_parent_no() {
		return atch_parent_no;
	}

	public void setAtch_parent_no(int atch_parent_no) {
		this.atch_parent_no = atch_parent_no;
	}

	public String getAtch_file_name() {
		return atch_file_name;
	}

	public void setAtch_file_name(String atch_file_name) {
		this.atch_file_name = atch_file_name;
	}

	public String getAtch_original_name() {
		return atch_original_name;
	}

	public void setAtch_original_name(String atch_original_name) {
		this.atch_original_name = atch_original_name;
	}

	public int getAtch_file_size() {
		return atch_file_size;
	}

	public void setAtch_file_size(int atch_file_size) {
		this.atch_file_size = atch_file_size;
	}

	public String getAtch_fancy_size() {
		return atch_fancy_size;
	}

	public void setAtch_fancy_size(String atch_fancy_size) {
		this.atch_fancy_size = atch_fancy_size;
	}

	public String getAtch_content_type() {
		return atch_content_type;
	}

	public void setAtch_content_type(String atch_content_type) {
		this.atch_content_type = atch_content_type;
	}

	public Date getAtch_reg_date() {
		return atch_reg_date;
	}

	public void setAtch_reg_date(Date atch_reg_date) {
		this.atch_reg_date = atch_reg_date;
	}

	public int getAtch_seq() {
		return atch_seq;
	}

	public void setAtch_seq(int atch_seq) {
		this.atch_seq = atch_seq;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BoardAttach [atch_no=" + atch_no + ", atch_parent_no=" + atch_parent_no + ", atch_file_name="
				+ atch_file_name + ", atch_original_name=" + atch_original_name + ", atch_file_size=" + atch_file_size
				+ ", atch_fancy_size=" + atch_fancy_size + ", atch_content_type=" + atch_content_type
				+ ", atch_reg_date=" + atch_reg_date + ", atch_seq=" + atch_seq + "]";
	}
}
