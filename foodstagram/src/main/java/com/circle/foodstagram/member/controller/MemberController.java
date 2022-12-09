package com.circle.foodstagram.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.circle.foodstagram.member.model.vo.KakaoLoginApi;
import com.circle.foodstagram.common.Paging;
import com.circle.foodstagram.common.SearchPaging;
import com.circle.foodstagram.member.model.vo.Member;
import com.circle.foodstagram.member.model.vo.NaverLoginBO;
import com.circle.foodstagram.member.service.MailSendService;
import com.circle.foodstagram.member.service.MemberService;
import com.circle.foodstagram.notification.model.service.NotificationService;
import com.circle.foodstagram.notification.model.vo.Notification;
import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.extern.slf4j.Slf4j;
import lombok.extern.log4j.Log4j;


@Controller
public class MemberController {
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

   @Autowired
   private MemberService memberService;

   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;

   @Autowired
   private MailSendService mailService;

   public Logger log;

   @Autowired
   private NotificationService notificationService;
   
   // 뷰 페이지 이동 처리용 --------------------------------------------------
   @RequestMapping("enrollPage.do")
   public String moveEnrollPage() {
      return "member/enrollPage";
   }

   // 아이디 찾기 페이지 이동
   @RequestMapping("findIDPage.do")
   public String findIDPage() {
      return "member/findIDPage";
   }
   
   // 비밀번호 찾기 페이지 이동
      @RequestMapping("pw_find.do")
      public String pw_find() {
         return "member/pw_find";
      }
   
   // -------------------------------------------------------------

   // 회원 정보 수정 페이지로 이동
   @RequestMapping("moveup.do")
   public String moveUpdatePage(
         @RequestParam("userid") String userid, Model model) {
      Member member = memberService.selectMember(userid);
      if(member != null) {
         model.addAttribute("member", member);
         return "member/memberupdatePage";
      }else {
         model.addAttribute("message", userid + " : 회원 조회 실패!");
         return "common/error";
      }
   }

   // -------------------------------------------------------------

   //회원 가입 처리용
   @RequestMapping(value="enroll.do", method=RequestMethod.POST)
   public String memberInsertMethod(Member member, Model model) {
      logger.info("enroll.do : " + member);


      //패스워드 암호화 처리
      member.setUserpwd(this.bcryptPasswordEncoder.encode(
            member.getUserpwd()));
      logger.info("after encode : " + member);
      logger.info("length : " + member.getUserpwd().length());

      if(memberService.insertMember(member) > 0) {
         //회원 가입 성공
         return "member/loginPage";
      }else {
         //회원 가입 실패
         model.addAttribute("message", "회원 가입 실패!");
         return "common/error";
      }
   }

   //===============================================
   // ajax 통신으로 처리하는 요청 메소드 -------------------------
   @RequestMapping(value="idchk.do", method=RequestMethod.POST)
   public void dupIdCheckMethod(
         @RequestParam("userid") String userid, 
         HttpServletResponse response) throws IOException {

      int idCount = memberService.selectDupCheckId(userid);

      String returnValue = null;
      if(idCount == 0) {
         returnValue = "ok";
      }else {
         returnValue = "dup";
      }

      //response 를 이용해서 클라이언트로 출력스트림을 만들고 값 보내기
      response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      out.append(returnValue);
      out.flush();
      out.close();
   }

   // 로그인 처리용 메소드 : 커맨드 객체(command object) 사용
   @RequestMapping(value="login.do", method=RequestMethod.POST)
   public String loginMethod(@RequestParam("userid") String userid, @RequestParam("userpwd") String userpwd,
         HttpSession loginSession, SessionStatus status, Model model) {
	   
      Member loginMember = memberService.selectMember(userid);
      logger.info("멤버확인!!!!!!!!!!!");
      logger.info(loginMember.toString());
      String viewName = null;
      String tempPWD = (String) loginSession.getAttribute("tempPWD");
      if(loginMember != null && tempPWD != null) {
         if(userpwd.equals(tempPWD)) {
            model.addAttribute("member", loginMember);
            return "member/pw_new";
         }
      }

      if(loginMember != null && this.bcryptPasswordEncoder.matches(
            userpwd, loginMember.getUserpwd()) && loginMember.getLoginok().equals("Y")) {

         loginSession.setAttribute("loginMember", loginMember);
         status.setComplete();

         viewName = "common/main";
      }else {
    	 logger.info("로그인 실패 : 아이디나 암호 확인하세요.<br>");
         model.addAttribute("titleMsg", "로그인 실패");
         model.addAttribute("message",
               "로그인 실패 : 아이디나 암호 확인하세요.<br>"
                     + "또는 로그인 제한 회원인지 관리자에게 문의하세요.");
         viewName = "common/error";
      }

      return viewName;
   }
   
