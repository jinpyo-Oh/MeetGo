package com.kh.meetgo.admin.adminReport.controller;

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
    
    @ResponseBody
    @RequestMapping("reportDetail.ad")
    public ModelAndView reportDetail(String rno, ModelAndView mv) {
    	
    	// System.out.println(rno);
    	int reportNo = Integer.parseInt(rno);
    	
    	ArrayList<Report> list = adminReportService.reportDetail(reportNo);
    	
    	mv.addObject("list", list).setViewName("admin/report/adminReportDetail");
    	return mv;
    }
    
    @RequestMapping("changeReportStatus.ad")
    public String changeReportStatus(String changeStatus, String targetNo, Model model, HttpSession session) {
    	
    	int reportStatus = Integer.parseInt(changeStatus);
    	int reportNo = Integer.parseInt(targetNo);
    	
    	int result = adminReportService.changeReportStatus(reportStatus, reportNo);
    	
    	if(result > 0) {
    		session.setAttribute("alertMsg", "상태 변경 완료");
    		return "redirect:/adminReportList.ad";
    	} else {
    		model.addAttribute("errorMsg", "상태 변경 실패");
    		return "common/errorPage";
    	}    	

    }
    
    
}
