package com.circle.foodstagram.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.circle.foodstagram.common.AttachUtils;
import com.circle.foodstagram.common.Paging;
import com.circle.foodstagram.common.SearchDate;
import com.circle.foodstagram.common.SearchPaging;
import com.circle.foodstagram.common.attach.model.service.AttachService;
import com.circle.foodstagram.common.attach.model.vo.Attach;
import com.circle.foodstagram.member.model.vo.Member;
import com.circle.foodstagram.notice.model.service.NoticeService;
import com.circle.foodstagram.notice.model.vo.Notice;
import com.circle.foodstagram.notification.model.service.NotificationService;
import com.circle.foodstagram.qna.model.vo.Question;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private AttachUtils attachUtils;

	@Autowired
	private AttachService attachService;

	@Autowired
	private NotificationService notificationService;

	// 뷰 페이지 이동 처리용 ---------------------------------------------------------------

	// 새 공지글 등록 페이지로 이동
	@RequestMapping("movewrite.do")
	public String moveWritePage() {
		return "notice/noticeWriteForm";
	}

	// 공지글 수정페이지로 이동
	@RequestMapping("nmoveup.do")
	public String moveUpdatePage(@RequestParam("noticeno") int noticeno, Model model) {
		// 수정페이지에 출력할 해당 공지글 다시 조회함
		Notice notice = noticeService.selectNotice(noticeno);

		if (notice != null) {
			model.addAttribute("notice", notice);
			return "notice/noticeUpdateForm";
		} else {
			model.addAttribute("message", noticeno + "번 공지글 수정페이지로 이동 실패!");
			return "common/error";
		}
	}

	// --------------------------------------------------------------

	// 공지사항 전체 목록보기 요청 처리용
	@RequestMapping("nlist.do")
	public ModelAndView noticeListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv,
			Model model, HttpSession session) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		int limit = 10; // 한 페이지에 출력할 목록 갯수

		int listCount = noticeService.selectListCount();

		int maxPage = (int) ((double) listCount / limit + 0.9);

		int startPage = (currentPage / 10) * 10 + 1;

		int endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Paging paging = new Paging(startRow, endRow);

		// 페이징 계산 처리 끝 ---------------------------------------

		// NEW 아이콘 달기 : 공지글 리스트에서 새 글 제목옆에 NEW 표시
		/*
		 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); Calendar cld =
		 * Calendar.getInstance(); cld.add(Calendar.DAY_OF_MONTH, -7); String nowday =
		 * sdf.format(cld.getTime());
		 * 
		 * model.addAttribute("nowday",nowday);
		 */

		// ---------------------------------------------------------------

		ArrayList<Notice> list = noticeService.selectList(paging);
		for(Notice n : list) {
			Notice n2 = noticeService.selectNotice(n.getNoticeno());
			n.setAttaches(n2.getAttaches());
		}
		for(Notice n : list) {
			log.info(n);
		}
		
		// 공지사항 listView로 이동시 readCheck Y로 업데이트 해줌
		String userid = ((Member) session.getAttribute("loginMember")).getUserid();
		notificationService.updateNotification(userid);
		// notification의 readCheck를 userid 를 이용해서 Y로 업데이트

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

			mv.setViewName("notice/noticeListView");
		} else {
			mv.addObject("message", currentPage + " 페이지 목록 조회 실패.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// --------------------------------------------------------------

	// 공지글 제목 검색용
	@RequestMapping(value = "nsearchTitle.do", method = RequestMethod.GET)
	public String noticeSearchTitleMethod(@RequestParam("keyword") String keyword,
			@RequestParam(name = "page", required = false) String page, Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지에 게시글 10개씩 출력되게 하는 경우
		// 페이징 계산 처리 -- 별도의 클래스로 작성해도 됨 ---------------
		// 별도의 클래스의 메소드에서 Paging 을 리턴하면 됨
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 전체 검색 키워드 갯수 계산을 위해 총 목록 갯수 조회해 옴
		int listCount = noticeService.selectSearchTListCount(keyword);
		// 페이지 수 계산
		// 주의 : 목록이 11개이면 페이지 수는 2페이지가 됨
		// 나머지 목록 1개도 1페이지가 필요함
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값 지정
		// => 뷰 아래쪽에 표시할 페이지 수를 10개로 하는 경우
		int startPage = (currentPage / 10) * 10 + 1;
		// 현재 페이지가 포함된 페이지 그룹의 끝값 지정
		int endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 적용할 목록의 시작행과 끝행 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		// 페이징 계산 처리 끝 ---------------------------------------
		SearchPaging searchpaging = new SearchPaging(keyword, startRow, endRow);

		ArrayList<Notice> list = noticeService.selectSearchTitle(searchpaging);

		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("limit", limit);
			model.addAttribute("action", "title");
			model.addAttribute("keyword", keyword);
			return "notice/noticeListView";
		} else {
			model.addAttribute("message", keyword + "로 검색된 공지글 정보가 없습니다.");
			return "common/error";
		}
	}

	// 공지글 등록날짜 검색용
	@RequestMapping(value = "nsearchDate.do", method = RequestMethod.GET)
	public String noticeSearchDateMethod(SearchDate date, @RequestParam(name = "page", required = false) String page,
			Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지에 게시글 10개씩 출력되게 하는 경우
		// 페이징 계산 처리 -- 별도의 클래스로 작성해도 됨 ---------------
		// 별도의 클래스의 메소드에서 Paging 을 리턴하면 됨
		int limit = 10; // 한 페이지에 출력할 목록 갯수
		// 전체 페이지 갯수 계산을 위해 총 목록 갯수 조회해 옴
		int listCount = noticeService.selectSearchDListCount(date);
		// 페이지 수 계산
		// 주의 : 목록이 11개이면 페이지 수는 2페이지가 됨
		// 나머지 목록 1개도 1페이지가 필요함
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값 지정
		// => 뷰 아래쪽에 표시할 페이지 수를 10개로 하는 경우
		int startPage = (currentPage / 10) * 10 + 1;
		// 현재 페이지가 포함된 페이지 그룹의 끝값 지정
		int endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 적용할 목록의 시작행과 끝행 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		// 페이징 계산 처리 끝 ---------------------------------------
		SearchPaging searchpaging = new SearchPaging(date.getBegin(), date.getEnd(), startRow, endRow);
		ArrayList<Notice> list = noticeService.selectSearchDate(searchpaging);

		if (list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("listCount", listCount);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("limit", limit);
			model.addAttribute("action", "date");
			model.addAttribute("begin", date.getBegin());
			model.addAttribute("end", date.getEnd());
			return "notice/noticeListView";
		} else {
			model.addAttribute("message", "해당 날짜에 등록된 공지사항 정보가 없습니다. 검색 앞뒤 날짜를 포함하여 다시 검색해주세요");
			return "common/error";
		}
	}

	// 공지글 상세보기 요청 처리용
	@RequestMapping("ndetail.do")
	public String noticeDetailMethod(Model model, @RequestParam("noticeno") int noticeno,
			@RequestParam(name = "page", required = false) String page, HttpSession session) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 조회수 1증가 처리
		noticeService.updateAddReadcount(noticeno);

		Notice notice = noticeService.selectNotice(noticeno);

		if (notice != null) {
			model.addAttribute("notice", notice);
			model.addAttribute("currentPage", currentPage);

			Member loginMember = (Member) session.getAttribute("loginMember");
			if (loginMember != null && loginMember.getAdmin().equals("Y")) {
				// 관리자가 상세보기를 요청했을 때
				return "notice/noticeAdminDetailView";
			} else {
				return "notice/noticeDetailView";
			}

		} else {
			model.addAttribute("message", noticeno + "번 게시글 조회 실패");
			return "common/error";
		}

	}

	// 공지글 삭제 요청 처리용
	@RequestMapping("ndel.do")
	public String noticeDeleteMethod(Notice notice, Model model,
			HttpServletRequest request) {
		
		try {
			// 삭제를위해 첨부파일들 가져오는 작업
			notice = noticeService.selectNotice(notice.getNoticeno()); 
			// 가져옴.
			List<Attach> attaches = notice.getAttaches();
			log.info(attaches);
			//첨부파일이 있을경우 삭제
			if (attaches !=null && attaches.size() > 0) {
				// 저장된 파일 삭제처리	getDeletAtchNoList() 첨부파일들을 삭제하고 삭제한 기본키를 리스트로 리턴함(서버에서 파일삭제)
				List<Integer> atchNoList = attachUtils.getDeletAtchNoList(attaches, "notice_upfiles", request);
				for( int atch_no : atchNoList) {
					attachService.deleteAttach(atch_no);	// DB에서 파일삭제
					log.info(atch_no + "번 첨부파일 DB제거완료.");
				} 
			}// 첨부파일 제거끝
			
			//첨부파일 제거후 질문글 삭제
			
			if ( noticeService.deleteNotice(notice.getNoticeno()) > 0) {
				log.info("질문 삭제 성공.");
			} else {
				log.info("질문 삭제 실패.");
			}
			
			
		} catch(Exception e) {
			log.info("파일 삭제중 에러발생");
			e.printStackTrace();
		}
		
		
		return "redirect:nlist.do";
	}
	
	// 파일업로드 기능이 있는 공지글 등록 요청 처리용
