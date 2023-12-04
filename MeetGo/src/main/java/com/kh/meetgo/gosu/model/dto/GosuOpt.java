package com.kh.meetgo.gosu.model.dto;


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

	// 나중에 별점 추가
}
