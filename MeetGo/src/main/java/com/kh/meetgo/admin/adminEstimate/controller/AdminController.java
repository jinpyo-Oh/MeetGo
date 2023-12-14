package com.kh.meetgo.admin.adminEstimate.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.meetgo.admin.adminEstimate.model.service.AdminEstimateService;
import com.kh.meetgo.common.config.S3Uploader;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.vo.Estimate;

@Controller
public class AdminController {

	@Autowired
	private AdminEstimateService adminService;
	
	@Autowired
	private S3Uploader s3Uploader;
	
	@RequestMapping("adminEstimateList.ad")
	public ModelAndView adminEstimateList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount1 = adminService.adminEstimateComplListCount();
		int listCount2 = adminService.adminEstimateInComplListCount();

		// System.out.println(listCount1);
		// System.out.println(listCount2);
		
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi1 = Pagination.getPageInfo(listCount1,currentPage, pageLimit, boardLimit);
		PageInfo pi2 = Pagination.getPageInfo(listCount2,currentPage, pageLimit, boardLimit);

		System.out.println(pi1);
		System.out.println(pi2);
		
		ArrayList<Estimate> list1 = adminService.adminEstimateInComplList(pi1);
		ArrayList<EstimateDto> list2 = adminService.adminEstimateComplList(pi2);
		
		System.out.println(list1);
		for(int i = 0; i < list2.size(); i++) {
			
			System.out.println(list2.get(i));
		}
		
		mv.addObject("incomList", list1).addObject("pi1", pi1)
	      .addObject("comList", list2).addObject("pi2", pi2)
		  .setViewName("admin/estimate/adminEstimateList");		
		
		return mv;
	}
	
//	@Autowired
//	private AdminEstimateService adminService;
//	
//	@Autowired
//	private S3Uploader s3Uploader;
//	
//	@RequestMapping("adminEstimateList.ad")
//	public void adminEstimateList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage) {
//		
//		int listCount1 = adminService.adminEstimateComplListCount();
//		int listCount2 = adminService.adminEstimateInComplListCount();
//
//		// System.out.println(listCount1);
//		// System.out.println(listCount2);
//		
//		int pageLimit = 5;
//		int boardLimit = 5;
//		
//		PageInfo pi1 = Pagination.getPageInfo(listCount1,currentPage, pageLimit, boardLimit);
//		PageInfo pi2 = Pagination.getPageInfo(listCount2,currentPage, pageLimit, boardLimit);
//
//		// ArrayList<Estimate> list1 = 
//		
//		
//	}
    @RequestMapping(value = "adminMainPage.ad")
    public String adminMainPage(){
        return "admin/common/adminMainPage";
    }
}
