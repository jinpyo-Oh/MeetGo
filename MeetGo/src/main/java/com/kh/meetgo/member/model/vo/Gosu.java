package com.kh.meetgo.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Gosu {
    private int gosuNo;             //    "GOSU_NO"           NUMBER PRIMARY KEY,     -- 고수 번호
    private String address;         //    "ADDRESS"           VARCHAR2(100) NOT NULL, -- 주소
    private String introduction;    //    "INTRODUCTION"      VARCHAR2(255) NOT NULL, -- 소개
    private String education;       //    "EDUCATION"         VARCHAR2(100) NULL,     -- 학력
    private String career;          //    "CAREER"            VARCHAR2(50)  NOT NULL, -- 경력
    private String elaborate;       //    "ELABORATE"         VARCHAR2(255) NOT NULL, -- 서비스 상세 설명
    private String region;          //    "REGION"            VARCHAR2(100) NOT NULL, -- 지역
    private String moveDistance;    //    "MOVE_DISTANCE"     VARCHAR2(150) NULL,     -- 이동 가능 거리
    private String availableTime;   //        "AVAILABLE_TIME" VARCHAR2(200) NULL,     -- 이용 가능 시간
    private int userNo;             //    "USER_NO"           NUMBER        NOT NULL,
}
