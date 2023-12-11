package com.kh.meetgo.gosu.model.dto;

import com.kh.meetgo.gosu.model.vo.Pofol;
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
public class PofolOpt {
	
	private Pofol pofol;
	private Gosu gosu;
	private String userProFile;
	private String pofolImgUrl;
	private String userNickname;
	private String categorySmallName;
	private int categoryBigNo;
	private String firstImg;
	
}
