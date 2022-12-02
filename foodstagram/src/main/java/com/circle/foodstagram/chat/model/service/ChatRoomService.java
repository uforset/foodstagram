package com.circle.foodstagram.chat.model.service;

import java.util.List;

import com.circle.foodstagram.chat.model.dto.ChatRoomDTO;

public interface ChatRoomService {
	ChatRoomDTO createChatRoomDTO(String name);
	List<ChatRoomDTO> findAllRooms();
	ChatRoomDTO findRoomById(String id);
}
