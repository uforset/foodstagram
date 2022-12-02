package com.circle.foodstagram.notification.model.vo;

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
public class Notification implements Serializable {
			private static final long serialVersionUID = 5705845915310101145L;
			
			private String userid;
			private String n_readcheck;	
}
