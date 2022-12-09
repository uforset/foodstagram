package com.circle.foodstagram.chat.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ChatMessage implements Serializable {

	private static final long serialVersionUID = 4969765837045883517L;
	private int cm_no;
	private String userid; // Member vo userid
	private String chat_room_id;		// 채팅방 id
	private String message;
	private Date create_date; //보낸시간

}
