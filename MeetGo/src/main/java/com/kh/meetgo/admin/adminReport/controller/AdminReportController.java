package com.kh.meetgo.admin.adminReport.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.meetgo.admin.adminCommon.model.service.AdminCommonService;
import com.kh.meetgo.admin.adminReport.model.service.AdminReportServiceImpl;
import com.kh.meetgo.common.config.S3Uploader;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.model.vo.Report;
import com.kh.meetgo.common.template.Pagination;

@Controller
public class AdminReportController {

    @Autowired
    private AdminCommonService adminService;
    
    @Autowired
    private AdminReportServiceImpl adminReportService;

    @Autowired
    private S3Uploader s3Uploader;

    @RequestMapping(value = "adminReportList.ad")
    public String adminMainPage(){
        return "admin/report/adminReportList";
    }
    
    @ResponseBody
    @RequestMapping(value = "selectReportList.ad", produces = "text/json; charset=UTF-8")
    public String selectReportList(String option
    			    , @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
    	
    	int listCount = 0; // 전체 리스트 초기화
        ArrayList<Report> list = new ArrayList<>(); // 결과 리스트 초기화
        PageInfo pi = new PageInfo(); // PageInfo 초기화
    	
        int pageLimit = 10;
        int boardLimit = 5;
        
    	int reportStatus = Integer.parseInt(option);
    	
    	listCount = adminReportService.selectReportListCount(reportStatus);
    	
    	pi = Pagination.getPageInfo(listCount, 
    	    currentPage, pageLimit, boardLimit);
    	
    	list = adminReportService.selectReportList(reportStatus, pi);
    	
    	Map<String, Object> map = new HashMap<>();

        map.put("list", list);
        map.put("pi", pi);
    	    	
        return new Gson().toJson(map);
    }
    
    
}
