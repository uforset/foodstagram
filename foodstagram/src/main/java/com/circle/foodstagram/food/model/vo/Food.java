package com.circle.foodstagram.food.model.vo;

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
public class Food implements Serializable {
	private static final long serialVersionUID = 3141172544544421705L;
	
	private int fno;
	private String fname;
	private String fsize;
	private String kcal;
	private String carb;
	private String protein;
	private String fat;

}
