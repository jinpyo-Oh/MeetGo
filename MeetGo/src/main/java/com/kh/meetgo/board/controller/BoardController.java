package com.kh.meetgo.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("test.do")
	public String test() {
		return "board/tip/tipDetail";
	}
	@RequestMapping("page.do")
	public String page() {
		return "board/gosuRequest/gosuWrite";
	}
}
