package com.circle.foodstagram.common.attach.model.vo;

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
public class Attach implements Serializable {

	private static final long serialVersionUID = -5022006135796188381L;
	
	private int atch_no; /* 첨부파일 번호(PK) */
	private int atch_parent_no; /* 부모글의 PK */
	private String atch_category; /* 상위글 분류(BOARD, FREE, QNA, PDS 등) */
	private String atch_file_name; /* 실제 저장된 파일명 */
	private String atch_original_name; /* 사용자가 올린 원래 파일명 */
	private long atch_file_size; /* 파일 사이즈   1024,  1024*1024 */
	private String atch_fancy_size; /* 팬시 사이즈  : 1KB , 1MB   */
	private String atch_content_type; /* 컨텐츠 타입 */
	private String atch_path; /* 저장 경로(board/2020) */
	private int atch_down_hit; /* 다운로드 횟수 */
	//private String atchDelYn; /* 삭제여부(스케쥴에 의해서 파일삭제처리) */
	private String atch_reg_date; /* 등록일 */
}
