package com.circle.foodstagram.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.circle.foodstagram.chat.model.dao.ChatRoomDao;
import com.circle.foodstagram.chat.model.dto.ChatRoomDTO;

@Service("chatRoomService")
public class ChatRoomServiceImpl implements ChatRoomService {

	@Autowired
	private ChatRoomDao chatRoomDao;
	
	@Override
	public ChatRoomDTO createChatRoomDTO(String name) {
		return chatRoomDao.createChatRoomDTO(name);
	}

	@Override
	public List<ChatRoomDTO> findAllRooms() {
		return chatRoomDao.findAllRooms();
	}

	@Override
	public ChatRoomDTO findRoomById(String id) {
		return chatRoomDao.findRoomById(id);
	}

}
