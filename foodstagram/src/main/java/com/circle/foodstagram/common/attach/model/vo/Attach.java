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
	private int atchNo; /* 첨부파일 번호(PK) */
	private int atchParentNo; /* 부모글의 PK */
	private String atchCategory; /* 상위글 분류(BOARD, FREE, QNA, PDS 등) */
	private String atchFileName; /* 실제 저장된 파일명 */
	private String atchOriginalName; /* 사용자가 올린 원래 파일명 */
	private long atchFileSize; /* 파일 사이즈   1024,  1024*1024 */
	private String atchFancySize; /* 팬시 사이즈  : 1KB , 1MB   */
	private String atchContentType; /* 컨텐츠 타입 */
	private String atchPath; /* 저장 경로(board/2020) */
	private int atchDownHit; /* 다운로드 횟수 */
	private String atchDelYn; /* 삭제여부(스케쥴에 의해서 파일삭제처리) */
	private String atchRegDate; /* 등록일 */
}
