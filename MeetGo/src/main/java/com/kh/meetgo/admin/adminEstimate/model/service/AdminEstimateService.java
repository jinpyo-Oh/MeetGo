package com.kh.meetgo.admin.adminEstimate.model.service;

import java.util.ArrayList;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.dto.ReviewDto;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.gosu.model.vo.ReviewImg;

public interface AdminEstimateService{
	
	// 진행중인 견적서 개수 조회 (select)
	int adminEstimateInComplListCount();

	// 완료된 견적서 개수 조회 (select)
	int adminEstimateComplListCount();
	
	// 진행중인 견적서 조회 (select)
	ArrayList<EstimateDto> adminEstimateComplList(PageInfo pi);

	// 완료된 견적서 조회 (select)
	ArrayList<Estimate> adminEstimateInComplList(PageInfo pi);
	
	// 견적서 상세 조회 (select)
	EstimateDto adminEstimateDetail(int eno);
	
	// 리뷰 개수 조회 (select)
	int selectReviewListCount();
	
	// 리뷰 리스트 조회 (select)
	ArrayList<ReviewDto> selectReviewList(PageInfo pi);
	
	// 리뷰 상세 조회 (select)
	ReviewDto adminReviewDetail(int rno);
	
	// 리뷰 상세 이미지 조회 (select)
	ArrayList<ReviewImg> adminReviewImg(int rno);
}
