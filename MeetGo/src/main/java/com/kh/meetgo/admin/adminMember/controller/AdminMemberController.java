package com.kh.meetgo.admin.adminMember.controller;

import com.google.gson.Gson;
import com.kh.meetgo.admin.adminMember.model.service.AdminMemberService;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class AdminMemberController {

    private final AdminMemberService adminMemberService;

    @RequestMapping(value = "adminMemberList.ad")
    public String adminMemberList(Model model){
        model.addAttribute("cPage", 1);
        return "admin/member/adminMemberList";
    }
    @RequestMapping(value = "adminGosuList.ad")
    public String adminGosuList(){
        return "admin/member/adminGosuList";
    }

    @ResponseBody
    @GetMapping(value = "selectAllMember.ad", produces = "text/json; charset=UTF-8")
    public String selectAllMember(int cPage, Model model){
        PageInfo pi = new PageInfo();
        int pageLimit = 10;
        int boardLimit = 10; // 버튼 5개, 리스트 출력 5개 제한
        int listCount = adminMemberService.countAllMember();
        pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
        System.out.println("pi = " + pi);
        ArrayList<Member> list = adminMemberService.selectAllMember(pi);
        Map<String, Object> map = new HashMap<>();
        map.put("memberList", list);
        map.put("pi", pi);
        model.addAttribute("cPage", cPage);
        return new Gson().toJson(map);
    }

    @ResponseBody
    @PostMapping(value = "adminMemberChangeStatus.ad", produces = "text/json; charset=UTF-8")
    public String adminMemberChangeStatus(int userNo){
        System.out.println(userNo); 
        return "";
    }
}
