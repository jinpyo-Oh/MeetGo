package com.kh.meetgo.member.controller;


import com.kh.meetgo.member.model.service.KakaoLoginService;
import com.kh.meetgo.member.model.service.MemberService;
import com.kh.meetgo.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequiredArgsConstructor
public class KakaoLoginController {

    private final KakaoLoginService kakaoLoginService;
    private final MemberService memberService;
    @RequestMapping(value="kakao-login", method=RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Throwable {

        String access_Token = kakaoLoginService.getAccessToken(code);
        Member member = kakaoLoginService.getUserInfo(access_Token);
        member.setUserStatus(1);
        member.setEnrollStatus(1);

        Member member1 = memberService.selectMember(member); // 이메일로 계정 정보 불러오기
        if (member1 != null) {
            String kakaoCheck = member1.getUserId().substring(0,5);
            if(!kakaoCheck.equals("kakao")){
                session.setAttribute("errorMsg", "이미 가입한 이메일입니다.");
                return "common/errorPage";
            }
        } else {
            int result = memberService.insertKakaoMember(member);
        }
        session.setAttribute("loginUser", member1);
        return "redirect:/";
    }
}