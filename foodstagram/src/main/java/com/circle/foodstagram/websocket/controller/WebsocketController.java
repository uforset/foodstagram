package com.circle.foodstagram.websocket.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebsocketController {
	// 채팅뷰 JSP로 연결시키는 메소드
	
	@GetMapping("chatting.do")
	public String chatting(Model model, HttpServletRequest req) {
		// 접속한 ip주소를 확인하여 차후 사용자 비교에 사용하기 
		model.addAttribute("host", req.getRemoteAddr());
		return "chat/chattingView";
	}
	
}
