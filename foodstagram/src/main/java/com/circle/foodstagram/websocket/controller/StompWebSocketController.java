package com.circle.foodstagram.websocket.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.circle.foodstagram.chat.model.dto.ChatMessageDTO;
import com.circle.foodstagram.chat.model.vo.ChatMessage;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class StompWebSocketController {

//	@MessageMapping("/hello/{roomNo}")
//	@SendTo("/subscribe/chat/{roomNo}")
//	public ResponseEntity<String> stomp(String request) {
//		return new ResponseEntity<String>(request, HttpStatus.OK);
//	}

//	@MessageMapping("/hello/{roomNo}")
//	@SendTo("/subscribe/chat/{roomNo}")
//	public Chat stomp(Chat chat) {
//		chat.setSendDate(new Date());
//		
//		return chat;
//	}
	@Autowired
	private SimpMessagingTemplate template;

	
	
	// 채팅뷰 JSP로 연결시키는 메소드
	// 일단 채팅방 목록으로 연결함.
	@GetMapping("chatting.do")
	public String moveChatRoom(Model model, HttpServletRequest req) {
		// 접속한 ip주소를 확인하여 차후 사용자 비교에 사용하기
		model.addAttribute("host", req.getRemoteAddr());
		return "redirect:/chat/rooms";
	}

	// Client가 SEND할 수 있는 경로
	// stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
	// "/pub/chat/enter"

	@MessageMapping(value = "/chat/enter")
	public void enter(ChatMessage message) {
		message.setMessage(message.getUserid() + "님이 채팅방에 참여하였습니다.");
		template.convertAndSend("/sub/chat/room/" + message.getChat_room_id(), message);
	}

	@MessageMapping(value = "/chat/message")
	public void message(ChatMessage message) {
		log.info("send message....");
		//메세지 DB인풋
		message.setCreate_date(new Date());
		
		
		template.convertAndSend("/sub/chat/room/" + message.getChat_room_id(), message);
	}

}
