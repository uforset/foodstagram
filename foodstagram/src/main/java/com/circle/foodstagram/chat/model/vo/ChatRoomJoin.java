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
public class ChatRoomJoin implements Serializable {
	

	private static final long serialVersionUID = -6469094334402005344L;
	private int crj_no;
	private String userid;
	private String chat_room_id;
}
