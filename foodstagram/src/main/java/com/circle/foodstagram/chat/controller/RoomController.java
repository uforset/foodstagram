package com.circle.foodstagram.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.circle.foodstagram.chat.model.dao.ChatRoomDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/chat")
@Log4j
public class RoomController {
	
	@Autowired
	private ChatRoomDao chatRoomDao;
	
	//채팅방 목록 조회
    @GetMapping(value = "/rooms")
    public ModelAndView rooms(){

        //log.info("# All Chat Rooms");
        ModelAndView mv = new ModelAndView("chat/rooms");
        //log.info(chatRoomDao.findAllRooms().toString());
        mv.addObject("list", chatRoomDao.findAllRooms());

        return mv;
    }

    //채팅방 개설
    @PostMapping(value = "/room")
    public String create(@RequestParam String name, RedirectAttributes rttr){

    	// log.info("# Create Chat Room , name: " + name);
        rttr.addFlashAttribute("roomName", chatRoomDao.createChatRoomDTO(name));
        return "redirect:/chat/rooms";
    }

    //채팅방 조회
    @GetMapping("/room")
    public void getRoom(String roomId, Model model){

    	//log.info("# get Chat Room, roomID : " + roomId);

        model.addAttribute("room", chatRoomDao.findRoomById(roomId));
    }
}
