package com.kh.meetgo.admin.adminEstimate.model.service;

import java.util.ArrayList;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.vo.Estimate;

public interface AdminEstimateService{
	
	// 진행중인 견적서 개수 조회 (select)
	int adminEstimateInComplListCount();

	// 완료된 견적서 개수 조회 (select)
	int adminEstimateComplListCount();
	
	// 진행중인 견적서 조회 (select)
	ArrayList<EstimateDto> adminEstimateComplList(PageInfo pi);

	// 완료된 견적서 조회 (select)
	ArrayList<Estimate> adminEstimateInComplList(PageInfo pi);
}
