package com.kh.meetgo.gosu.model.dto;


import com.kh.meetgo.member.model.vo.Gosu;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class GosuOpt {
	
	private Gosu gosu;
	private String userProfile;
	private String userNickname;

	// 나중에 별점 추가
}
