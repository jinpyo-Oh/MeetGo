package com.kh.meetgo.gosu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.meetgo.gosu.model.dto.GosuOpt;
import com.kh.meetgo.gosu.model.service.GosuServiceImpl;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;

@Controller
public class GosuController {
	
	@Autowired
	private GosuServiceImpl gosuService;
	
	// 고수 등록페이지로 이동
	@RequestMapping("gosuEnrollForm.go")
	public String gosuEnroll() {
		return "gosu/gosuEnrollForm";
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
	    		result1	+= gosuService.insertGosuCate(Integer.parseInt(service), gosu.getGosuNo());
	    	}
	    	
	    	if(selectedArray.length == result1) {
	    		
	    		int result2 = gosuService.changeStatus(gosu.getUserNo());
	    	}
	    	
	    	session.setAttribute("alertMsg", "성공적으로 고수 등록이 완료되었습니다.");

	    	return "redirect:/";
	    	
	    	
	    } else {
	    	
	    	model.addAttribute("errorMsg", "고수 등록에 실패하였습니다.");
	    	
	    	return "common/errorPage";
	    }
	    
	    
		
	}
	
	
	// 고수찾기 페이지로 이동
	@RequestMapping("searchMain.go")
	public String sendToSearchMain() {
		return "gosuSearch/searchMain";
	}
	
	// 고수 지역 선택
	@ResponseBody
	@RequestMapping(value = "searchGosu.go", produces = "text/html; charset=UTF-8")
	public ModelAndView selectOptionResult(String regionMain, String regionSub, String categoryMain, String categorySub
								   , ModelAndView mv) {
		
		// 고수의 지역
		String region = regionMain + " " + regionSub;
		
		if(regionSub.equals("전체")) {
			region = regionMain;
		}
		
		// 고수의 서비스
		int categoryBigNo = Integer.parseInt(categoryMain);
		int categorySmallNo = Integer.parseInt(categorySub);
		
		ArrayList<GosuOpt> list = gosuService.selectOptionResult(region, categoryBigNo, categorySmallNo);				
				
		mv.addObject("list", list).setViewName("gosuSearch/searchMain");
		
		return mv;
	}
	
}
