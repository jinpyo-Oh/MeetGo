package com.kh.meetgo.gosu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GosuController {
	
	@RequestMapping("gosuEnrollForm.me")
	public String gosuEnroll() {
		
		return "gosu/gosuEnrollForm";
	}
	
}
