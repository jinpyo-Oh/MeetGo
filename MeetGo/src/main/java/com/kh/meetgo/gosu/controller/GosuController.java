package com.kh.meetgo.gosu.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.meetgo.gosu.model.dto.GosuOpt;
import com.kh.meetgo.gosu.model.service.GosuServiceImpl;

@Controller
public class GosuController {
	
	@Autowired
	private GosuServiceImpl gosuService;
	
	// 고수 등록페이지로 이동
	@RequestMapping("gosuEnrollForm.me")
	public String gosuEnroll() {
		return "gosu/gosuEnrollForm";
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
