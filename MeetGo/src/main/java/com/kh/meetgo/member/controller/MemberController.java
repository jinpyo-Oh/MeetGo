package com.kh.meetgo.member.controller;

import java.util.HashMap;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.member.model.service.MemberService;
import com.kh.meetgo.member.model.vo.Member;

@Controller
public class MemberController {
	
	
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	
	
	@RequestMapping(value= "checkNumber.me")
	public String checkNumber() {
		return "member/memberChecknumber";
	}
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "member/memberLogin";
	}
	@RequestMapping("myPage.me")
	public String mypage() {
		return "member/memberMyPage";
	}
	@RequestMapping("myPageInfo.me")
	public String mypagemini() {
		return "member/memberMyPagInfo";
	}
	@RequestMapping("gosuPage.me")
	public String gosuPageForm() {
		return "member/memberGosuPage";
	}
	@RequestMapping("portfolio.me")
	public String memberPortFolio() {
		return "member/memberPortFolio";
	}
	@RequestMapping("enrollForm.me")
	public String memberEenrollForm() {
		return "member/memberEnrollForm";
	}
	@RequestMapping("findPassword.me")
	public String memberFindPassword() {
		return "member/memberFindPassword";
	}
	@RequestMapping("changePassword.me")
	public String memberChangePassword() {
		return "member/memberChangePassword";
	}
	
	@RequestMapping("reviewWrite.me")
	public String reviewWrite() {
		return "estimate/reviewWrite";
	}
	
	@RequestMapping("myReview.me")
	public String myReview() {
		return "member/memberMyReview";
	}
	
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,
									String saveId,
									ModelAndView mv,
									HttpSession session,
									HttpServletResponse response){

		

		Member loginUser = memberService.loginMember(m);
		if(loginUser == null){
			session.setAttribute("errorMsg", "아이디가 존재하지 않습니다.");
			mv.setViewName("redirect:/loginForm.me");
			return mv;
		}

		boolean check = bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd());
		if (check) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인 성공.");
			mv.setViewName("redirect:/");
		} else {
			session.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
			mv.setViewName("redirect:/loginForm.me");
			return mv;
		}

		if(saveId != null && saveId.equals("y")){
			Cookie cookie = new Cookie("saveId", m.getUserId());
			cookie.setMaxAge(24*60*60*1);
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("saveId", m.getUserId());
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		return mv;
	}

	@RequestMapping("logout.me")
	public String loginMember(HttpSession session){
		session.removeAttribute("loginUser");
		return "redirect:/";
	}

	@RequestMapping("insert.me")
	public String insertMember(Member m,String domain, Model model, HttpSession session,String address1, String address2) {
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		String email=m.getUserEmail()+"@"+domain;
		m.setUserEmail(email);
		m.setUserPwd(bCryptPasswordEncoder.encode(m.getUserPwd()));
		String address = address1+" "+address2;
		m.setAddress(address);
		int result = memberService.insertMember(m);
		if (result > 0) {

			session.setAttribute("alertMsg", "회원 가입 성공");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "회원 가입 실패");
			return "common/errorPage";
		}
	}
	@ResponseBody
	@RequestMapping(value = "idCheck.me", produces = "text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		
		int count = memberService.idCheck(checkId);
		
	
		return (count > 0) ? "NNNNN" : "NNNNY";
	}
	@ResponseBody
	@RequestMapping(value = "pwdCheck.me", produces = "text/html; charset=UTF-8")
	public String pwdCheck(String checkPwd) {
		
		int count = memberService.pwdCheck(checkPwd);
		
	
		return (count > 0) ? "NNNNN" : "NNNNY";
	}


	@RequestMapping(value = "changeStatus.me", produces = "text/html; charset=UTF-8")
	public String changeStatus(HttpSession session){
		Member m = (Member) session.getAttribute("loginUser");

		if(m != null){
			int userStatus = m.getUserStatus() == 1 ? 2 : 1;
			m.setUserStatus(userStatus);
			int result = memberService.changeStatus(m);
			if(result > 0) {
				return "redirect:/";
			}
			else {
				return "common/errorPage";
			}
		}
		return "redirect:/";
	}
	@RequestMapping("delete.me")
	public String deleteMember(String userId, 
							   String userPwd,
							   HttpSession session,
							   Model model) {
		
		// userId : 탈퇴 요청을 한 회원의 아이디
		// userPwd : 탈퇴 요청을 한 회원의 비번 평문
		
		// DB 로부터 비번이 일치하는 조건을 가진
		// 쿼리문 사용 불가
		// => Bcrypt 방식에 의해 아무리 평문이 일치하더라도
		//    매번 다른 암호문 결과가 나올것이기 때문
		// => 현재 session 에 담겨있는 회원의 정보 중
		//    암호화된 비밀번호를 갖고와서 matches 메소드로 대조
		
		// session 으로부터 loginUser 의 userPwd 필드값 갖고오기
		// (암호화된 비번)
		String encPwd = ((Member)session.getAttribute("loginUser"))
													.getUserPwd();
		
		
	
		// 비밀번호 대조작업 진행 (matches 메소드)
		if(bCryptPasswordEncoder.matches(userPwd, encPwd)) {
			
			// 비밀번호가 일치할 경우
			// => 탈퇴처리
			int result = memberService.deleteMember(userId);
			
			if(result > 0) { // 회원 탈퇴 성공
				
				// => session 으로부터 loginUser 를 지우기 (로그아웃)
				//    session 에 alert 문구를 담기
				//    메인페이지로 url 재요청
				
				// 로그아웃 구현 방법 2가지
				// 1. 세션을 무효화시키기 (invalidate 메소드)
				// 2. removeAttribute 를 이용해서 회원 정보만 날리기
				// => alert 문구도 담아야하기 때문에 2번 방법
				session.removeAttribute("loginUser");
				
				session.setAttribute("alertMsg", 
						"성공적으로 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
				
				return "redirect:/";
				
			} else { // 회원 탈퇴 실패
				
				// => 에러문구를 담아서 에러페이지로 포워딩
				model.addAttribute("errorMsg", "회원 탈퇴 실패");
				
				// /WEB-INF/views/common/errorPage.jsp
				return "common/errorPage";
			}
			
		} else {
			
			// 비밀번호가 일치하지 않을 경우
			// => 비밀번호가 틀렸다고 알리고 마이페이지로 url 재요청
			
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력하였습니다. 확인해주세요.");
			
			return "redirect:/myPage.me";
		}
	}
	/*
	@RequestMapping("update.me")
	public String updateMember(Member m,
							   Model model,
							   HttpSession session) {
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());

		m.setUserId(((Member)(session.getAttribute("loginUser"))).getUserId());
		int result = memberService.updateMember(m);
		if(result > 0) { // 수정 성공
			// => 갱신된 회원의 정보를 다시 조회해와서
			//    세션에 덮어씌우기
			//    마이페이지로 url 재요청
			
			// 기존의 loginMember 메소드를 재활용해서 조회해오기
			
			m.setUserId(((Member)session.getAttribute("loginUser")).getUserId());

			System.out.println(m);
			Member updateMember = memberService.loginMember(m);
			
			
			session.setAttribute("loginUser", updateMember);
			
			// 일회성 알람 문구도 담기
			session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");
			
			// 마이페이지로 url 재요청
			return "redirect:/myPage.me";
			
		} else { // 수정 실패
			// => 에러 문구를 담아서 에러페이지로 포워딩
			
			model.addAttribute("errorMsg", "회원정보 변경 실패");
			
			// /WEB-INF/views/common/errorPage.jsp
			return "common/errorPage";
		}
		*/
	@RequestMapping("estimate.me")
	public ModelAndView myEstimate(@RequestParam(value= "cPage", defaultValue = "1") int currentPage, ModelAndView mv, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int userNo = m.getUserNo();
		
		int listCount1 = memberService.selectIncompleteListCount(userNo);
		int listCount2 = memberService.selectCompleteListCount(userNo);
		
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi1 = Pagination.getPageInfo(listCount1,currentPage, pageLimit, boardLimit);
		PageInfo pi2 = Pagination.getPageInfo(listCount2,currentPage, pageLimit, boardLimit);
		
		ArrayList<Estimate> list1 = memberService.selectIncompleteEstimateList(pi1, userNo);
		ArrayList<Estimate> list2 = memberService.selectCompleteEstimateList(pi2, userNo);
		
		// System.out.println(list1);
		// System.out.println(list2);
		
		mv.addObject("incomList", list1).addObject("pi1", pi1)
		  .addObject("comList", list2).addObject("pi2", pi2)
		  .setViewName("estimate/myEstimateList");
		
		return mv;
	}
	
	@RequestMapping("estimateDetail.me")
	public ModelAndView estimateDetail(String eno, ModelAndView mv) {
		
		// System.out.println(eno);
		int estNo = 0;
		if(!eno.isEmpty()) {
			estNo = Integer.parseInt(eno);
		}
		
		Estimate est = memberService.selectEstimateDetail(estNo);
		
		String userName = memberService.getName(est.getUserNo());
		String gosuName = memberService.getName(est.getGosuNo());
		
		mv.addObject("est", est).addObject("userName", userName).addObject("gosuName", gosuName)
		  .setViewName("estimate/myEstimateDetail");
		
		return mv;
	}
	
}









