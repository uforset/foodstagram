package com.circle.foodstagram.qna.model.vo;

import java.io.Serializable;
import java.util.Date;

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
public class Answer implements Serializable {
	private static final long serialVersionUID = 1700957539688310524L;
	private int a_id;
	private int a_ref;
	private String userid;
	private Date a_date;
	private String a_content;
}
