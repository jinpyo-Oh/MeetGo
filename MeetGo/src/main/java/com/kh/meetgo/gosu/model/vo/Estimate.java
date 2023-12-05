package com.kh.meetgo.gosu.model.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Estimate {
    private int estNo;//    "EST_NO"            NUMBER PRIMARY KEY,                                       -- 견적서 번호
    private String estTitle;//    "EST_TITLE"         VARCHAR2(90)   NOT NULL,                                  -- 견적서 제목
    private String estContent;//    "EST_CONTENT"       VARCHAR2(1500) NOT NULL,                                  -- 견적서 내용
    private String estAddress;//    "EST_ADDRESS"       VARCHAR2(300)  NOT NULL,                                  -- 견적서 주소
    private String estService;//    "EST_SERVICE"       VARCHAR2(100)  NOT NULL,                                  -- 서비스 종류
    private Date startDate;//    "START_DATE"        DATE           NOT NULL,                                  -- 서비스 시작일
    private String endDate;//    "END_DATE"          DATE DEFAULT SYSDATE,                                     -- 서비스 종료일
    private Date confirmationDate;//    "CONFIRMATION_DATE" DATE           NULL,                                      -- 견적 확정일
    private String estPrice;//    "EST_PRICE"         VARCHAR2(200)         NOT NULL,                                  -- 견적 가격
    private String status;//    "STATUS"            VARCHAR2(1) CHECK ( STATUS IN ('1', '2', '3', '4', '5')), -- 1:대기, 2:취소, 3:확정, 4:결제 완료, 5:완료
    private String tid;//    "tid"               VARCHAR2(30)   NULL,                                      -- 결제 고유 번호
    private int gosuNo;//    "GOSU_NO"           NUMBER         NOT NULL,                                  -- 고수 번호
    private int userNo;//    "USER_NO"           NUMBER         NOT NULL,                                  -- 사용자 번호
}
