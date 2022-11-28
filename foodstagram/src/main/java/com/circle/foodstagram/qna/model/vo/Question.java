package com.circle.foodstagram.qna.model.vo;

import java.io.Serializable;
import java.util.Date;
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
public class Question implements Serializable {
	private static final long serialVersionUID = -2423916902416943885L;
	private int q_no;
	private String userid;
	private String q_title;
	private Date q_date;
	private String q_content;
	private String q_upfile;
	private String answercheck;
	
	private List<Attach> attaches ;      /*첨부파일 리스트    */ 
	
}
