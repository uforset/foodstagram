package com.circle.foodstagram.chat.model.dao;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.batch.MyBatisPagingItemReader;
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
		List<ChatMessage> list= session.selectList("chatMessageMapper.getChatRoomMessage", roomId);
		Collections.reverse(list);
		return list;
	}
	
	public List<ChatMessage> getChatMessageRowLimitingClausePaging(Map<String, Object> map) {
		return session.selectList("chatMessageMapper.getChatMessageRowLimitingClausePaging", map);
	}

	public int deleteMessage(int cm_no) {
		return session.delete("chatMessageMapper.deleteMessage", cm_no);
	}
}
