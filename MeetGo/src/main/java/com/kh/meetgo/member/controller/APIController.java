package com.kh.meetgo.member.controller;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@PropertySource("classpath:config/application.properties")
public class APIController {
	
	@Value("${kakaoKey}")
    private String kakaoKey;
	
	// 카카오페이 결제용 메소드
	@PostMapping("/kakaopay.me")
	@ResponseBody
	public String kakaopay(String estNo, String userNo, String estTitle, String estPrice) {
		
		URL url;
		// System.out.println(kakaoKey);
		String link = "https://localhost:8006/meetgo";
		try {
			// URL 설정
			url = new URL("https://kapi.kakao.com/v1/payment/ready");
			
			// 서버 연결
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			// 통신방식 설정(POST 방식)
			conn.setRequestMethod("POST");
			
			// 인증정보 등록
			conn.setRequestProperty("Authorization", kakaoKey);
			
			// ConetentType 등록
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			// 내보낼 것이 있기 때문 input 은 기본적으로 true 임
			conn.setDoOutput(true);
			
			String parameter = "cid=TC0ONETIME&partner_order_id=" + estNo
							 + "&partner_user_id=" + userNo
							 + "&item_name=" + estTitle
							 + "&quantity=1&total_amount=" + estPrice
							 + "&tax_free_amount=0&approval_url=" + link
							 + "&fail_url=" + link + "/chat.ct"
							 + "&cancel_url=" + link + "/loginForm.me";
			
			OutputStream ops = conn.getOutputStream();
			DataOutputStream dps = new DataOutputStream(ops);
			
			dps.writeBytes(parameter);
			dps.flush();
			dps.close();
			
			int resultCode = conn.getResponseCode();
			
			InputStream ips;
			
			if(resultCode == 200) {
				
				ips = conn.getInputStream();
				
			} else {
				
				ips = conn.getErrorStream();
				
			}
			
			InputStreamReader isr = new InputStreamReader(ips);
			
			BufferedReader br = new BufferedReader(isr);
			
			return br.readLine();
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "Test";
	}
	
	
	
	
	
}
