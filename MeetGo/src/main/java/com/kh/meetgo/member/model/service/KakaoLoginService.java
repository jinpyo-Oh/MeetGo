package com.kh.meetgo.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.kh.meetgo.member.model.dao.MemberDao;
import com.kh.meetgo.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class KakaoLoginService {
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public String getAccessToken(String authorize_code) throws Exception {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");

            sb.append("&client_id=d43939779978e5373136817cf1d4cc5d"); // REST_API키 본인이 발급받은 key 넣어주기
            sb.append("&redirect_uri=http://192.168.40.33:8006/meetgo/kakao-login"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
//            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
//            System.out.println("response body : " + result);

            // jackson objectmapper 객체 생성
            ObjectMapper objectMapper = new ObjectMapper();
            // JSON String -> Map
            Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
            });

            access_Token = jsonMap.get("access_token").toString();
            refresh_Token = jsonMap.get("refresh_token").toString();

//            System.out.println("access_token : " + access_Token);
//            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_Token;
    }

    @SuppressWarnings("unchecked")
    public Member getUserInfo(String access_Token) throws Throwable {
        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        Member member = new Member();

        String reqURL = "https://kapi.kakao.com/v2/user/me";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            try {
                // jackson objectmapper 객체 생성
                ObjectMapper objectMapper = new ObjectMapper();
                // JSON String -> Map
                Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
                });


                Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
                Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

//                System.out.println("jsonMap = " + jsonMap);
//                System.out.println("properties = " + properties);
//                System.out.println("kakao_account = " + kakao_account);

                String nickname = properties.get("nickname").toString();
                String email = kakao_account.get("email").toString();
                String userProfile = properties.get("profile_image").toString();
                String userName = kakao_account.get("name").toString();
                String userPhone = "0" + (kakao_account.get("phone_number").toString().split(" ")[1]).replaceAll("-", "");
                String userGender = (kakao_account.get("gender").toString().equals("male")) ? "M" : "F";

                member.setUserId("kakao"+jsonMap.get("id").toString());
                member.setUserNickname(nickname);
                member.setUserEmail(email);
                member.setUserProFile(userProfile);
                member.setUserName(userName);
                member.setUserPhone(userPhone);
                member.setUserGender(userGender);
                member.setUserPwd(bCryptPasswordEncoder.encode(jsonMap.get("id").toString() + nickname));
                userInfo.put("userNickname", nickname);
                userInfo.put("userEmail", email);
                userInfo.put("userProfile", userProfile);
                userInfo.put("userName", userName);
                userInfo.put("userPhone", userPhone);
                userInfo.put("userGender",userGender);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return member;
    }
}