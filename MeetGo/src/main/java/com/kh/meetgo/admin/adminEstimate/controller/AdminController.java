package com.kh.meetgo.admin.adminEstimate.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.meetgo.admin.adminEstimate.model.service.AdminEstimateService;
import com.kh.meetgo.common.config.S3Uploader;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.gosu.model.vo.Estimate;

@Controller
public class AdminController {

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
}
