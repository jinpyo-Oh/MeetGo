package com.kh.meetgo.admin.adminCommon.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.meetgo.admin.adminCommon.model.dto.ChartMemberDto;
import com.kh.meetgo.admin.adminCommon.model.service.AdminCommonService;
import com.kh.meetgo.common.config.S3Uploader;

@Controller
public class AdminCommonController {

	@Autowired
	private AdminCommonService adminService;
	
	@Autowired
	private S3Uploader s3Uploader;
	
    @RequestMapping(value = "adminMainPage.ad")
    public ModelAndView adminMainPage(ModelAndView mv){
    	
    	ArrayList<ChartMemberDto> list1 = adminService.selectMember();
    	
    	// System.out.println(list1);
    	
    	ArrayList<ChartMemberDto> list2 = adminService.selectProfit();
    	System.out.println(list2);
    	
    	int sum = 0;
    	
    	for(int i = 0; i < list2.size(); i ++) {
    		sum += (list2.get(i).getCount()/10);
    	}
    	
    	int users = adminService.selectAllUsers();
    	
    	mv.addObject("list1", list1)
    	  .addObject("list2", list2)
    	  .addObject("users", users)
    	  .addObject("sum", sum)
    	  .setViewName("admin/common/adminMainPage");
    	
        return mv;
    }
}