   //로그아웃
   @RequestMapping("logout.do")
   public String logoutMethod(HttpServletRequest request, Model model) {
      //로그인 시 생성된 세션객체를 찾아 없앰
      HttpSession session = request.getSession(false);
      //request가 가진 세션 id에 대한 세션객체 있으면 리턴
      //없으면 null 리턴
      
      if(session != null) {
         session.invalidate();
         return "member/loginPage";      
      } else {
         model.addAttribute("message", "로그인 세션이 존재하지 않습니다.");
         return "common/error";
      }
   }

   // 비밀번호 이메일 인증
   @RequestMapping("PWDmailCheck.do")
   public String pwdmailCheck(@RequestParam("email") String email, HttpSession session, Model model) {
      System.out.println("이메일 인증 요청이 들어옴!");
      System.out.println("이메일 인증 이메일 : " + email);
      String tempPWD = mailService.pwdEmail(email);
      logger.info("tempPWD", tempPWD);
      if(tempPWD != null) {
         session.setAttribute("tempPWD", tempPWD);
         model.addAttribute("message", "임시 비밀번호로 사용 가능한 이메일을 전송하였습니다 이메일을 확인해주세요.");
         return "member/loginPage";
      }else {
         model.addAttribute("message", 
               "비밀번호 찾기 메일 전송 실패.");
         return "common/error";
      }
   }
   //리턴 타입으로 String, ModelAndView 를 사용할 수 있음
   @RequestMapping("myinfo.do")
   //public String myinfoMethod() {  return "폴더명/뷰파일명"; }
   public ModelAndView myinfoMethod(
         @RequestParam("userid") String userid, 
         ModelAndView mv) {
      //서비스로 전송온 값 전달해서, 실행 결과 받기
      Member member = memberService.selectMember(userid);
      logger.info("멤버 : " + member);
      if(member != null) {
         mv.addObject("member", member);
         mv.setViewName("member/mypage");
      }else {
         mv.addObject("message", userid + " : 회원 정보 조회 실패!");
         mv.setViewName("common/error");
      }

      return mv;      
   }

   //아이디 찾기 
   @RequestMapping(value = "find_id.do", method = RequestMethod.POST)
   @ResponseBody
   public String find_id(Member member) {
      String result = memberService.find_id(member);
      return result;
   }

   //회원 정보 수정용 : 수정 성공시 myinfoPage.jsp 로 이동함
   @RequestMapping(value="mupdate.do", method=RequestMethod.POST)
   public String memberUpdateMethod(Member member, Model model, 
         @RequestParam("origin_userpwd") String originUserpwd) {
      logger.info("mupdate.do : " + member);
      logger.info("origin_userpwd : " + originUserpwd);
      
      //새로운 암호가 전송이 왔다면, 패스워드 암호화 처리함
      String userpwd = member.getUserpwd().trim();
      if(userpwd != null && userpwd.length() > 0) {
         //기존 암호와 다른 값이면
         if(!this.bcryptPasswordEncoder.matches(userpwd, originUserpwd)) {
            //member 에 새로운 패스워드를 암호화해서 기록함
            member.setUserpwd(this.bcryptPasswordEncoder.encode(userpwd));
         }
      }else {
         //새로운 패스워드 값이 없다면, member 에 원래 패스워드 기록
         member.setUserpwd(originUserpwd);
      }
      
      logger.info("after : " + member);
      
      if(memberService.updateMember(member) > 0) {
         //수정이 성공했다면, 컨트롤러의 메소드를 직접 호출할 수도 있음
         //즉, 컨트롤러 안에서 다른 컨트롤러를 실행할 수도 있음
         //내정보보기 페이지에 수정된 회원정보를 다시 조회해서 내보냄
         //쿼리스트링 : ?이름=값&이름=값
         return "redirect:myinfo.do?userid=" + member.getUserid();
      }else {
         model.addAttribute("message", 
               member.getUserid() + " : 회원 정보 수정 실패!");
         return "common/error";
      }
      
   }

