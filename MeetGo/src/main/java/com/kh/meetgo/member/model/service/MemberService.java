package com.kh.meetgo.member.model.service;

import java.util.ArrayList;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.vo.Estimate;
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

	// 회원상태 전환용 서비스 (update)
    int changeStatus(Member m);
    
    // 진행중인 견적서 개수 조회 (select)
    int selectIncompleteListCount(int userNo);
    
    // 완료된 견적수 개수 조회 (select)
    int selectCompleteListCount(int userNo);
    
    // 진행중인 견적서 조회 (select)
    ArrayList<Estimate> selectIncompleteEstimateList(PageInfo pi1, int userNo);
    
    // 완료된 견적서 조회 (select)
    ArrayList<Estimate> selectCompleteEstimateList(PageInfo pi2, int userNo);
    
    Estimate selectEstimateDetail(int eno);
}



