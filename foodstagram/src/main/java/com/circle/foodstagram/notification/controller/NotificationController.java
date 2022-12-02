package com.circle.foodstagram.notification.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.circle.foodstagram.notification.model.service.NotificationService;
import com.circle.foodstagram.notification.model.vo.Notification;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class NotificationController {
	
	@Autowired
	NotificationService notificationService;
	
	
	@GetMapping("readCheck.do")
	@ResponseBody
	public String readCheckMethod(
			@RequestParam String userid) {
		log.info("in readCheckMethod");
		//readcheck 정보 요청
		Notification n = notificationService.selectNotification(userid);
		log.info("notification : " + n);
		
		//n.getN_readcheck();

		JSONObject json = new JSONObject();
		
		if(n.getN_readcheck().equals("Y")) {
			//model.addAttribute("read", "read");
			json.put("read", "read");
		}else {
			//model.addAttribute("read", "unread");
			json.put("read", "unread");
		}
		
		return json.toJSONString();
	}
	
}