   //회원 탈퇴 처리용 : 회원 정보 삭제함
   //삭제되면 자동 로그아웃함
   @RequestMapping("mdel.do")
   public String memberDeleteMethod(
         @RequestParam("userid") String userid, Model model) {
      logger.info(userid);
      if(memberService.deleteMember(userid) > 0) {
         return "redirect:logout.do";
      }else {
         model.addAttribute("message", userid + " : 회원 삭제 실패!");
         return "common/error";
      }
   }

   // 임시 로그인 후 새로운 비밀번호 설정
   @RequestMapping(value="resetpwd.do", method=RequestMethod.POST)
   public String resetpwdMethod(Member member, Model model, HttpServletRequest request){
      logger.info("resetpwd.do : " + member);

      //새로운 암호가 전송이 왔다면, 패스워드 암호화 처리함
      String userpwd = member.getUserpwd().trim();
      if(userpwd != null && userpwd.length() > 0) {
         //member 에 새로운 패스워드를 암호화해서 기록함
         member.setUserpwd(this.bcryptPasswordEncoder.encode(userpwd));
         logger.info("userpwd : " + userpwd);
      }

      if(memberService.pwUpdate(member) > 0) {
         //수정이 성공했다면, 컨트롤러의 메소드를 직접 호출할 수도 있음
         //즉, 컨트롤러 안에서 다른 컨트롤러를 실행할 수도 있음
         //내정보보기 페이지에 수정된 회원정보를 다시 조회해서 내보냄
         //쿼리스트링 : ?이름=값&이름=값
         HttpSession session = request.getSession(false);
         session.invalidate(); //세션 객체를 없앰
         return "redirect:main.do";
      }else {
         model.addAttribute("message", 
               member.getUserid() + " : 회원 정보 수정 실패!");

         return "common/error";
      }

   }

   
   //로그인 제한/가능 변경 처리용
   @RequestMapping("loginok.do")
   public String changeLoginOKMethod(Member member, Model model) {
      logger.info("loginok.do : " + member.getUserid() + ", " + member.getLoginok());

      if(memberService.updateLoginOK(member) > 0) {
         return "redirect:mmlist.do";
      }else {
         model.addAttribute("message", "로그인 제한/허용 처리 오류 발생");
         return "common/error";
      }
   }
   

