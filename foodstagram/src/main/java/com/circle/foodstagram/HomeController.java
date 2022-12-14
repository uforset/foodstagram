package com.circle.foodstagram;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("loginPage.do") //main.do 파일 요청이 오면 메소드가 진행되게끔 하라는 의미 
	public String forwardLoginView() {
		return "member/loginPage"; // 내보낼 뷰파일명 리턴
	}
	
	
	@RequestMapping("main.do") //main.do 파일 요청이 오면 메소드가 진행되게끔 하라는 의미 
	public String forwardMainView() {
	     return "common/main"; // 내보낼 뷰파일명 리턴
	}
	
}
