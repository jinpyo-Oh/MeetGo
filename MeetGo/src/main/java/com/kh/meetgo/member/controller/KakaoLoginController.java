package com.kh.meetgo.member.controller;


import com.kh.meetgo.member.model.service.KakaoLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;

@Controller
public class KakaoLoginController {

    @Autowired
    public KakaoLoginService kakaoLoginService;

    @RequestMapping(value="kakao-login", method=RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {

        String access_Token = kakaoLoginService.getAccessToken(code);
        HashMap<String, Object> userInfo = kakaoLoginService.getUserInfo(access_Token);
        System.out.println("userInfo = " + userInfo);
        return "redirect:/";

    }

}