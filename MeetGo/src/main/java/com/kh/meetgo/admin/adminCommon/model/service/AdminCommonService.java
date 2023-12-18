package com.kh.meetgo.admin.adminCommon.model.service;

import com.kh.meetgo.admin.adminCommon.model.dto.ChartMemberDto;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.vo.Estimate;

import java.util.ArrayList;

public interface AdminCommonService {
	
	// 회원추이차트용 (select)
	ArrayList<ChartMemberDto> selectMember();
	
	// 수익추이차트용 (select)
	ArrayList<ChartMemberDto> selectProfit();
	
	// 전체회원수 조회용 (select)
	int selectAllUsers();
}
