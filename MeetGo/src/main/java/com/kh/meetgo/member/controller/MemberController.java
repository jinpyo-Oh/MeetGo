package com.kh.meetgo.member.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.meetgo.board.model.service.BoardService;
import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.common.config.S3Uploader;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.dto.ReviewDto;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.gosu.model.vo.GosuImg;
import com.kh.meetgo.gosu.model.vo.Review;
import com.kh.meetgo.gosu.model.vo.ReviewImg;
import com.kh.meetgo.member.model.service.MemberService;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private MemberService memberService;

	@Autowired
	private S3Uploader s3Uploader;


	@RequestMapping(value= "checkNumber.me")
	public String checkNumber() {
		return "member/memberChecknumber";
	}
	@RequestMapping("myPost.me")
	public String myPost() {
		return "member/memberMyPost";
	}
	@RequestMapping("comment.me")
	public String comment() {
		return "member/memberComment";
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
		return "member/memberMyPageInfo";
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
	
	
	
	@RequestMapping("gosuPage.me")
	public String loginGosu(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		// UserNo를 이용하여 DB에서 Gosu 정보 조회
		Gosu gosu = memberService.getGosuInfoByUserNo(loginUser.getUserNo());
		// 조회된 Gosu 정보를 세션에 저장
		session.setAttribute("loginGosu", gosu);
		return "member/memberGosuPage";

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

	@RequestMapping("update.me")
	public String updateMember(Member m,
							   Model model,
							   HttpSession session,
							   MultipartFile profileupload) {
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());

		try {
			String content = s3Uploader.upload(profileupload,"chat");
			m.setUserProFile(content);
		} catch (IOException e) {
			e.printStackTrace();
		}

		m.setUserPwd(bCryptPasswordEncoder.encode(m.getUserPwd()));
		System.out.println(m);
		m.setUserId(((Member)(session.getAttribute("loginUser"))).getUserId());
		int result = memberService.updateMember(m);
		if(result > 0) { // 수정 성공
			// => 갱신된 회원의 정보를 다시 조회해와서
			//    세션에 덮어씌우기
			//    마이페이지로 url 재요청

			// 기존의 loginMember 메소드를 재활용해서 조회해오기

			m.setUserId(((Member)session.getAttribute("loginUser")).getUserId());


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

	@RequestMapping("reviewWrite.me")
	public ModelAndView reviewWrite(String eno, ModelAndView mv) {

		int estNo = 0;

		if(!eno.isEmpty()) {
			estNo = Integer.parseInt(eno);
		}

		Estimate est = memberService.selectEstimateDetail(estNo);

		String userName = memberService.getName(est.getUserNo());
		String gosuName = memberService.getName(est.getGosuNo());

		mv.addObject("est", est).addObject("userName", userName).addObject("gosuName", gosuName)
				.setViewName("estimate/reviewWrite");

		return mv;
	}

	@PostMapping("reviewEnroll.me")
	public String reviewEnroll(String estNo, String userNo, String gosuNo, String revContent, String rating,
							   ArrayList<MultipartFile> upfile, HttpSession session) {

		Review review = new Review();

		review.setEstNo(Integer.parseInt(estNo));
		review.setUserNo(Integer.parseInt(userNo));
		review.setGosuNo(Integer.parseInt(gosuNo));
		review.setRevContent(revContent);
		review.setRevPoint(Integer.parseInt(rating));

		int result = memberService.reviewEnroll(review);

		int revNo = review.getRevNo();

		System.out.println(revNo);

		System.out.println(upfile);

		int aaa = 0;
		try {
			for(int i = 0; i < upfile.size(); i++) {
				ReviewImg reImg = new ReviewImg();

				String content;
				content = s3Uploader.upload(upfile.get(i), "reviewImg");
				reImg.setRevNo(revNo);
				reImg.setRevImgUrl(content);

				System.out.println(reImg);

				int rst = memberService.reviewImageEnroll(reImg);
				if(rst == 1) {
					aaa++;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		if(aaa == upfile.size()) {
			session.setAttribute("alertMsg", "리뷰가 성공적으로 등록되었습니다.");
		} else {
			session.setAttribute("alertMsg", "리뷰 등록에 실패했습니다. 관리자에게 문의해주세요." );
		}

		return "estimate/myEstimateList";
	}

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
		ArrayList<EstimateDto> list2 = memberService.selectCompleteEstimateList(pi2, userNo);

		// System.out.println(list1);
		// System.out.println(list2);

		mv.addObject("incomList", list1).addObject("pi1", pi1)
				.addObject("comList", list2).addObject("pi2", pi2)
				.setViewName("estimate/myEstimateList");

		return mv;
	}

	@RequestMapping("myReview.me")
	public ModelAndView myReviewList(@RequestParam(value= "cPage", defaultValue = "1") int currentPage, ModelAndView mv, HttpSession session) {

		Member m = (Member)session.getAttribute("loginUser");

		int userNo = m.getUserNo();

		int listCount = memberService.reviewListCount(userNo);

		int pageLimit = 5;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<ReviewDto> list = memberService.myReviewList(pi, userNo);

//		System.out.println(m);
//		System.out.println(userNo);
//		System.out.println(list);

		mv.addObject("list", list).addObject("pi", pi).setViewName("member/memberMyReview");

		return mv;
	}
	
	@RequestMapping("WrittenReview.me")
	public ModelAndView WrittenReviewToMe(@RequestParam(value= "cPage", defaultValue = "1") int currentPage, ModelAndView mv, HttpSession session) {

		Member m = (Member)session.getAttribute("loginUser");

		int gosuNo = m.getUserNo();

		int listCount = memberService.WrittenReviewToMeCount(gosuNo);
		
		int pageLimit = 5;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<ReviewDto> list = memberService.WrittenReviewToMe(pi, gosuNo);

		System.out.println(m);
		System.out.println(gosuNo);
		System.out.println(listCount);
		System.out.println(list);

		mv.addObject("list", list).addObject("pi", pi).setViewName("gosu/gosuWrittenReviewList");

	    return mv;
	}

	@RequestMapping("reviewDetail.me")
	public ModelAndView myReviewDetail(String rno, ModelAndView mv) {

		int revNo = 0;
		if(!rno.isEmpty()) {
			revNo = Integer.parseInt(rno);
		}

		ReviewDto list = memberService.myReviewDetail(revNo);
		ArrayList<ReviewImg> imgList = memberService.myReviewDetailImg(revNo);

//		System.out.println(list);
//		System.out.println(imgList);

		if(!imgList.isEmpty()) {

			mv.addObject("list", list).addObject("imgList", imgList)
					.setViewName("estimate/reviewDetail");
		} else {

			mv.addObject("list", list).setViewName("estimate/reviewDetail");
		}

		return mv;
	}
	
	@RequestMapping("deleteReview.me")
	public String deleteReview(String rno, HttpSession session) {

		int revNo = Integer.parseInt(rno);

		int result = memberService.deleteReview(revNo);

		if(result > 0) {
			session.setAttribute("alertMsg", "리뷰가 성공적으로 삭제되었습니다.");
			return "redirect:/myReview.me";
		} else {
			session.setAttribute("alertMsg", "리뷰 삭제에 실패하였습니다. 다시 시도해보세요.");
			return "redirect:/myReview.me";
		}
	}

	@ResponseBody
	@RequestMapping("complete.me")
	public void completeEstimate(String estNo) {

		// System.out.println(estNo);

		int eno = Integer.parseInt(estNo);

		int result = memberService.completeEstimate(eno);

	}
	@RequestMapping("elaborateUpdate.me")
	public String elaborateUpdate(Model model, HttpSession session, String elaborate) {

		Gosu g = new Gosu();
		g.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
		g.setElaborate(elaborate);
		System.out.println(g);
		int result = memberService.elaborateUpdate(g);
		if (result > 0) {

			session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");

			return "redirect:/gosuPage.me";

		} else { // 수정 실패 // => 에러 문구를 담아서 에러페이지로 포워딩

			model.addAttribute("errorMsg", "회원정보 변경 실패");

			return "common/errorPage";

		}
	}

	@RequestMapping("introductionUpdate.me")
	public String introductionUpdate(Model model, HttpSession session, String introduction) {

		Gosu g = new Gosu();
		g.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());

		g.setIntroduction(introduction);
		int result = memberService.introductionUpdate(g);
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");
			return "redirect:/gosuPage.me";
		} else { // 수정 실패 // => 에러 문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원정보 변경 실패");

			return "common/errorPage";
		}

	}

	@RequestMapping("availableTimeUpdate.me")
	public String availableTimeUpdate(Model model, HttpSession session, String availableTimeUpdate) {

		Gosu g = new Gosu();
		g.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
		g.setAvailableTime(availableTimeUpdate);
		int result = memberService.availableTimeUpdate(g);
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");
			return "redirect:/gosuPage.me";
		} else { // 수정 실패 // => 에러 문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원정보 변경 실패");

			return "common/errorPage";
		}
	}

	@RequestMapping("educationUpdate.me")
	public String educationUpdate(Model model, HttpSession session, String educationUpdate) {

		Gosu g = new Gosu();
		g.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
		g.setEducation(educationUpdate);
		int result = memberService.educationUpdate(g);
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");
			return "redirect:/gosuPage.me";
		} else { // 수정 실패 // => 에러 문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원정보 변경 실패");

			return "common/errorPage";
		}
	}

	@RequestMapping("moveDistanceUpdate.me")
	public String moveDistanceUpdate(Model model, HttpSession session, String moveDistanceUpdate) {

		Gosu g = new Gosu();
		g.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
		g.setMoveDistance(moveDistanceUpdate);
		int result = memberService.moveDistanceUpdate(g);
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");
			return "redirect:/gosuPage.me";
		} else { // 수정 실패 // => 에러 문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원정보 변경 실패");

			return "common/errorPage";
		}
	}
	@RequestMapping("emplyeesUpdate.me")
	public String emplyeesUpdate(Model model, HttpSession session, int employeesUpdate) {

		Gosu g = new Gosu();
		g.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
		g.setEmployees(employeesUpdate);
		int result = memberService.employeesUpdate(g);
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");
			return "redirect:/gosuPage.me";
		} else { // 수정 실패 // => 에러 문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원정보 변경 실패");

			return "common/errorPage";
		}
	}
	@RequestMapping("region.me")
	public String region(Model model, HttpSession session, String regionUpdate) {

		Gosu g = new Gosu();
		g.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
		g.setRegion(regionUpdate);
		int result = memberService.regionUpdate(g);
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");
			return "redirect:/gosuPage.me";
		} else { // 수정 실패 // => 에러 문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원정보 변경 실패");

			return "common/errorPage";
		}
	}
	@RequestMapping("careerUpdate.me")
	public String careerUpdate(Model model, HttpSession session, String careerUpdate) {

		Gosu g = new Gosu();
		g.setUserNo(((Member) session.getAttribute("loginUser")).getUserNo());
		g.setCareer( careerUpdate);
		int result = memberService.careerUpdate(g);
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원정보가 변경되었습니다.");
			return "redirect:/gosuPage.me";
		} else { // 수정 실패 // => 에러 문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원정보 변경 실패");

			return "common/errorPage";
		}
	}

	/*
	 * @RequestMapping("homeServiceForm") public String homeservice (String
	 * homeservice, Model model) {
	 * 
	 * ArrayList<CategoryBig> bigCategoryList
	 * =memberService.SelectCategoryBigList(0);
	 * model.addAttribute("bigCategoryList", bigCategoryList); for (CategoryBig cb:
	 * bigCategoryList) {
	 * 
	 * }
	 * 
	 * 
	 * ArrayList<CategorySmall> smallCategoryList
	 * =memberService.SelectCategorySmallList(0);
	 * model.addAttribute("smallCategoryList", smallCategoryList);
	 * 
	 * return homeservice;
	 * 
	 * }
	 */
	@GetMapping("myPost.me")
	public ModelAndView selectGosuReqList(
			@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = boardService.selectGosuReqListCount();
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, 
						currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = boardService.selectGosuReqList(pi);
		

		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("member/memberMyPost");
		return mv;
	}
	/*
	 * @RequestMapping("potoAdd") public void gosuimg(ArrayList<MultipartFile>
	 * gosuImgArr, String gosuImgNo) {
	 * 
	 * 
	 * try { for(int i = 0; i < gosuImgArr.size(); i++) { String gosuImgUrl =
	 * s3Uploader.upload(gosuImgArr.get(i), "pofolImg"); memberService.potoAdd(
	 * gosuImgUrl, gosuImgNo); } } catch (IOException e) { e.printStackTrace(); } }
	 */ 
	@ResponseBody 
	@PostMapping(value="uploadFile.cp", produces="text/json; charset=UTF-8")
	public String uploadFile(HttpSession session, HttpServletRequest req, MultipartFile uploadFiles) throws IOException {
		
		String url = s3Uploader.upload(uploadFiles, "gosuImg");
		GosuImg myGosuImg = new GosuImg();
		myGosuImg.setGosuNo(((Member)session.getAttribute("loginUser")).getUserNo());
		myGosuImg.setGosuImgUrl(url);
		int result = memberService.uploadFile(myGosuImg);
		

		return "";
	}
	@ResponseBody
	@GetMapping(value="selectAllGosuImg", produces="text/json; charset=UTF-8")
	public String selectAllGosuImg(HttpSession session) throws IOException {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		ArrayList<GosuImg> list =  memberService.selectAllGosuImg(userNo);
		return new Gson().toJson(list);
	}


	
}