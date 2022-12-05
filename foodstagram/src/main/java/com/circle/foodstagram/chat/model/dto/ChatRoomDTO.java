package com.circle.foodstagram.chat.model.dto;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import com.circle.foodstagram.member.model.vo.Member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomDTO implements Serializable {

	private static final long serialVersionUID = 6175633549024949259L;
	private String roomId;
    private String name; //채팅방 이름 기본: 1명일경우 상대방 이름, 3명까지 홍길동, 이순신, 누구누구
    						//4명이상 길동, 이순신, 누구누구님 외 ~명
    //private Set<WebSocketSession> sessions = new HashSet<>();
    //WebSocketSession은 Spring에서 Websocket Connection이 맺어진 세션
    private List<Member> s;
    
    public static ChatRoomDTO create(String name){
        ChatRoomDTO room = new ChatRoomDTO();

        room.roomId = UUID.randomUUID().toString();
        room.name = name;
        return room;
    }


}