   //회원 검색 처리용 
   @RequestMapping(value="msearch.do", method=RequestMethod.POST)
   public String memberSearchMethod(
         HttpServletRequest request, Model model) {
      String action = request.getParameter("action");
      String keyword = request.getParameter("keyword");

      //서비스 메소드 리턴값 받을 리스트 준비
      ArrayList<Member> list = null;

      switch(action) {

      case "userid":    list = memberService.selectSearchUserid(keyword);
      break;

      case "loginok": list = memberService.selectSearchLoginOK(keyword);
      break;
      
      case "email": list = memberService.selectSearchEmail(keyword);
      break;

      case "0" : list = memberService.selectList2(null);
      break;

      }

      if(list.size() > 0) {
         model.addAttribute("list", list);
         return "member/memberListView";
      }else {
         model.addAttribute("message", 
               action + " 검색에 대한 " + keyword 
               + " 결과가 존재하지 않습니다.");
         return "common/error";
      }
   }

   
//   //게시글 페이지 단위로 목록보기 요청 처리용
   @RequestMapping("mmlist.do")
   public ModelAndView memberListMethod(
         @RequestParam(name="page", required=false) String page,
         ModelAndView mv) {
      
      int currentPage = 1;
      if(page != null) {
         currentPage = Integer.parseInt(page);
      }
      //한 페이지에 게시글 10개씩 출력되게 하는 경우
            //페이징 계산 처리 -- 별도의 클래스로 작성해도 됨 ---------------
            //별도의 클래스의 메소드에서 Paging 을 리턴하면 됨
            int limit = 10;  //한 페이지에 출력할 목록 갯수
            //전체 페이지 갯수 계산을 위해 총 목록 갯수 조회해 옴
            int listCount = memberService.selectListCount();
            //페이지 수 계산
            //주의 : 목록이 11개이면 페이지 수는 2페이지가 됨
            // 나머지 목록 1개도 1페이지가 필요함
            int maxPage = (int)((double)listCount / limit + 0.9);
            //현재 페이지가 포함된 페이지 그룹의 시작값 지정
            // => 뷰 아래쪽에 표시할 페이지 수를 10개로 하는 경우
            int startPage = (currentPage / 10) * 10 + 1;
            //현재 페이지가 포함된 페이지 그룹의 끝값 지정
            int endPage = startPage + 10 - 1;
            
            if(maxPage < endPage) {
               endPage = maxPage;
            }
            
            //쿼리문에 전달할 현재 페이지에 적용할 목록의 시작행과 끝행 계산
            int startRow = (currentPage - 1) * limit + 1;
            int endRow = startRow + limit - 1;
            Paging paging = new Paging(startRow, endRow);
            
            //페이징 계산 처리 끝 ---------------------------------------
                        ArrayList<Member> list = memberService.selectList(paging);
            
            if(list != null && list.size() > 0) {
               mv.addObject("list", list);
               mv.addObject("listCount", listCount);
               mv.addObject("maxPage", maxPage);
               mv.addObject("currentPage", currentPage);
               mv.addObject("startPage", startPage);
               mv.addObject("endPage", endPage);
               mv.addObject("limit", limit);
               
               mv.setViewName("member/memberListView");
            }else {
               mv.addObject("message", 
                     currentPage + " 페이지 목록 조회 실패.");
               mv.setViewName("common/error");
            }
            
            return mv;
         }
   // 회원 아이디 검색용   
         @RequestMapping(value="msearchId.do", method=RequestMethod.GET)
         public String memberSearchIdMethod(
               @RequestParam("keyword") String keyword, 
               @RequestParam(name="page", required=false) String page,
               Model model) {
            int currentPage = 1;
            if(page != null) {
               currentPage = Integer.parseInt(page);
            }
            
            ArrayList<Member> list = null;
            
            int limit = 10;
            
            int listCount = memberService.getSearchIdCount(keyword);

            int maxPage = (int)((double)listCount / limit + 0.9);

            int startPage = (currentPage / 10) * 10 + 1;

            int endPage = startPage + 10 - 1;
            
            if(maxPage < endPage) {
               endPage = maxPage;
            }
            int startRow = (currentPage - 1) * limit + 1;
            int endRow = startRow + limit - 1;
            
            //페이징 계산 처리 끝 ---------------------------------------
            SearchPaging searchpaging = new SearchPaging(keyword, startRow, endRow);
            
            list = memberService.searchId(searchpaging);
            
            if(list.size() > 0) {
               model.addAttribute("list", list);
               model.addAttribute("listCount", listCount);
               model.addAttribute("maxPage", maxPage);
               model.addAttribute("currentPage", currentPage);
               model.addAttribute("startPage", startPage);
               model.addAttribute("endPage", endPage);
               model.addAttribute("limit", limit);
               model.addAttribute("action", "userid");
               model.addAttribute("keyword", keyword);
               return "member/memberListView";
            }else {
               model.addAttribute("message", 
                     keyword + "로 검색된 공지글 정보가 없습니다.");
               return "common/error";
            }
         }
         
         // 회원 로그인 여부 (활성/비활성) 검색용
         @RequestMapping(value="msearchLogin.do", method=RequestMethod.GET)
         public String memberSearchWriterMethod(
               @RequestParam("keyword") String keyword, 
               @RequestParam(name="page", required=false) String page,
               Model model) {
            int currentPage = 1;
            if(page != null) {
               currentPage = Integer.parseInt(page);
            }
            
            ArrayList<Member> list = null;
            
            int limit = 10;
            
            int listCount = memberService.getSearchLoginCount(keyword);

            int maxPage = (int)((double)listCount / limit + 0.9);

            int startPage = (currentPage / 10) * 10 + 1;

            int endPage = startPage + 10 - 1;
            
            if(maxPage < endPage) {
               endPage = maxPage;
            }
            
            //쿼리문에 전달할 현재 페이지에 적용할 목록의 시작행과 끝행 계산
            int startRow = (currentPage - 1) * limit + 1;
            int endRow = startRow + limit - 1;
            
            //페이징 계산 처리 끝 ---------------------------------------
            SearchPaging searchpaging = new SearchPaging(keyword, startRow, endRow);
            list = memberService.searchLoginok(searchpaging);
            
            if(list.size() > 0) {
               model.addAttribute("list", list);
               model.addAttribute("listCount", listCount);
               model.addAttribute("maxPage", maxPage);
               model.addAttribute("currentPage", currentPage);
               model.addAttribute("startPage", startPage);
               model.addAttribute("endPage", endPage);
               model.addAttribute("limit", limit);
               model.addAttribute("action", "login");
               model.addAttribute("keyword", keyword);
               return "member/memberListView";
            }else {
               model.addAttribute("message", 
                     keyword + "로 검색된 공지글 정보가 없습니다.");
               return "common/error";
            }
         }
         
