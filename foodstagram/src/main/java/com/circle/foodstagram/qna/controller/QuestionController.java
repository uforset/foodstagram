package com.circle.foodstagram.qna.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.circle.foodstagram.common.AttachUtils;
import com.circle.foodstagram.common.attach.model.service.AttachService;
import com.circle.foodstagram.common.attach.model.vo.Attach;
import com.circle.foodstagram.member.model.vo.Member;
import com.circle.foodstagram.qna.model.service.QnaService;
import com.circle.foodstagram.qna.model.vo.Answer;
import com.circle.foodstagram.qna.model.vo.Question;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class QuestionController {

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private AttachUtils attachUtils;
	
	@Autowired
	private AttachService attachService;
	
	// 페이지 이동 메소드
	@GetMapping("question.do")
	public String moveQuestionView(HttpSession session, Model model) {
		try {
			Member loginMember = (Member) session.getAttribute("loginMember");
			//String userid = loginMember.getUserid();
			boolean checkAdmin = loginMember.getAdmin().equals("Y");
			if (checkAdmin) {
				//관리자인경우
				return "redirect:questionManage.do";
			} else {
				//관리자가 아닌경우
				return "qna/question";
			}
			
		} catch (Exception e) {
			// 아마 로그인상태가 아닌경우
			model.addAttribute("message", "로그인상태가 아닙니다.");
			return "common/error";
		}
	}
	
	@GetMapping("questionReg.do")
	public String moveQuestionRegForm() {
		return "qna/questionReg";
	}
	
	@GetMapping("questionReg.do/{id}")
	public String moveQuestionModifyForm(
				@PathVariable Integer id, Model model) {
		
		Question q;
		if( (q = qnaService.getQuestion(id)) != null) {
			model.addAttribute("q", q);
			return "qna/questionEdit";
		} else {
			model.addAttribute("message", "질문 가져오는중 오류발생");
			return "common/error";
		}
	}
	
	@GetMapping("questionList.do") //임시
	public String moveQuestionList() {
		return "qna/questionList";
	}
	
	@GetMapping("QuestionModifyView.do") //수정뷰 이동
	public String QuestionModifyViewMethod() {
		return "qna/questionEdit";
	}
	// end
	
	//나의 질문리스트 (사용자)
	@GetMapping("myQuestionListView.do")
	public ModelAndView myQuestionListMethod(
			@RequestParam(name="page", required=false) String page,
			//@RequestParam(name="userid",required=false) String userid,
			HttpSession session,
			ModelAndView mv) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		Member loginMember = ((Member)session.getAttribute("loginMember"));
		String userid = loginMember.getUserid();
		//관리자인지 확인
		if( loginMember != null && loginMember.getAdmin().equals("Y")  ) {
			mv.setViewName("redirect:questionManage.do");
			return mv;
		}
		//로그인 판단 인터셉터에서 하면 좋을지도
		
		if(userid == null) {
			mv.addObject("message", " 로그인 상태가 아님.");
			mv.setViewName("common/error");
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int listCount=0;
		int limit = 10; 
		listCount= qnaService.selectMyListCount(userid);
		log.info("당신의 질문개수 : " + listCount);
		// 페이징 계산
		int maxPage = (int)((double)listCount / limit + 0.9);

		int endPage = (int)(Math.ceil(currentPage / 10.0)) * 10;
		int startPage = endPage-9;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		//페이징 계산 처리 끝 ---------------------------------------
		ArrayList<Question> list = null;
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("userid", userid);
		list = qnaService.selectMyQuestionList(map); //나의 질문리스트 검색 row userid전달
		if(list != null && list.size() > 0) {
			log.info("리스트확인");
			log.info(list);
			for(Question q : list) {
				log.info(q);
			}
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);
			
			mv.setViewName("qna/questionList");
		} else {
			mv.addObject("message", 
					currentPage + " 나의 질문 목록 조회 실패.");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "insertQuestion.do", method = RequestMethod.POST)
	public String insertQuestionMethod(
			@RequestParam(name="boFiles", required=false)MultipartFile[] boFiles
			, Question question
			, HttpServletRequest request) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		
		//question.setQ_date(new Date()); db에서 SYSDATE DEFAULT임
		
		if (boFiles != null) {
			// 첨부파일이 있을때
			// question.setAttaches(파일리스트); 넣어줌
		}
		// 첨부파일 처리

		try {
			if(boFiles != null && boFiles.length > 0) {
				 //String savePath = request.getSession().getServletContext().getRealPath("resources/question_upfiles");
				 List<Attach> attaches=
						 attachUtils.getAttachListByMultiparts(boFiles, "Question", "question_upfiles", request);
		         //실제로 파일경로에 선택된 파일 올리고 List<Attach> return  (파일업로드)
				 // (boFiles, 게시판, 폴더이름)
				 log.info(attaches);
				 question.setAttaches(attaches);
			}
			
		} catch (Exception e) {
			log.info("파일 업로드중 에러발생");
			e.printStackTrace();
		}
		
		// 글등록
		question.setQ_date(new Date());
		if( qnaService.insertQuestion(question) > 0 ) {
			log.info("질문등록성공" + question.toString());
			//strResult = "{ \"result\":\"success\" }";
		} else {
			log.info("질문등록실패");
		}		
		List<Attach> attaches= question.getAttaches();
		int q_no = question.getQ_no();
		if( attaches != null && attaches.size()>0) {
			for(Attach a : attaches) { // 하나씩 db에 저장
				a.setAtch_parent_no(q_no); // 저장한 게시글번호 첨부파일vo에 세팅
				log.info("db에저장할 첨부파일vo" + a);
				if( attachService.insertAttach(a) > 0 ) {// 하나씩 db에 저장
					log.info("성공! " + a);
				} else {
					log.info("실패..." + a);
					return strResult;
				}
			}
		}
		strResult = "{ \"result\":\"success\" }";	
		return strResult;
	}
	
	@GetMapping("qnaDetail.do")
	public String moveQuestionDetailMethod(
			Model model
			,int q_no) {
		
		Question q = qnaService.getQuestion(q_no);	// 이거하나로 질문에연결된 첨부파일도 List에 세팅이 됨 resultMap 이용 mapper참고	
		//q.getAttaches() 
		
		// 답글이 있을경우 답글도 넣어줌
		if( q.getAnswercheck().equals("Y") ) { //답변존재 
			Answer a = qnaService.getAnswer(q.getQ_no());
			model.addAttribute("a", a);
		}
		
		model.addAttribute("q", q);

		return "qna/qnaDetail";
	}
	
	
	@PostMapping("questionModify.do")
	@ResponseBody
	public String updateQuestionMethod(
			@RequestParam(name="boFiles", required=false)MultipartFile[] boFiles,
			Question question,
			HttpServletRequest request) {
		String strResult = "{ \"result\":\"FAIL\" }";
		
		// 잘가져옴. 이것을 이용해서 db에서 데이터 삭제시킨후 로컬서버에서도 첨부파일 삭제시키면됨
		//for( int a_no :  question.getDelAtchNos())
		//	log.info(a_no);
		
		// atch no를 이용해 db에 저장된 이름을 가져온후 파일을 삭제하고, db에도 atch no를 이용하여 삭제함.
		// question.getDelAtchNos() 수정중 삭제할파일이 있을경우 진행함. 
		if(question.getDelAtchNos() !=null && question.getDelAtchNos().length > 0) { // 파일 삭제한경우
			log.info("질문 수정중 파일수정확인. 파일제거 시작");
			List<Attach> attaches = new ArrayList<Attach>();
			
			for( int atch_no :  question.getDelAtchNos()) { 
				attaches.add(attachService.getAttach(atch_no)); //하나씩 가져와서 List에 저장 
			}
			
			// 저장된 파일 삭제처리	getDeletAtchNoList() 첨부파일들을 삭제하고 삭제한 기본키를 리스트로 리턴함(서버에서 파일삭제)
			List<Integer> atchNoList = attachUtils.getDeletAtchNoList(attaches, "question_upfiles", request);
			for( int atch_no : atchNoList) {
				attachService.deleteAttach(atch_no);	// DB에서 파일삭제
				log.info(atch_no + "번 첨부파일 DB제거완료.");
			}
		}
		
		
		try { 
			//첨부파일이 있다면 등록함.
			// 파일 로컬에 업로드
			if(boFiles != null && boFiles.length > 0) {
				 List<Attach> attaches=
						 attachUtils.getAttachListByMultiparts(boFiles, "Question", "question_upfiles", request);
		         //실제로 파일경로에 선택된 파일 올리고 List<Attach> return  (파일업로드)
				 // (boFiles, 게시판, 폴더이름)
				 log.info(attaches);
				 question.setAttaches(attaches);
				 
					// DB에 저장
				//List<Attach> attaches= question.getAttaches();
				int q_no = question.getQ_no();
				if( attaches != null && attaches.size()>0) {
					for(Attach a : attaches) { // 하나씩 db에 저장
						a.setAtch_parent_no(q_no); // 저장한 게시글번호 첨부파일vo에 세팅
						log.info("db에저장할 첨부파일vo" + a);
						if( attachService.insertAttach(a) > 0 ) {// 하나씩 db에 저장
							log.info("성공! " + a);
						} else {
							log.info("실패..." + a);
							return strResult;
						}
					}
				} 
			}
			
			// 업로드후 질문update
			question.setQ_date(new Date());
			if (qnaService.updateQuestion(question) > 0) {
				log.info("질문수정 성공.");
				strResult = "{ \"result\":\"success\" }";
			} else {
				log.info("질문수정중 오류발생.");
				return strResult;
			}
			
		} catch (Exception e) {
			log.info("파일 업로드중 에러발생");
			e.printStackTrace();
		}

		return strResult;
	}
	
	
	

	// 질문 리스트보기 (관리자)
	@GetMapping("questionManage.do")
	public ModelAndView getQuestionAllListMethod(
			@RequestParam(name="page", required=false) String page,
			HttpSession session, ModelAndView mv) {
		try {
			Member loginMember = (Member) session.getAttribute("loginMember");
			//String userid = loginMember.getUserid();
			boolean checkAdmin = loginMember.getAdmin().equals("Y");
			if (checkAdmin) {
				//관리자인경우
				
				Map<String,Object> map = new HashMap<String,Object>();
				
				
				int currentPage = 1;
				if(page != null) {
					currentPage = Integer.parseInt(page);
				}
				
				int listCount=0;
				int limit = 10; 
				listCount = qnaService.selectListCount();
				log.info("등록된 질문개수 : " + listCount);
				// 페이징 계산
				int maxPage = (int)((double)listCount / limit + 0.9);

				int endPage = (int)(Math.ceil(currentPage / 10.0)) * 10;
				int startPage = endPage-9;
				
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;
				
				//페이징 계산 처리 끝 ---------------------------------------
				ArrayList<Question> list = null;
				map.put("startRow", startRow);
				map.put("endRow", endRow);
				//map.put("userid", userid);
				list = qnaService.selectAllQuestionList(map); //모든 질문리스트 검색 row userid전달
				if(list != null && list.size() > 0) {
					log.info("리스트확인");
					log.info(list);
					for(Question q : list) {
						log.info(q);
					}
					mv.addObject("list", list);
					mv.addObject("listCount", listCount);
					mv.addObject("maxPage", maxPage);
					mv.addObject("currentPage", currentPage);
					mv.addObject("startPage", startPage);
					mv.addObject("endPage", endPage);
					mv.addObject("limit", limit);
					
					mv.setViewName("qna/questionAllList");
				} else {
					mv.addObject("message", currentPage + " 질문 목록 조회 실패.");
					mv.setViewName("common/error");
				}

			} else {
				//관리자가 아닌경우
				mv.addObject("message", "관리자가 아닙니다.");
				mv.setViewName("common/error");
			}
			
		} catch (Exception e) {
			// 로그인상태가 아닌경우
			mv.addObject("message", "로그인상태가 아닙니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@PostMapping("questionDelete.do")
	@ResponseBody
	public String deleteQuestionMethod( 
			Question question,
			HttpServletRequest request) {
		String strResult = "{ \"result\":\"FAIL\" }";
		
		try {
			// 삭제를위해 첨부파일들 가져오는 작업
			question = qnaService.getQuestion(question.getQ_no()); 
			// 가져옴.
			List<Attach> attaches = question.getAttaches();
			log.info(attaches);
			//첨부파일이 있을경우 삭제
			if (attaches !=null && attaches.size() > 0) {
				// 저장된 파일 삭제처리	getDeletAtchNoList() 첨부파일들을 삭제하고 삭제한 기본키를 리스트로 리턴함(서버에서 파일삭제)
				List<Integer> atchNoList = attachUtils.getDeletAtchNoList(attaches, "question_upfiles", request);
				for( int atch_no : atchNoList) {
					attachService.deleteAttach(atch_no);	// DB에서 파일삭제
					log.info(atch_no + "번 첨부파일 DB제거완료.");
				} 
			}// 첨부파일 제거끝
			
			//첨부파일 제거후 질문글 삭제
			
			if ( qnaService.deleteQuestion(question.getQ_no()) > 0) {
				log.info("질문 삭제 성공.");
				strResult = "{ \"result\":\"success\" }";
			} else {
				log.info("질문 삭제 실패.");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			return strResult;
		}
		
		
		return strResult;
	}
}