//	@ResponseBody (ajax때만 사용)	
	@RequestMapping(value = "ninsert.do", method = RequestMethod.POST)
	public String noticeInsertMethod(@RequestParam(name = "boFiles", required = false) MultipartFile[] boFiles,
			Notice notice, Model model, HttpServletRequest request) {

		try {
			if (boFiles != null && boFiles.length > 0) {
				// String savePath =
				// request.getSession().getServletContext().getRealPath("resources/notice_upfiles");
				List<Attach> attaches = attachUtils.getAttachListByMultiparts(boFiles, "Notice", "notice_upfiles",
						request);
				// 실제로 파일경로에 선택된 파일 올리고 List<Attach> return (파일업로드)
				// (boFiles, 게시판, 폴더이름)
				log.info(attaches);
				notice.setAttaches(attaches);
			}

		} catch (Exception e) {
			log.info("파일 업로드중 에러발생");
			e.printStackTrace();
		}

		// 글등록
		if (noticeService.insertNotice(notice) > 0) {
			log.info("공지등록성공" + notice.toString());
			// return "notice/noticeListView";
			// strResult = "{ \"result\":\"success\" }";

		} else {
			log.info("공지등록실패");
			return "common/error";
		}
		List<Attach> attaches = notice.getAttaches();
		int noticeno = notice.getNoticeno();
		if (attaches != null && attaches.size() > 0) {
			for (Attach a : attaches) { // 하나씩 db에 저장
				a.setAtch_parent_no(noticeno); // 저장한 게시글 번호 첨부파일vo에 세팅
				log.info("db에 저장할 첨부파일 vo" + a);
				if (attachService.insertAttach(a) > 0) {// 하나씩 db에 저장
					log.info("성공!" + a);					
				} else {

					log.info("첨부파일 등록 실패..." + a);
					return "common/error";
				}

			}
		}

		return "redirect:nlist.do";
	}
