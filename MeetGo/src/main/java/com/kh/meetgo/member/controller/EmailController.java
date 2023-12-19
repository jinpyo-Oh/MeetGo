package com.kh.meetgo.member.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.meetgo.member.model.service.MemberService;
import com.kh.meetgo.member.model.vo.Member;

@Controller
public class EmailController {

    @Autowired
    private MemberService memberService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private JavaMailSender mailSender;
    private Map<String, String> certNoList = Collections.synchronizedMap(new HashMap<>());

    @ResponseBody
    @RequestMapping(value = "cert.do", produces = "text/html; charset=UTF-8")
    public String getCertNo(String email,String userPwd) {
    	

    	
        char[] charSet = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 	'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
        String str = "";
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        certNoList.put(email, "" + charSet);

        SimpleMailMessage message = new SimpleMailMessage();

        message.setSubject("MEETGO 임시 비밀번호 ");
        message.setText("안녕하세요 MEETGO 임시비밀번호입니다." + str);
        message.setTo(email);
        String encPwd = bCryptPasswordEncoder.encode(str);
        mailSender.send(message);
        certNoList.put(email, str);
        memberService.updatePassword(email, encPwd);

        return " ";
    }



}
	

		

