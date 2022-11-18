package com.circle.foodstagram.member.model.vo;

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
public class Member implements Serializable{

	private static final long serialVersionUID = -8711503667562197576L;
	
	private String userid;
	private String userpwd;
	private String username;
	private String gender;
	private java.sql.Date birth_date;
	private String email;
	private String loginok;
	private String admin;

	
}