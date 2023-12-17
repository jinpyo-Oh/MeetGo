package com.kh.meetgo.admin.adminEstimate.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.meetgo.admin.adminEstimate.model.service.AdminEstimateService;
import com.kh.meetgo.common.config.S3Uploader;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.dto.ReviewDto;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.gosu.model.vo.ReviewImg;

@Controller
public class AdminEstimateController {

	@Autowired
	private AdminEstimateService adminService;
	
	@Autowired
	private S3Uploader s3Uploader;
	
	// 관리자페이지 계약관리 (시작)
	@RequestMapping("adminEstimateList.ad")
	public ModelAndView adminEstimateList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		mv.setViewName("admin/estimate/adminEstimateList");		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("adminInComEst.ad")
	public String adminInComList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage, Model model) {
		
		int listCount2 = adminService.adminEstimateInComplListCount();
		
		// System.out.println(listCount2);
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi2 = Pagination.getPageInfo(listCount2,currentPage, pageLimit, boardLimit);
		
		ArrayList<Estimate> list2 = adminService.adminEstimateInComplList(pi2);
		
		model.addAttribute("cPage", currentPage);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("pi2", pi2);
		map.put("list2", list2);
		
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@GetMapping("adminComEst.ad")
	public String adminComList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage, Model model) {
		
		int listCount1 = adminService.adminEstimateComplListCount();
		
		// System.out.println(listCount2);
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi1 = Pagination.getPageInfo(listCount1,currentPage, pageLimit, boardLimit);
		
		ArrayList<EstimateDto> list1 = adminService.adminEstimateComplList(pi1);
				
		model.addAttribute("cPage", currentPage);
		
		Map<String, Object> map = new HashMap<>();
		
		// System.out.println(pi1);
		// System.out.println(list1);
		
		
		map.put("pi1", pi1);
		map.put("list1", list1);
		
		return new Gson().toJson(map);
	}
	
	@RequestMapping("adminEstimateDetail.ad")
	public ModelAndView adminEstimateDetail(String eno, ModelAndView mv) {
		
		int estNo = 0;
		
		if(!eno.isEmpty()) {
			estNo = Integer.parseInt(eno);
		}
		
		EstimateDto est = adminService.adminEstimateDetail(estNo);
		
		// System.out.println(est.getEstimate());
		// System.out.println(est.getUserName());
		// System.out.println(est.getGosuName());
		
		
		mv.addObject("est", est).setViewName("admin/estimate/adminEstimateDetail");
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("adminEstimateSearch.ad")
	public String adminEstimateSearch(@RequestParam(value = "cPage", defaultValue ="1") int currentPage, String keyword, String condition, Model model) {
		
		int listCount = adminService.adminEstimateSearchCount(keyword, condition);
		//System.out.println(listCount);
		
		int pageLimit = 5;
		int boardLimit = 10;
	
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<EstimateDto> list = adminService.adminEstimateSearch(pi, keyword, condition);
//		System.out.println(list.get(0));
//		System.out.println(list.get(1));
//		System.out.println(list.get(2));
//		System.out.println(list.get(3));
//		System.out.println(list.get(4));
		
		model.addAttribute("cPage", currentPage);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("pi", pi);
		map.put("list", list);
		
		// System.out.println(map);
		
		return new Gson().toJson(map);
	}
	// 관리자페이지 계약관리 (끝)
	
	// 관리자페이지 리뷰관리 (시작)
	@RequestMapping("adminReviewList.ad")
	public ModelAndView adminReviewList(@RequestParam(value = "cPage", defaultValue ="1") int currentPage, ModelAndView mv) {
		
		int listCount = adminService.selectReviewListCount();
		
		// System.out.println(listCount);
	
		int pageLimit = 5;
		int boardLimit = 10;
	
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<ReviewDto> list = adminService.selectReviewList(pi);
		
		// System.out.println(list);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/estimate/adminReviewList");
		
		return mv;
	}
	
	@RequestMapping("adminReviewDetail.ad")
	public ModelAndView adminReviewDetail(String rno, ModelAndView mv) {
		
		// System.out.println(rno);
		
		int revNo = 0;
		
		if(!rno.isEmpty()) {
			revNo = Integer.parseInt(rno);
		}
		
		ReviewDto list = adminService.adminReviewDetail(revNo);
		ArrayList<ReviewImg> imgList = adminService.adminReviewImg(revNo);
		
		// System.out.println(list);
		// System.out.println(imgList);
		
		if(!imgList.isEmpty()) {

			mv.addObject("list", list).addObject("imgList", imgList)
					.setViewName("admin/estimate/adminReviewDetail");
		} else {

			mv.addObject("list", list).setViewName("admin/estimate/adminReviewDetail");
		}
		
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("adminReviewSearch.ad")
	public String adminReviewSearch(@RequestParam(value = "cPage", defaultValue ="1") int currentPage,String keyword, String condition, Model model) {
		
		// System.out.println(keyword);
		// System.out.println(condition);
		
		int listCount = adminService.adminReviewSearchCount(keyword, condition);
		//System.out.println(listCount);
		
		int pageLimit = 5;
		int boardLimit = 10;
	
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<ReviewDto> list = adminService.adminReviewSearch(pi, keyword, condition);
		
		// System.out.println(list);
		
		model.addAttribute("cPage", currentPage);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("pi", pi);
		map.put("list", list);
		
		// System.out.println(map);
		
		return new Gson().toJson(map);
	}
	
	// 관리자페이지 리뷰관리 (끝)
	
	
	
	
	
	
	
	
}
