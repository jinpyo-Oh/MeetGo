package com.kh.meetgo.gosu.model.service;

import java.util.ArrayList;

import com.kh.meetgo.gosu.model.dto.GosuOpt;
import com.kh.meetgo.member.model.vo.Gosu;

public interface GosuService {
	
	// 고수찾기(지역, 카테고리로 검색)
	ArrayList<GosuOpt> selectOptionResult(String region, int categoryBigNo, int categorySmallNo);
	
	// 고수등록
	int insertGosu(Gosu gosu);
	
	// 고수 카테고리 등록
	int insertGosuCate(int service, int gosuNo);
	
	// 고수로 상태변경
	int changeStatus(int userNo);
	
}
