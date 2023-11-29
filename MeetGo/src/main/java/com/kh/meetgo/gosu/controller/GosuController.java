package com.kh.meetgo.gosu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GosuController {
	
	@RequestMapping("gosuEnrollForm.me")
	public String gosuEnroll() {
		
		return "gosu/gosuEnrollForm";
	}
	
	// 고수찾기 페이지로 이동
	@RequestMapping("searchMain.go")
	public String sendToSearchMain() {
		return "gosuSearch/searchMain";
	}	
	
}
