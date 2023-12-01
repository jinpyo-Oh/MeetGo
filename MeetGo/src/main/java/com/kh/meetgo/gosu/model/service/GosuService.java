package com.kh.meetgo.gosu.model.service;

import java.util.ArrayList;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.GosuOpt;
import com.kh.meetgo.member.model.vo.Gosu;

public interface GosuService {
	
	// 고수회원수 조회
	int selectAllGosuCount();
	ArrayList<GosuOpt> selectAllGosu(PageInfo pi);
	
	// 조건에 따른 고수 회원수 조회
	int selectAllRegionOptionResultCount(String region, int categoryBigNo, int categorySmallNo);
	int selectRegionOptionResultCount(String region, int categoryBigNo, int categorySmallNo);
	int selectAllRegionGosuCount(String region, int categoryBigNo, int categorySmallNo);
	int selectRegionGosuCount(String region, int categoryBigNo, int categorySmallNo);
	
	
	// 고수찾기(지역, 카테고리로 검색)
	ArrayList<GosuOpt> selectAllRegionOptionResult(String region, int categoryBigNo, int categorySmallNo, PageInfo pi);
	ArrayList<GosuOpt> selectRegionOptionResult(String region, int categoryBigNo, int categorySmallNo, PageInfo pi);
	ArrayList<GosuOpt> selectAllRegionGosu(String region, int categoryBigNo, int categorySmallNo, PageInfo pi);
	ArrayList<GosuOpt> selectRegionGosu(String region, int categoryBigNo, int categorySmallNo, PageInfo pi);
	
	// 고수등록
	int insertGosu(Gosu gosu);
	
	// 고수 카테고리 등록
	int insertGosuCate(int service, int gosuNo);
	
	// 고수로 상태변경
	int changeStatus(int userNo);
	
}
