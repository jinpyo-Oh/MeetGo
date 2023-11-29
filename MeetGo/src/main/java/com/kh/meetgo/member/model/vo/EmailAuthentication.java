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
public class EmailAuthentication {
	
	private int emailNo;
	private String email;
	private Date time;
	private int authNumber;
	private String status;
}
