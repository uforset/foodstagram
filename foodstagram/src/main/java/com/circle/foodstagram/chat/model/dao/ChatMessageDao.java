package com.circle.foodstagram.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.circle.foodstagram.chat.model.vo.ChatMessage;

@Repository("chatMessageDao")
public class ChatMessageDao {

	@Autowired
	private SqlSessionTemplate session;

	public int insertChatMessage(ChatMessage message) {
		// TODO Auto-generated method stub
		return session.insert("chatMessageMapper.insertChatMessage", message);
	}

	public List<ChatMessage> getChatRoomMessage(String roomId) {
		// TODO Auto-generated method stub
		return session.selectList("chatMessageMapper.getChatRoomMessage", roomId);
	}
	
	
}
