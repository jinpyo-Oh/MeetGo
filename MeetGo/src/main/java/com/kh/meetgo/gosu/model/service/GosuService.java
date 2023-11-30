package com.kh.meetgo.gosu.model.service;

import java.util.ArrayList;

import com.kh.meetgo.gosu.model.dto.GosuOpt;

public interface GosuService {
	
	// 고수찾기(지역, 카테고리로 검색)
	ArrayList<GosuOpt> selectOptionResult(String region, int categoryBigNo, int categorySmallNo);
	
}
