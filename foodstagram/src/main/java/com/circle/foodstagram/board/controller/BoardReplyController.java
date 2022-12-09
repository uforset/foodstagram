package com.circle.foodstagram.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.circle.foodstagram.board.model.service.BoardReplyService;
import com.circle.foodstagram.board.model.vo.Board;
import com.circle.foodstagram.board.model.vo.BoardAttach;
import com.circle.foodstagram.board.model.vo.BoardReply;

@Controller
public class BoardReplyController {
	private static final Logger logger = LoggerFactory.getLogger(BoardReplyController.class);
	private static JSONParser jsonParser = new JSONParser();

	@Autowired
	private BoardReplyService boardReplyService;

	// 게시 댓글 등록 처리용
	@RequestMapping(value = "rinsert.do", method = RequestMethod.POST)
	public String boardInsertMethod(BoardReply boardReply, Model model) {
		// 글등록
		if (boardReplyService.insertBoardReply(boardReply) > 0) {
			return "redirect:bdetail.do?b_no=" + boardReply.getB_no();
		} else {
			model.addAttribute("message", "게시글 등록 실패");
			return "common/error";
		}
	}

	// 게시 댓글 삭제 처리용
	@RequestMapping(value = "rdel.do", method = RequestMethod.GET)
	public String deleteBoardReply(@RequestParam("b_reply_no") int b_reply_no, @RequestParam("b_no") int b_no, Model model) {
		// 댓글 삭제
		if (boardReplyService.deleteBoardReply(b_reply_no) > 0) {
			return "redirect:bdetail.do?b_no=" + b_no;
		} else {
			model.addAttribute("message", "게시글 등록 실패");
			return "common/error";
		}
	}

	// 댓글 수정
	@RequestMapping(value="rupdate.do", method=RequestMethod.GET)
	public String boardReplyUpdateMethod(BoardReply boardreply, Model model) {
		if(boardReplyService.updataBoardReply(boardreply) > 0) {
			return "redirect:bdetail.do?b_no="+ boardreply.getB_no();
		}else {
			model.addAttribute("message", boardreply.getB_reply_no() + "번 댓글 수정 실패");
			return "common/error";
		}
	}
}
