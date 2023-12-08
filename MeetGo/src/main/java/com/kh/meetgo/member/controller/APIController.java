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
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.meetgo.common.model.vo.StringToJson;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.member.model.service.MemberService;

@Controller
@PropertySource("classpath:config/application.properties")
public class APIController {
	
	@Autowired
	private MemberService memberService;
	
	@Value("${kakaoKey}")
    private String kakaoKey;
	
	// 카카오페이 결제용 메소드
	@PostMapping(value="/kakaopay.me", produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String kakaopay(String estNo, String userNo, String estTitle, String estPrice) {
		
		URL url;
		
		estPrice = estPrice.replaceAll(",", "");
		estPrice = estPrice.replaceAll("원", "");
		// System.out.println(kakaoKey);
		String link = "http://localhost:8006/meetgo";
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
							 + "&item_name=" + URLEncoder.encode(estTitle, "UTF-8")
							 + "&quantity=1&total_amount=" + estPrice
							 + "&tax_free_amount=0&approval_url=" + link +"/approve.me?eno="+estNo                    
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
			
			String ele[] = StringToJson.stringToJson(br, "next_redirect_pc_url", "tid");
			String approveLink = ele[0];
			String tid = ele[1];

			int result = memberService.payService(estNo, tid);
			
			return new Gson().toJson(approveLink);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return "{\"result\":\"NO\"}";
	}
	
	@RequestMapping("approve.me")
	public String approve(String pg_token, HttpSession session, String eno) {
		
		// System.out.println(pg_token);
		// System.out.println(estNo);
		
		URL url;
		
		String link = "http://localhost:8006/meetgo";
		
		int estNo = Integer.parseInt(eno);
		
		Estimate est = memberService.selectEstimateDetail(estNo);
		
		try {
			// URL 설정
			url = new URL("	https://kapi.kakao.com/v1/payment/approve");
			
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
			
			String parameter = "cid=TC0ONETIME&tid=" + est.getTid() 
							 + "&partner_order_id=" + estNo
							 + "&partner_user_id=" + est.getUserNo()
							 + "&pg_token=" + pg_token;
			
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
			
			int result = memberService.updateStatus(estNo);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "estimate/estimateApprove";
	}
	
	
	
}
