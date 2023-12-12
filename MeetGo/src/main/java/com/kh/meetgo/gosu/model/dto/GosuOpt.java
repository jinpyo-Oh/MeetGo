package com.kh.meetgo.gosu.model.dto;


import java.sql.Date;

import com.kh.meetgo.member.model.vo.Gosu;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GosuOpt {
	
	private Gosu gosu;
	private String userProfile;
	private String userNickname;
	private int categorySmallNo;
	private String categorySmallName;
    private int estimateCount;
    private Date createDate;
    private int reviewCount;
    private double totalRevPoint;
    private double avgRevPoint;

	// 나중에 별점 추가
}
