package com.circle.foodstagram.chat.model.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

import com.circle.foodstagram.chat.model.dto.ChatRoomDTO;
import com.circle.foodstagram.chat.model.vo.ChatRoom;

import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Repository("chatRoomDao")
@Log4j
public class ChatRoomDao {

	private Map<String, ChatRoomDTO> chatRoomDTOMap;

	@Autowired
	private SqlSessionTemplate session;
	
	@PostConstruct
	private void init() {
		chatRoomDTOMap = new LinkedHashMap<>();
	}
	
	public List<ChatRoomDTO> findAllRooms() {
		// 채팅방 생성 순서 최근 순으로 반환
		List<ChatRoomDTO> result = new ArrayList<>(chatRoomDTOMap.values());
		Collections.reverse(result);
		log.info("in findAllRooms");
		return result;
	}

	public ChatRoomDTO findRoomById(String id) {
		return chatRoomDTOMap.get(id);
	}


	
	public ChatRoomDTO createChatRoomDTO(String name) {
		ChatRoomDTO room = ChatRoomDTO.create(name);
		chatRoomDTOMap.put(room.getRoomId(), room);

		return room;
	}
	
////////////////	
	public List<ChatRoom> findAllMyRooms(String userid) {
		// 채팅방 생성 순서 최근 순으로 반환
		List<ChatRoom> result = session.selectList("chatRoomMapper.findAllMyRooms", userid);
		Collections.reverse(result);
		log.info("in findAllMyRooms");
		return result;
	}
	
	//채팅방 vo반환
	public ChatRoom findRoomByUUId(String id) {
		return session.selectOne("chatRoomMapper.findRoomByUUId", id);
	}
	
	public int createChatRomm(ChatRoom chatRoom) {
		return session.insert("chatRoomMapper.insertChatRoom", chatRoom);
	}

	public int updateRoomTitle(ChatRoom room) {
		return session.update("chatRoomMapper.updateRoomTitle", room);
	}
	
}
