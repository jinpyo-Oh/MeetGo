package com.kh.meetgo.gosu.model.service;

import java.util.ArrayList;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.GosuOpt;
import com.kh.meetgo.gosu.model.dto.PofolOpt;
import com.kh.meetgo.gosu.model.vo.GosuImg;
import com.kh.meetgo.member.model.vo.Gosu;

public interface GosuService {
	
	// 고수찾기 회원수 조회
	int selectOptionalGosuCount(String region, String regionSub, int categoryBigNo, int categorySmallNo);
	
	// 고수찾기
	ArrayList<GosuOpt> selectOptionalGosu(String region, String regionSub, int categoryBigNo, int categorySmallNo, String filter, PageInfo pi);

	// 고수찾기 상세정보
	ArrayList<GosuOpt> gosuDetail(int gosuNo);
	// 고수 이미지 가져오기
	ArrayList<GosuImg> getGosuImg(int gosuNo);
	// 리뷰가져오기
	ArrayList<GosuOpt> getGosuReview(int gosuNo);
	ArrayList<GosuOpt> getGosuReviewImg(int gosuNo);
	
	// 고수등록
	int insertGosu(Gosu gosu);
	//고수 비활성화
	int deleteGosu(String userId);
	//고수 활성화
	int gosuActivate(String userId);
	// 고수 카테고리 등록
	int insertGosuCate(int service, int gosuNo);
	
	// 고수로 상태변경
	int changeStatus(int userNo);
	
	// 고수찾기 - 해당 고수 포폴정보조회
	ArrayList<PofolOpt> showGosuPofol(int gosuNo);
			
}
