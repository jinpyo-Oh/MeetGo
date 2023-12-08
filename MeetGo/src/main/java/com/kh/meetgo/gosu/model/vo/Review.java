package com.kh.meetgo.gosu.model.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Review {
    private int revNo;          //    "REV_NO"      NUMBER PRIMARY KEY,                         -- 리뷰 번호
    private String revContent;  //    "REV_CONTENT" VARCHAR2(300) NOT NULL,                     -- 리뷰 내용
    private int revPoint;       //    "REV_POINT"   NUMBER        NOT NULL,                     -- 별점
    private String revDate;     //    "REV_DATE"    DATE DEFAULT SYSDATE,                       -- 작성일
    private String revStatus;   //    "REV_STATUS"  VARCHAR2(1) CHECK ( REV_STATUS IN (1, 2) ), -- 1: 정상 2:비활성화(삭제)
    private int estNo;          //    "EST_NO"      NUMBER        NOT NULL,                     -- 견적서 번호
    private int userNo;         //    "USER_NO"     NUMBER  s      NOT NULL,                     -- 사용자 번호
    private int gosuNo;         //    "GOSU_NO"     NUMBER        NOT NULL,                     -- 고수 번호
}
