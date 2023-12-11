package com.kh.meetgo.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Member {
    private int userNo;
    private String userName;
    private String userId;
    private String userPwd;
    private String userNickname;
    private String userGender;
    private String userEmail;
    private String userPhone;
    private String address;
    private String userProFile;
    private Date createDate;
    private Date lastAccessDate;
    private int userStatus;
    private int enrollStatus;

	/*USER_NO	NUMBER	No		1
	USER_NAME	VARCHAR2(30 BYTE)	No		2
	USER_ID	VARCHAR2(30 BYTE)	No		3
	USER_PWD	VARCHAR2(30 BYTE)	No		4
	USER_NICKNAME	VARCHAR2(30 BYTE)	No		5
	USER_GENDER	CHAR(1 BYTE)	No		6
	USER_EMAIL	VARCHAR2(30 BYTE)	No		7
	USER_PHONE	VARCHAR2(20 BYTE)	No		8
	USER_PROFILE	VARCHAR2(1000 BYTE)	Yes		9
	CREATE_DATE	DATE	Yes	SYSDATE	10
	LAST_ACCESS_DATE	DATE	Yes	SYSDATE	11
	USER_STATUS	NUMBER	Yes		12	*/
}
