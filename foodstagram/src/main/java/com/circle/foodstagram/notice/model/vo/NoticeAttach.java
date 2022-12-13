package com.circle.foodstagram.notice.model.vo;

import java.io.Serializable;

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
public class NoticeAttach implements Serializable{
	private static final long serialVersionUID = 2062632430635493150L;
	
	private int atch_no;					// PK
	private int atch_parent_no;				// 부모글 PK
	private String atch_file_name;			// 실제 파일명
	private String atch_original_name;		// 사용자 파일명
	private long atch_file_size;				// 파일 사이즈
	private String atch_fancy_size;			// 단위 종류
	private String atch_content_type;		// 파일 종류
	private String atch_path; /* 저장 경로(board/2020) */
	private int atch_down_hit; /* 다운로드 횟수 */
	private String atch_reg_date;				// 등록일
	
}
