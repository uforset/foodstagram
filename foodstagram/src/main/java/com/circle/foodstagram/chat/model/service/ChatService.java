package com.circle.foodstagram.chat.model.service;

import java.util.List;
import java.util.Map;

import com.circle.foodstagram.chat.model.vo.ChatMessage;
import com.circle.foodstagram.chat.model.vo.ChatRoom;
import com.circle.foodstagram.chat.model.vo.ChatRoomJoin;

public interface ChatService {

	int createChatRoom(ChatRoom chatRoom);
	List<ChatRoom> findAllMyRooms(String userid);
	ChatRoom findRoomByUUId(String id);
	
	List<ChatRoomJoin> getChatRoomJoinByRoomId(String RoomId);
	int insertChatRoomJoin(ChatRoomJoin chatRoomJoin);
	
	int insertChatMessage(ChatMessage message);
	List<ChatMessage> getChatRoomMessage(String RoomId);
	List<ChatMessage> getChatMessageRowLimitingClausePaging(Map<String, Object> map);
	
	int deleteMessage(int cm_no);
	int updateRoomTitle(ChatRoom room);
	int deleteChatRoomJoin(Map<String, Object> map);
}
