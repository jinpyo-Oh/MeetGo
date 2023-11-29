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
	private int userNo;
	private String userName;
	private String userId;
	private String userPwd;
	private String userNickname;
	private String userGender;
	private String userEmail;
	private String userPhone;
	private String userProFile;
	private Date createDate;
	private Date lastAccessDate;
	private int userStatus;

}
