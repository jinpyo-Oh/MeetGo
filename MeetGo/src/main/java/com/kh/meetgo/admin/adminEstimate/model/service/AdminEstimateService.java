package com.kh.meetgo.admin.adminEstimate.model.service;

public interface AdminEstimateService{
	
	// 진행중인 견적서 개수 조회 (select)
	int adminEstimateComplListCount();

	// 진행중인 견적서 개수 조회 (select)
	int adminEstimateInComplListCount();
	
}