//	// 첨부파일 다운로드 요청 처리용
//	@RequestMapping("nfdown.do")
//	public ModelAndView fileDownMethod(ModelAndView mv, HttpServletRequest request,
//			@RequestParam("ofile") String notice_upfile, 
//			@RequestParam("rfile") String notice_refile) {
//		// 공지사항 첨부파일 저장 폴더 경로 지정
//		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");
//
//		// 저장 폴더에서 읽을 파일에 대한 파일 객체 생성함
//		File renameFile = new File(savePath + "\\" + notice_refile);
//		// 파일다운시 내보낼 파일 객체 생성
//		File originFile = new File(notice_upfile);
//
//		mv.setViewName("filedown"); // 등록된 파일다운로드 처리용 뷰클래스의 id명
//		mv.addObject("renameFile", renameFile);
//		mv.addObject("originFile", originFile);
//
//		return mv;
//	}

	// 공지글 수정 요청 처리용
	@RequestMapping("nupdate.do")
	// @ResponseBody
	public String noticeUpdateMethod(@RequestParam(name = "boFiles", required = false) MultipartFile[] boFiles,
			Notice notice, Model model, HttpServletRequest request) {

		// 공지사항 첨부파일 저장 폴더 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");

		// 잘가져옴. 이것을 이용해서 db에서 데이터 삭제시킨후 로컬서버에서도 첨부파일 삭제시키면됨
		// for( int a_no : question.getDelAtchNos())
		// log.info(a_no);

		// atch no를 이용해 db에 저장된 이름을 가져온후 파일을 삭제하고, db에도 atch no를 이용하여 삭제함.
		// notice.getDelAtchNos() 수정중 삭제할파일이 있을경우 진행함.
		if (notice.getDelAtchNos() != null && notice.getDelAtchNos().length > 0) { // 파일 삭제한경우
			log.info("질문 수정중 첨부파일수정확인. 파일제거 시작");
			List<Attach> attaches = new ArrayList<Attach>();

			for (int atch_no : notice.getDelAtchNos()) {
				attaches.add(attachService.getAttach(atch_no)); // 하나씩 가져와서 List에 저장
			}

			// 저장된 파일 삭제처리 getDeletAtchNoList() 첨부파일들을 삭제하고 삭제한 기본키를 리스트로 리턴함(서버에서 파일삭제)
			List<Integer> atchNoList = attachUtils.getDeletAtchNoList(attaches, "notice_upfiles", request);
			for (int atch_no : atchNoList) {
				attachService.deleteAttach(atch_no); // DB에서 파일삭제
				log.info(atch_no + "번 첨부파일 DB제거완료.");
			}
		}

		try {
			// 첨부파일이 있다면 등록함.
			// 파일 로컬에 업로드
			if (boFiles != null && boFiles.length > 0) {
				List<Attach> attaches = attachUtils.getAttachListByMultiparts(boFiles, "Notice", "notice_upfiles",
						request);
				// 실제로 파일경로에 선택된 파일 올리고 List<Attach> return (파일업로드)
				// (boFiles, 게시판, 폴더이름)
				log.info(attaches);
				notice.setAttaches(attaches);

				// DB에 저장
				// List<Attach> attaches= notice.getAttaches();
				int noticeno = notice.getNoticeno();
				if (attaches != null && attaches.size() > 0) {
					for (Attach a : attaches) { // 하나씩 db에 저장
						a.setAtch_parent_no(noticeno); // 저장한 게시글번호 첨부파일vo에 세팅
						log.info("db에저장할 첨부파일vo" + a);
						if (attachService.insertAttach(a) > 0) {// 하나씩 db에 저장
							log.info("성공! " + a);
						} else {
							log.info("실패..." + a);
							return "common/error";
						}

					}
				}
			}

			// 업로드후 공지사항 update
			if (noticeService.updateNotice(notice) > 0) {
				log.info("공지수정 성공.");
				return "redirect:nlist.do";
			} else {
				log.info("질문수정중 오류발생.");
				return "common/error";
			}

		} catch (Exception e) {
			log.info("파일 업로드중 에러발생");
			e.printStackTrace();
		}

		return "common/error";
	}

}
