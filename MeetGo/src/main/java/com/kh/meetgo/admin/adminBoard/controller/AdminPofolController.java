package com.kh.meetgo.admin.adminBoard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.meetgo.admin.adminBoard.model.service.AdminPofolServiceImpl;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.gosu.model.dto.PofolOpt;

@Controller
public class AdminPofolController {

	@Autowired
	private AdminPofolServiceImpl adminPofolService;
	
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
		listCount = adminPofolService.selectAdminPofolListCount(keyword);
		
		int pageLimit = 5;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<PofolOpt> list = adminPofolService.selectAdminPofolList(keyword, pi);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pi", pi);
		
		return new Gson().toJson(map);
		
	}
	
	@ResponseBody
	@RequestMapping("adminPofolDetail.ad")
	public ModelAndView adminPofolDetail(ModelAndView mv, String pno) {
		
		int pofolNo = Integer.parseInt(pno);
		
		ArrayList<PofolOpt> list = adminPofolService.adminPofolDetail(pofolNo);
		
		mv.addObject("list", list).setViewName("admin/board/adminPofolDetail");
		
		return mv;
	}
	
	@RequestMapping("changePofolStatus.ad")
	public String changePofolStatus(Model model, HttpSession session, int pofolNo, int pofolStatus) {
		
		int result = adminPofolService.changePofolStatus(pofolNo, pofolStatus);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "포트폴리오 상태 변경 성공");
			return "redirect:/showAdminPofolList.ad";
		} else {
			model.addAttribute("errorMsg", "상태 변경 실패");
			return "common/errorPage";
		}
	}
	
	
}
