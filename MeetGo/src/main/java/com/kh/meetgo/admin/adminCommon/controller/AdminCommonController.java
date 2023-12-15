package com.kh.meetgo.admin.adminCommon.controller;

import com.kh.meetgo.admin.adminCommon.model.service.AdminCommonService;
import com.kh.meetgo.common.config.S3Uploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCommonController {

	@Autowired
	private AdminCommonService adminService;
	
	@Autowired
	private S3Uploader s3Uploader;
	
    @RequestMapping(value = "adminMainPage.ad")
    public String adminMainPage(){
        return "admin/common/adminMainPage";
    }
}
