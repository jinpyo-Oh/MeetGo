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
	private String userName;
	private int categorySmallNo;
	private String categorySmallName;
    private int estimateCount;
    private Date createDate;
    private int reviewCount;
    private double totalRevPoint;
    private double avgRevPoint;
    private String reviewContent;
    private Date reviewDate;
    private int reviewPoint;
    private int reviewNo;
    private String reviewImgUrl;

	// 나중에 별점 추가
}
