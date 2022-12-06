package com.circle.foodstagram.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import com.circle.foodstagram.common.attach.model.vo.Attach;

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
public class Notice implements Serializable {
	private static final long serialVersionUID = 1471945737302217844L;
	
	private int noticeno;
	private String userid;
	private String noticetitle;
	private Date noticedate;
	private String noticecontent;
	//private String notice_upfile;
	//private String notice_refile;
	private int readcount;
	private int importance;
	
	private List<Attach> attaches ;      /*첨부파일 리스트    */ 
	private int[] delAtchNos;  			/*삭제를 위한 글 번호  */
}
