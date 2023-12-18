package com.kh.meetgo.admin.adminBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class adminPofolController {

	@RequestMapping("showAdminPofolList.ad")
	public String showAdminPofolList() {
		// 단순 헤더에서 포워딩
		return "admin/board/adminPofolList";
	}
	
	@ResponseBody
	@RequestMapping(value = "selectAdminPofolList.ad", produces = "text/json; charset=UTF-8")
	public String selectAdminPofolList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage
									  , String keyword) {
		
		int listCount = 0;
		
		
		return null;
	}
	
	
}
