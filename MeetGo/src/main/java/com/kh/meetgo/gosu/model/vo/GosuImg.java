package com.kh.meetgo.gosu.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class GosuImg {
    private int gosuImgNo;//    "GOSU_IMG_NO" NUMBER PRIMARY KEY,                -- 고수 이미지 번호
    private String gosuImgUrl;//    "GOSU_IMG_URL" VARCHAR2(500) NOT NULL,            -- URL
    private int status;//    "STATUS"      NUMBER CHECK ( STATUS IN (1, 2) ), -- 1 : 정상, 2 : 삭제
    private int gosuNo;//    "GOSU_NO"     NUMBER        NOT NULL,            -- 고수 번호
}