         // 회원 이메일 검색용   
         @RequestMapping(value="msearchEmail.do", method=RequestMethod.GET)
         public String memberSearchEmailMethod(
               @RequestParam("keyword") String keyword, 
               @RequestParam(name="page", required=false) String page,
               Model model) {
            int currentPage = 1;
            if(page != null) {
               currentPage = Integer.parseInt(page);
            }
            
            ArrayList<Member> list = null;
            
            int limit = 10;
            
            int listCount = memberService.getSearchEmailCount(keyword);

            int maxPage = (int)((double)listCount / limit + 0.9);

            int startPage = (currentPage / 10) * 10 + 1;

            int endPage = startPage + 10 - 1;
            
            if(maxPage < endPage) {
               endPage = maxPage;
            }

            int startRow = (currentPage - 1) * limit + 1;
            int endRow = startRow + limit - 1;
            
            //페이징 계산 처리 끝 ---------------------------------------
            SearchPaging searchpaging = new SearchPaging(keyword, startRow, endRow);
            
            list = memberService.searchEmail(searchpaging);
            
            if(list.size() > 0) {
               model.addAttribute("list", list);
               model.addAttribute("listCount", listCount);
               model.addAttribute("maxPage", maxPage);
               model.addAttribute("currentPage", currentPage);
               model.addAttribute("startPage", startPage);
               model.addAttribute("endPage", endPage);
               model.addAttribute("limit", limit);
               model.addAttribute("action", "userid");
               model.addAttribute("keyword", keyword);
               return "member/memberListView";
            }else {
               model.addAttribute("message", 
                     keyword + "로 검색된 공지글 정보가 없습니다.");
               return "common/error";
            }
         }
          
         //수정페이지 이동
         @RequestMapping("amoveup.do")
         public String moveAdminUpdatePage(@RequestParam String userid, Model model) {
            Member member = memberService.selectMember(userid);
            if(member != null) {
               model.addAttribute("member", member);
               return "member/adminupdatePage";
            } else {
               model.addAttribute("message", userid + " : 회원 조회 실패!");
               return "common/error";
            }
         }
         
          //관리자 회원 정보 수정
         @RequestMapping(value="amupdate.do", method=RequestMethod.POST)
         public String memberUpdate(Member member, Model model) {      
            logger.info("amupdate.do : " + member);
            
            logger.info("after : " + member);
            
            if(memberService.aupdateMember(member) > 0) {
               return "redirect:mmlist.do";
            }else {
               model.addAttribute("message", member.getUserid() + " : 회원 정보 수정 실패!");
               return "common/error";
            }
            
         }
         
