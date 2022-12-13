package com.circle.foodstagram.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.circle.foodstagram.chat.model.vo.ChatRoomJoin;

@Repository("chatRoomJoinDao")
public class ChatRoomJoinDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public List<ChatRoomJoin> getChatRoomJoinByRoomId(String RoomId) {
		return session.selectList("chatRoomJoinMapper.getChatRoomJoinByRoomId", RoomId);
	}
	
	public int insertChatRoomJoin(ChatRoomJoin chatRoomJoin) {
		return session.insert("chatRoomJoinMapper.insertChatRoomJoin", chatRoomJoin);
	}

	public int deleteChatRoomJoin(Map<String, Object> map) {
		return session.delete("chatRoomJoinMapper.deleteChatRoomJoin",map);
	}
}
