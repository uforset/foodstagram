package com.circle.foodstagram.chat.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

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
import com.circle.foodstagram.chat.model.service.ChatRoomService;
import com.circle.foodstagram.chat.model.service.ChatService;
import com.circle.foodstagram.chat.model.vo.ChatRoom;
import com.circle.foodstagram.chat.model.vo.ChatRoomJoin;
import com.circle.foodstagram.member.model.vo.Member;
import com.circle.foodstagram.member.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/chat")
@Log4j
public class RoomController {
	
	@Autowired
	private ChatRoomService chatRoomService;

	@Autowired
	private ChatService chatService;
	
	@Autowired
	private MemberService memberService;
	/*
	//채팅방 목록 조회
    @GetMapping(value = "/rooms")
    public ModelAndView rooms(){

        //log.info("# All Chat Rooms");
        ModelAndView mv = new ModelAndView("chat/rooms");
        log.info(chatRoomService.findAllRooms().toString());
        mv.addObject("list", chatRoomService.findAllRooms());


        return mv;
    }
	*/
    /*
    //채팅방 개설
    @PostMapping(value = "/room")
    public String create(@RequestParam String name, RedirectAttributes rttr){


        log.info("# Create Chat Room , name: " + name);
        rttr.addFlashAttribute("roomName", chatRoomService.createChatRoomDTO(name));
        return "redirect:/chat/rooms";
    }
     */
    
    /*
    //채팅방 조회
    @GetMapping("/room")
    public String getRoom(String roomId, Model model){

    	//log.info("# get Chat Room, roomID : " + roomId);
    	log.info("# get Chat Room, roomID : " + roomId);
    	log.info("# get Chat chatRoomService.findRoomById(roomId), id? : " + chatRoomService.findRoomById(roomId));
    	//그냥 채팅방 정보(ChatRoom vo) 담는거임 어느채팅방 들어갔는지
        model.addAttribute("room", chatRoomService.findRoomById(roomId));
        
        return "chat/room";
    }
    */
    
    // new
    //채팅방 개설
    @PostMapping(value = "/room")
    public String create(@RequestParam String[] usersid, RedirectAttributes rttr){
    	//DM초대하기(채팅방만들기)
    	//사용자가 유저를 검색해서 선택하고 초대함(한명 또는 여러명)
    	//채팅방을 생성하고, 그채팅방 id를 이용해 채팅방참여자DB에 저장.
    	
    	// 랜덤UUID생성후 DB에 저장함
    	String uuid = UUID.randomUUID().toString();
    	ChatRoom chatRoom = new ChatRoom(uuid, "emp");
    	if (usersid.length == 2 && usersid[0].equals(usersid[1])) {
    		// 본인채팅방임 나혼자
    		Member me = memberService.selectMember(usersid[0]);
    		chatRoom.setTitle(me.getUsername());
    	} else if(usersid.length == 2) {
    		// 1:1 채팅방
    		chatRoom.setTitle("other");
    	}
    	
    	
    	chatService.createChatRoom(chatRoom);
    	//성공시 진행
    	
    	
    	//초대자들(본인포함) 채팅방참여DB에 저장
    	for(String userid : usersid) {
    		ChatRoomJoin join = new ChatRoomJoin();
    		join.setChat_room_id(uuid);
    		join.setUserid(userid);
    		
    		chatService.insertChatRoomJoin(join);
    	}
    	
    	log.info("참여자 목록 uuid : " + uuid);
    	for(String userid : usersid) {
    		log.info( "userid : "+ userid);
    	}
    	
        log.info("# Create Chat Room , name: " + chatRoom.getChat_room_id());
        rttr.addFlashAttribute("roomName", chatRoom.getTitle());
        return "redirect:/chat/rooms";
    }
    
    
    // 채팅방 들어감
    @GetMapping("/room")
    public String getRoom(String roomId, Model model){

    	//log.info("# get Chat Room, roomID : " + roomId);
    	log.info("# get Chat Room, roomID : " + roomId);
    	//log.info("# get Chat chatRoomService.findRoomById(roomId), id? : " + chatRoomService.findRoomById(roomId));
    	//그냥 채팅방 정보(ChatRoom vo) 담는거임 어느채팅방 들어갔는지
    	model.addAttribute("room", chatService.findRoomByUUId(roomId));
        //model.addAttribute("room", chatRoomService.findRoomById(roomId));
        
        return "chat/room";
    }
    
    //채팅방 목록 조회
    @GetMapping(value = "/rooms")
    public String room(HttpSession session, Model model){

    	Member loginMember = (Member) session.getAttribute("loginMember");
    	if(loginMember == null) {
    		model.addAttribute("message", "로그인상태가 아닙니다.");
    		return "common/error";
    	}
        //log.info("# All Chat Rooms");
        //ModelAndView mv = new ModelAndView("chat/rooms");
        //log.info(chatRoomService.findAllRooms().toString());
        //mv.addObject("list", chatRoomService.findAllRooms());
        
        log.info(chatService.findAllMyRooms(loginMember.getUserid()).toString() );
        model.addAttribute("list", chatService.findAllMyRooms(loginMember.getUserid()));

        return "chat/rooms";
    }
}
