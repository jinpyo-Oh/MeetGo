package com.kh.meetgo.admin.adminMember.controller;

import com.google.gson.Gson;
import com.kh.meetgo.admin.adminMember.model.service.AdminMemberService;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.member.model.service.MemberService;
import com.kh.meetgo.member.model.vo.Gosu;
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
    private final MemberService memberService;

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
        int pageLimit = 10;
        int boardLimit = 10;
        int listCount = adminMemberService.countAllMember();
        PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
        ArrayList<Member> list = adminMemberService.selectAllMember(pi);
        Map<String, Object> map = new HashMap<>();
        map.put("memberList", list);
        map.put("pi", pi);
        model.addAttribute("cPage", cPage);
        return new Gson().toJson(map);
    }
    @ResponseBody
    @GetMapping(value = "selectAllGosu.ad", produces = "text/json; charset=UTF-8")
    public String selectAllGosu(int cPage, Model model){
        int pageLimit = 10;
        int boardLimit = 10;
        int listCount = adminMemberService.countAllGosu();
        PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
        ArrayList<Gosu> list = adminMemberService.selectAllGosu(pi);
        Map<String, Object> map = new HashMap<>();
        map.put("gosuList", list);
        map.put("pi", pi);
        model.addAttribute("cPage", cPage);
        return new Gson().toJson(map);
    }

    @ResponseBody
    @PostMapping(value = "adminMemberChangeStatus.ad", produces = "text/json; charset=UTF-8")
    public String adminMemberChangeStatus(int userNo, String status){
        System.out.println(userNo);
        Member m = adminMemberService.selectOneMember(userNo);
        if(status.equals("탈퇴")){
            m.setEnrollStatus(4); // 회원 비활성화
        } else {
            Gosu g = memberService.getGosuInfoByUserNo(m.getUserNo());
            if(g == null){
                m.setEnrollStatus(1); // 일반 회원
            } else {
                m.setEnrollStatus(3); // 일반 + 고수 회원 (고수 비활성화 상태)
            }
        }
        System.out.println("m = " + m);
        int result = adminMemberService.changeEnrollStatus(m);
        if(result > 0) {
            System.out.println("관리자 회원 상태 변경 성공");
        } else {
            System.out.println("관리자 회원 상태 변경 실패");
        }
        return new Gson().toJson(m);
    }


}
