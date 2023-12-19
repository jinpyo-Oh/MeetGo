package com.kh.meetgo.gosu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kh.meetgo.member.model.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.gosu.model.dto.GosuOpt;
import com.kh.meetgo.gosu.model.dto.PofolOpt;
import com.kh.meetgo.gosu.model.service.GosuServiceImpl;
import com.kh.meetgo.gosu.model.vo.GosuImg;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;

@Controller
public class GosuController {
    
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private GosuServiceImpl gosuService;
    @Autowired
    private MemberService memberService;
    
    // 고수 등록페이지로 이동
    @RequestMapping("gosuEnrollForm.go")
    public String gosuEnroll() {
       return "gosu/gosuEnrollForm";
    }
    //고수 비활성화페이지로 이동
    @RequestMapping("gosuDeleteForm.go")
    public String gosuDelete() {
    	return "gosu/gosuDeleteForm";
    }
    //고수 활성화페이지로 이동
    @RequestMapping("gosuActivate.go")
    public String gosuActivate() {
    	return "gosu/gosuActivate";
    }
    
    // 고수 등록
    @RequestMapping(value = "insert.go")
    public String insertGosu(Gosu gosu, String regionMain, String regionSub, String selectedArr, HttpSession session, Model model ) {
       
       Gson gson = new Gson();
        String[] selectedArray = gson.fromJson(selectedArr, String[].class);
        
        Member m = (Member)session.getAttribute("loginUser");
        
        gosu.setUserNo(m.getUserNo());
        gosu.setGosuNo(m.getUserNo());
        
        String region = "";
        
        if(regionSub.equals("전체")) { // 시/도 - 전체 지역 선택 시
          
          region = regionMain;
          
       } else {
          
          region = regionMain + " " + regionSub;
       }
        
        gosu.setRegion(region);
        
        System.out.println(gosu);
        
        int result = gosuService.insertGosu(gosu);
        
        if(result > 0) {
           
           int result1 = 0;
           
           for (String service : selectedArray) {
              result1    += gosuService.insertGosuCate(Integer.parseInt(service), gosu.getGosuNo());
           }
           
           if(selectedArray.length == result1) {
              
              int result2 = gosuService.changeStatus(gosu.getUserNo());
           }
           m.setEnrollStatus(2);
           session.setAttribute("loginUser", m);
           session.setAttribute("alertMsg", "성공적으로 고수 등록이 완료되었습니다.");

           return "redirect:/";
           
           
        } else {
           
           model.addAttribute("errorMsg", "고수 등록에 실패하였습니다.");
           
           return "common/errorPage";
        }
    
    }
    //고수 비활성화
    @RequestMapping("gosudelete")
    public String deleteGosu(String userId,
						   String userPwd,
						   HttpSession session,
						   Model model) {
			String encPwd = ((Member)session.getAttribute("loginUser"))
				.getUserPwd();
			if(bCryptPasswordEncoder.matches(userPwd, encPwd)) {
				int result = gosuService.deleteGosu(userId);

			if(result > 0) { //탈퇴 성공
				Member m = (Member) session.getAttribute("loginUser");
                m.setEnrollStatus(3);
                memberService.changeStatus(m);
                session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "비활성화가 되었습니다.");
				return "redirect:/";
			} else { //실패
				model.addAttribute("errorMsg","비활성화 실패");
				return "common/errorPage";	
			}
			}else {
				session.setAttribute("alertMsg", "비밀번호를 잘못 입력하였습니다. 확인해주세요.");
				return "redirect:/myPage.me";
			}
    
	
    	
    }
    //고수 활성화
    @RequestMapping("gosuActivate")
    public String gosuActivate(String userId, String userPwd,HttpSession session, Model model) {

	String encPwd = ((Member)session.getAttribute("loginUser"))
		.getUserPwd();
	if(bCryptPasswordEncoder.matches(userPwd, encPwd)) {
		int result = gosuService.gosuActivate(userId);
	System.out.println(result);
	if(result > 0) { //탈퇴 성공
		Member m = (Member) session.getAttribute("loginUser");
        m.setEnrollStatus(2);
        memberService.changeStatus(m);
        session.setAttribute("loginUser", m);

		session.setAttribute("alertMsg", "활성화가 되었습니다.");
		
		return "redirect:/";
	}else { //실패
		model.addAttribute("errorMsg","활성화 실패");
		return "common/errorPage";	

	}
	}else {
		session.setAttribute("alertMsg", "비밀번호를 잘못 입력하였습니다. 확인해주세요.");
		return "redirect:/myPage.me";
	}
	

    }
    
    // 고수 찾기 포워딩
    @RequestMapping("searchMain.go")
    public String sendMain(Model model, String keyword) {
    	
    	model.addAttribute("keyword", keyword);
    	return "gosuSearch/searchMain";
    }
    
    // 고수 찾기
    @ResponseBody
    @RequestMapping(value = "searchGosu.go", produces = "text/json; charset=UTF-8")
    public String selectOptionResult(@RequestParam(value = "regionMain", defaultValue = "all")  String regionMain
    							   , String regionSub
    							   , @RequestParam(value = "categoryMain", defaultValue = "0") String categoryMain
    							   , String categorySub
    							   , String filter
    							   , @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
    							   , String keyword) {
    	
       int listCount = 0; // 전체 리스트 초기화
       ArrayList<GosuOpt> list = new ArrayList<>(); // 결과 리스트 초기화
       PageInfo pi = new PageInfo(); // PageInfo 초기화
       String region = ""; // 지역 문자열 초기화
       
           int pageLimit = 5;
           int boardLimit = 5; // 버튼 5개, 리스트 출력 5개 제한
       
       // 고수의 지역(시/도 - 전체 시 or 전국)
       if(regionSub.equals("전체") || regionMain.equals("전체")) {
    	   region = regionMain;
       } else {
    	   region = regionMain + " " + regionSub;
       }
       
       // 고수의 서비스 번호 파싱
       int categoryBigNo = Integer.parseInt(categoryMain);
       int categorySmallNo = 0;
       
       if (!categorySub.isEmpty()) {
    	   categorySmallNo = Integer.parseInt(categorySub);
       }
  
       listCount = gosuService.selectOptionalGosuCount(region, regionSub, categoryBigNo, categorySmallNo, keyword); // 조회된 회원수
          
       pi = Pagination.getPageInfo(listCount, 
            currentPage, pageLimit, boardLimit);
       list = gosuService.selectOptionalGosu(region, regionSub, categoryBigNo, categorySmallNo, keyword, filter, pi);
       
       Map<String, Object> map = new HashMap<>();

       map.put("list", list);
       map.put("pi", pi);
       
       return new Gson().toJson(map);
	} 
    // 고수 상세정보로 포워딩
    @ResponseBody
    @RequestMapping(value = "gosuDetail.go")
    public ModelAndView gosuDetail(String gno,
    							HttpSession session,
    							ModelAndView mv) {
    	
    	int gosuNo = Integer.parseInt(gno);
    	
    	int isLiked = 0;
    	
    	if(session.getAttribute("loginUser") != null) {
    		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
        	isLiked = gosuService.countGosuLike(userNo, gosuNo);
    	}
    	
    	ArrayList<GosuOpt> list = gosuService.gosuDetail(gosuNo);
    	ArrayList<GosuImg> imageList = gosuService.getGosuImg(gosuNo);
    	ArrayList<PofolOpt> pofolList = gosuService.showGosuPofol(gosuNo);
    	
    	ArrayList<GosuOpt> reviewList = gosuService.getGosuReview(gosuNo);
    	ArrayList<GosuOpt> reviewImgList = gosuService.getGosuReviewImg(gosuNo);
    	
    	
    	
    	// gno의 고수정보와 고수 이미지 리턴
    	mv.addObject("list", list)
    	.addObject("imageList", imageList).addObject("pofolList", pofolList)
        .addObject("gno", gosuNo)
        .addObject("reviewList", reviewList).addObject("reviewImgList", reviewImgList)
        .addObject("isLiked", isLiked)
    	.setViewName("gosuSearch/serviceDetail");
    	
    	return mv;
    }
     
    // 고수 좋아요 등록기능
    @ResponseBody
    @RequestMapping(value = "enrollGosuLike.go", produces = "text/json; charset=UTF-8")
    public String enrollGosuLike(String userNumber, String gosuNumber) {
    	
    	int userNo = Integer.parseInt(userNumber);
    	int gosuNo = Integer.parseInt(gosuNumber);
    	
    	int isLiked = gosuService.countGosuLike(userNo, gosuNo);
    	
    	if(isLiked > 0) { // 좋아요 기록 있을 시 delete
    		gosuService.deleteGosuLike(userNo, gosuNo);
    		return new Gson().toJson("좋아요가 취소되었습니다.");
    	} else { // 좋아요 기록 없을 시 추가
    		gosuService.insertGosuLike(userNo, gosuNo);
    		return new Gson().toJson("좋아요에 추가되었습니다");
    	}
    	
    }

    
}