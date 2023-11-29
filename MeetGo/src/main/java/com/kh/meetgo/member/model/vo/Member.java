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
	private String userId;   //	USER_ID	VARCHAR2(30 BYTE)
	private String userPwd;  //	USER_PWD	VARCHAR2(100 BYTE)
	private String userName; //	USER_NAME	VARCHAR2(15 BYTE)
	private String email;	 //	EMAIL	VARCHAR2(100 BYTE)
	private String gender;   //	GENDER	VARCHAR2(1 BYTE)
	private String age;		 //	AGE	NUMBER
	private String phone;	
	private String address;
	private Date enrollDate; 
	private Date modifyDate;
	private String status;
}
