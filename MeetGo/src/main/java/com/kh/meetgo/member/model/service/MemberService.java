package com.kh.meetgo.member.model.service;

import java.util.ArrayList;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.dto.ReviewDto;
import com.kh.meetgo.gosu.model.vo.*;
import com.kh.meetgo.member.model.dto.GosuInfoCntRequest;
import com.kh.meetgo.member.model.dto.ServiceCategoryRequest;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;

public interface MemberService {

	// 로그인 서비스 (select)
	Member loginMember(Member m);

	// 회원가입 서비스 (insert)
	int insertMember(Member m);

	// 회원정보수정 서비스 (update)
	int updateMember(Member m);

	// 회원탈퇴 서비스 (update)
	int deleteMember(String userId);

	// 아이디중복체크 서비스 (select)
	int idCheck(String checkId);

	//비밀번호 체크
	int pwdCheck(String checkPwd);

	//이메일 체크
	int emailCheck(String checkEmail);

	//프로필 사진 업로드
	int uploadImg(String imgUpload);

	// 회원상태 전환용 서비스 (update)
	int changeStatus(Member m);

	// 진행중인 견적서 개수 조회 (select)
	int selectIncompleteListCount(int userNo);

	// 완료된 견적수 개수 조회 (select)
	int selectCompleteListCount(int userNo);

	// 진행중인 견적서 조회 (select)
	ArrayList<Estimate> selectIncompleteEstimateList(PageInfo pi1, int userNo);

	// 완료된 견적서 조회 (select)
	ArrayList<EstimateDto> selectCompleteEstimateList(PageInfo pi2, int userNo);

	// 견적서 상세조회 (select)
	Estimate selectEstimateDetail(int eno);

	// 유저번호, 고수번호로 이름 가져오기(select)
	String getName(int userNo);

	// 결제
	int payService(String estNo, String tid);

	// 견적서 상태 변경
	int updateStatus(int estNo);

	// 리뷰 등록
	int reviewEnroll(Review review);

	// 리뷰 이미지 등록
	int reviewImageEnroll(ReviewImg reImg);

	// 내 리뷰 개수 조회 (select)
	int reviewListCount(int userNo);

	// 내 리뷰 리스트 조회 (select)
	ArrayList<ReviewDto> myReviewList(PageInfo pi, int userNo);

	// 내 리뷰 상세 조회 (select)
	ReviewDto myReviewDetail(int revNo);

	// 내 리뷰 상세 이미지 조회
	ArrayList<ReviewImg> myReviewDetailImg(int revNo);

	// 내 리뷰 삭제
	int deleteReview(int revNo);

	// 서비스 이행 완료
	int completeEstimate(int eno);
	
	Member selectMember(Member member);

	int insertKakaoMember(Member member);
    //고수 상세설명 수정하기

	int elaborateUpdate(Gosu g);
	//고수 자기소개 수정하기
	int introductionUpdate(Gosu g);
	//고수 이용시간 수정하기
	int availableTimeUpdate(Gosu g);
	//학력 수정하기
	int educationUpdate(Gosu g);
	//활동 이동 가능 거리 수정하기
	int moveDistanceUpdate(Gosu g);
	//직원수 수정하기
	int employeesUpdate(Gosu g);
	//고수 지역 수정하기
	int regionUpdate(Gosu g);
	//고수 경력 수정하기
	int careerUpdate(Gosu g);

	int uploadFile(GosuImg gosuImg);

	Gosu getGosuInfoByUserNo(int userNo);

	ArrayList<GosuImg> selectAllGosuImg(int userNo);


	
	
	ArrayList<Member> selectWishlist(int gosuNo);
	// 내게 쓰여진 리뷰 개수 조회 (select)
	int WrittenReviewToMeCount(int gosuNo);
	
	// 내게 쓰여진 리뷰 조회 (select)
	ArrayList<ReviewDto> WrittenReviewToMe(PageInfo pi, int gosuNo);
	
	// 내게 쓰여진 리뷰 상세조회 (selelct)
	ReviewDto WrittenReviewDetail(int revNo);

	int checkEmail(String checkEmail);

	int deleteGosuImg(int gosuImgNo);

	GosuInfoCntRequest gosuInfoDetailCnt(int userNo);

	ArrayList<CategorySmall> selectAllService(int loginUser);

	ArrayList<ServiceCategoryRequest> selectAllServiceCategory();

	int insertGosuService(String categorySmallNo, int userNo);

	int deleteGosuService(String categorySmallNo, int userNo);
}