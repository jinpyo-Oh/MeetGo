package com.kh.meetgo.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Member {
    private int userNo;         //    USER_NO          NUMBER PRIMARY KEY,                                   -- 유저 번호
    private String userName;    //    USER_NAME        VARCHAR2(30)                                NOT NULL, -- 이름
    private String userId;      //    USER_ID          VARCHAR2(30) UNIQUE                         NOT NULL, -- 아이디
    private String userPwd;     //    USER_PWD         VARCHAR2(30)                                NOT NULL, -- 비밀번호
    private String userNickname;//    USER_NICKNAME    VARCHAR2(30) UNIQUE                         NOT NULL, -- 닉네임
    private String userGender;  //    USER_GENDER      CHAR(1) CHECK ( USER_GENDER IN ('M', 'F') ) NOT NULL, -- 성별 (M:남, F:여)
    private String userEmail;   //    USER_EMAIL       VARCHAR2(30) UNIQUE                         NOT NULL, -- 이메일 (인증 필요)
    private String userPhone;   //    USER_PHONE       VARCHAR2(20)                                NOT NULL, -- 번호
    private String userProfile; //    USER_PROFILE     VARCHAR2(1000)                              NULL,     -- 프로필 이미지
    private Date createDate;    //    CREATE_DATE      DATE DEFAULT SYSDATE,                                 -- 생성일자
    private Date lastAccessDate;//    LAST_ACCESS_DATE DATE DEFAULT SYSDATE,                                 -- 최근 접속일
    private int userStatus;     //    USER_STATUS      NUMBER CHECK (USER_STATUS IN (1, 2, 3))     NULL      -- 1: 일반사용자,  2: 고수,  3: 비활성화(탈퇴)
}
