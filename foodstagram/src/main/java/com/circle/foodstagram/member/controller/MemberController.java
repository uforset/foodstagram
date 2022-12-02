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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.circle.foodstagram.member.model.vo.KakaoLoginApi;
import com.circle.foodstagram.member.model.vo.Member;
import com.circle.foodstagram.member.service.MailSendService;
import com.circle.foodstagram.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

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
	// 카카오 연동 객체 생성
	KakaoLoginApi kakao_loginapi = new KakaoLoginApi();
	
	//로그인 페이지로 이동시, 카카오 로그인 버튼에 연결할 url 보냄
		@RequestMapping(value="loginPage.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String moveLoginPage(Model model, HttpSession session) {
			
			String kakaoAuthUrl = kakao_loginapi.getAuthorizationUrl(session);
			model.addAttribute("kurl", kakaoAuthUrl);
			
			return "member/loginPage";
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
				model.addAttribute("titleMsg", "로그인 실패");
				model.addAttribute("message",
						"로그인 실패 : 아이디나 암호 확인하세요.<br>"
								+ "또는 로그인 제한 회원인지 관리자에게 문의하세요.");
						viewName = "common/error";
			}
			
			return viewName;
		}
		
		//로그아웃 처리용
		@RequestMapping("logout.do")
		public String logoutMethod(HttpServletRequest request, 
				Model model) {
			//로그인할 때 생성된 세션객체를 찾아서 없앰
			HttpSession session = request.getSession(false);
			//request 가 가진 세션id 에 대한 세션객체가 있으면 리턴
			//없으면 null 리턴
			
			if(session != null) {
				session.invalidate(); //세션 객체를 없앰
				return "common/main";
			}else {
				model.addAttribute("message", 
						"로그인 세션이 존재하지 않습니다.");
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
				mv.setViewName("member/myinfoPage");
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
		
		// 비밀번호 변경 전 본인 확인
		@RequestMapping(value="checkself.do", method=RequestMethod.POST)
		public String checkself(Member member, @RequestParam("userid") String userid, Model model) {
			System.out.println(member.getUserid());
			Member loginMember = memberService.selectMember(userid);
			logger.info("member.pass " + member.getUserpwd());
			logger.info("loginmember.pass " + loginMember.getUserpwd());
			
			String viewName = null;
			if(loginMember != null && 
					this.bcryptPasswordEncoder.matches(member.getUserpwd(), loginMember.getUserpwd())) {
				//로그인 상태 관리 방법 (상태 관리 매커니즘) : 기본 세션 사용
				//logger.info("sessionID : " + loginSession.getId());
				
				//로그인 성공시 내보낼 뷰파일명 지정
				viewName = "redirect:updatePage.do?userid=" + userid;
			}else {  //로그인 실패
				model.addAttribute("message", 
						"본인 인증 실패 : 암호를 확인하세요.");
				viewName = "common/error";
			}
			
			return viewName;
		}
	
}
