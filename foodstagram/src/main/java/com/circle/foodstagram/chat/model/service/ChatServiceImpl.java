package com.circle.foodstagram.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.chat.model.dao.ChatMessageDao;
import com.circle.foodstagram.chat.model.dao.ChatRoomDao;
import com.circle.foodstagram.chat.model.dao.ChatRoomJoinDao;
import com.circle.foodstagram.chat.model.vo.ChatMessage;
import com.circle.foodstagram.chat.model.vo.ChatRoom;
import com.circle.foodstagram.chat.model.vo.ChatRoomJoin;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatRoomDao chatRoomDao;
	
	@Autowired
	private ChatRoomJoinDao chatRoomJoinDao;
	
	@Autowired
	private ChatMessageDao chatMessageDao;
	
	
	@Override
	public int createChatRoom(ChatRoom chatRoom) {
		// TODO Auto-generated method stub
		return chatRoomDao.createChatRomm(chatRoom);
	}

	@Override
	public List<ChatRoom> findAllMyRooms(String userid) {
		return chatRoomDao.findAllMyRooms(userid);
	}

	@Override
	public ChatRoom findRoomByUUId(String id) {
		return chatRoomDao.findRoomByUUId(id);
	}

	@Override
	public List<ChatRoomJoin> getChatRoomJoinByRoomId(String RoomId) {
		return chatRoomJoinDao.getChatRoomJoinByRoomId(RoomId);
	}

	@Override
	public int insertChatRoomJoin(ChatRoomJoin chatRoomJoin) {
		// TODO Auto-generated method stub
		return chatRoomJoinDao.insertChatRoomJoin(chatRoomJoin);
	}

	@Override
	public int insertChatMessage(ChatMessage message) {
		// TODO Auto-generated method stub
		return chatMessageDao.insertChatMessage(message);
	}

	@Override
	public List<ChatMessage> getChatRoomMessage(String RoomId) {
		// TODO Auto-generated method stub
		return chatMessageDao.getChatRoomMessage(RoomId);
	}

}
