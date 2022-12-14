package com.circle.foodstagram.chat.model.dao;


import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;


import com.circle.foodstagram.chat.model.vo.ChatRoom;

import lombok.extern.log4j.Log4j;

@Repository("chatRoomDao")
@Log4j
public class ChatRoomDao {


	@Autowired
	private SqlSessionTemplate session;
	
	
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
