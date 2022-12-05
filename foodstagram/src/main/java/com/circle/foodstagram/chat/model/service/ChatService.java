package com.circle.foodstagram.chat.model.service;

import java.util.List;

import com.circle.foodstagram.chat.model.vo.ChatRoom;
import com.circle.foodstagram.chat.model.vo.ChatRoomJoin;

public interface ChatService {

	int createChatRoom(ChatRoom chatRoom);
	List<ChatRoom> findAllMyRooms(String userid);
	ChatRoom findRoomByUUId(String id);
	
	List<ChatRoomJoin> getChatRoomJoinByRoomId(String RoomId);
	int insertChatRoomJoin(ChatRoomJoin chatRoomJoin);
}
