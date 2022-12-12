package com.circle.foodstagram.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
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
}