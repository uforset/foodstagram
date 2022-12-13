package com.circle.foodstagram.member.model.vo;

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
public class KakaoVO implements java.io.Serializable{
	 
	private static final long serialVersionUID = 8217648185857462217L;
	
	private String username;
	private String email;
	private String userid;
	

}
