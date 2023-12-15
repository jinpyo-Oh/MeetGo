package com.kh.meetgo.admin.adminMember.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMemberController {


    @RequestMapping(value = "adminMemberList.ad")
    public String adminMemberList(){
        return "admin/member/adminGosuList";
    }
    @RequestMapping(value = "adminGosuList.ad")
    public String adminGosuList(){
        return "admin/member/adminMemberList";
    }
}