         // 사이트 회원 검색용
          @RequestMapping(value="searchUser.do", method=RequestMethod.GET)
            public String SearchUserMethod(
                  @RequestParam("keyword") String keyword, 
                  @RequestParam(name="page", required=false) String page,
                  Model model) {
               int currentPage = 1;
               if(page != null) {
                  currentPage = Integer.parseInt(page);
               }
               
               //한 페이지에 게시글 10개씩 출력되게 하는 경우
               //페이징 계산 처리 -- 별도의 클래스로 작성해도 됨 ---------------
               //별도의 클래스의 메소드에서 Paging 을 리턴하면 됨
               int limit = 10;  //한 페이지에 출력할 목록 갯수
               //전체 페이지 갯수 계산을 위해 총 목록 갯수 조회해 옴
               int listCount = memberService.selectSearchUserCount(keyword);
               //페이지 수 계산
               //주의 : 목록이 11개이면 페이지 수는 2페이지가 됨
               // 나머지 목록 1개도 1페이지가 필요함
               int maxPage = (int)((double)listCount / limit + 0.9);
               //현재 페이지가 포함된 페이지 그룹의 시작값 지정
               // => 뷰 아래쪽에 표시할 페이지 수를 10개로 하는 경우
               int startPage = (currentPage / 10) * 10 + 1;
               //현재 페이지가 포함된 페이지 그룹의 끝값 지정
               int endPage = startPage + 10 - 1;
               
               if(maxPage < endPage) {
                  endPage = maxPage;
               }
               
               //쿼리문에 전달할 현재 페이지에 적용할 목록의 시작행과 끝행 계산
               int startRow = (currentPage - 1) * limit + 1;
               int endRow = startRow + limit - 1;
               
               //페이징 계산 처리 끝 ---------------------------------------
               SearchPaging searchpaging = new SearchPaging(keyword, startRow, endRow);
               ArrayList<Member> list = memberService.selectSearchUser(searchpaging);
               
               if(list.size() > 0) {
                  model.addAttribute("list", list);
                  model.addAttribute("listCount", listCount);
                  model.addAttribute("maxPage", maxPage);
                  model.addAttribute("currentPage", currentPage);
                  model.addAttribute("startPage", startPage);
                  model.addAttribute("endPage", endPage);
                  model.addAttribute("limit", limit);
                  model.addAttribute("keyword", keyword);
                  return "member/searchUserListView";
               }else {
                  model.addAttribute("message", 
                        keyword + "로 검색된 게시글 정보가 없습니다.");
                  return "common/error";
               }
            }
          
          
	//------------------------------------------------------------------------------------------------------------------
	// sns
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 카카오 연동 객체 생성
	KakaoLoginApi kakao_loginapi = new KakaoLoginApi();

	// 로그인페이지로 이동-(+ 네이버 버튼에 연결url전송 , + 카카오톡 버튼에 연결url전송)
	@RequestMapping(value = "loginPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveLoginPage(Model model, HttpSession session) {

		// 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		String kakaoAuthUrl = kakao_loginapi.getAuthorizationUrl(session);

		model.addAttribute("nurl", naverAuthUrl);
		model.addAttribute("kurl", kakaoAuthUrl);

		return "member/loginPage";
	}

	// 2. 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/ncallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		return "common/main";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String nickname = (String) response_obj.get("nickname");
		String id = (String)response_obj.get("id");
		System.out.println(nickname);
		System.out.println(id);
		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId", nickname); // 세션 생성
		model.addAttribute("result", apiResult);
		
		//*값 받아온 것을 회원 정보와 확인해야함*//
		Member member = new Member();
		//아이디 저장되 있는 이름 만들기	
		String checkid = "@N"+id;//네이버 아이디 저장 값
		member.setUserid(checkid);
		  
				
		return "login";
	}
	
	//카카오
	@RequestMapping(value = "/kcallback.do", produces = "application/json", 
			method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoLogin(
			@RequestParam("code") String code, 
			Model model, HttpSession session) throws Exception {

		// 결과값을 node에 담아줌
		JsonNode node = kakao_loginapi.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token"); // 사용자의 정보
		JsonNode userInfo = kakao_loginapi.getKakaoUserInfo(accessToken);

		// 회원가입시 사용		
		String kid = null;//카카오 로그인 id 값 받아오기
		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");// 값 가져올 수 있지만 사용은 안함		
		kid = userInfo.path("id").asText();
		
		// *값 받아온 것을 회원 정보와 확인해야함*//
		Member member = new Member();
		// 아이디 저장되 있는 이름 만들기
		String checkid = "@K" + kid;// 카카오 아이디 저장 값
		member.setUserid(checkid);
		
		// 간편 로그인 아이디에 해당하는 회원 정보 확인하러가기
		//Member loginMember = memberService.selectLogin(member);
		//if(loginMember != null) {//해당하는 아이디가 있으면 로그인 완료
		if(checkid != null) {  //테스트용 조건임	
			//카카오 로그인 세션에 저장
			session.setAttribute("loginMember", member); // 세션 생성			
			
			return "common/main";
			
		}else {
			model.addAttribute("message", "카카오 로그인 회원 조회 실패");
			return "common/error";
			
		}
	
	}

}





