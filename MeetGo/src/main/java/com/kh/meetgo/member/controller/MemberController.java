package com.kh.meetgo.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.meetgo.member.model.service.MemberService;
import com.kh.meetgo.member.model.vo.Member;

@Controller
public class MemberController {
	
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	
	
	
	
	@RequestMapping("loginform.me")
	public String loginform() {		
		//System.out.println("s");
		return "member/memberLogin";
	}
	@RequestMapping("mypage.me")
	public String mypage() {
		return "member/memberMypage";
	}
	@RequestMapping("mypageInfo.me")
	public String mypagemini() {
		return "member/memberMypagInfo";
	}
	@RequestMapping("gosuPage.me")
	public String gosuPageForm() {
		return "member/memberGosuPage";
	}
	@RequestMapping("portfolio.me")
	public String memberPortFolio() {
		return "member/memberPortFolio";
	}
	@RequestMapping("EnrollForm.me")
	public String memberEenrollForm() {
		return "member/memberEnrollForm";
	}
	@RequestMapping("FindPassword.me")
	public String memberFindPassword() {
		return "member/memberFindPassword";
	}
	
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,
									String saveId,
									ModelAndView mv,
									HttpSession session,
									HttpServletResponse response){
		if(saveId != null && saveId.equals("y")){
			Cookie cookie = new Cookie("saveId", m.getUserId());
			cookie.setMaxAge(24*60*60*1);
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("saveId", m.getUserId());
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		System.out.println(m);
		
		Member loginUser = memberService.loginMember(m);
		
		System.out.println(loginUser);
		
		boolean check = bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd());
		if (loginUser != null && check) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인에 성공했습니다.");
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "로그인 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	@RequestMapping("logout.me")
	public String loginMember(HttpSession session){
		session.removeAttribute("loginUser");
		return "redirect:/";
	}

	@RequestMapping("enrollForm.me")
	public String enrollForm(){
		return "member/memberEnrollForm";
	}

	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		m.setUserPwd(bCryptPasswordEncoder.encode(m.getUserPwd()));
		int result = memberService.insertMember(m);
		if (result > 0) {
			session.setAttribute("alertMsg", "ㅇㅅㅇ");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}
}








