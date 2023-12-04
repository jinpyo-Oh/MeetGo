package com.kh.meetgo.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.member.model.dao.MemberDao;
import com.kh.meetgo.member.model.vo.Member;

@Service
// Service 타입의 어노테이션을 붙여주면
// 빈 스캐닝을 통해 자동으로 bean 으로 등록됨
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;

	
	@Override
	public Member loginMember(Member m) {

		/*
		 * * 기존 MyBatis 를 연동한 Service 단 코드 흐름
		 * 1. SqlSession 객체 생성
		 * 2. SqlSession 과 전달값을 DAO 로 넘기면서
		 *    요청 후 결과 받기
		 * 3. 트랜잭션 처리
		 * 4. SqlSession 객체 반납
		 * 5. 결과 리턴
		 * 
		 * => Spring 에서는 SqlSession 객체 대신
		 *    SqlSessionTemplate 객체를 이용할 것임!!
		 *    (root-context.xml 에 bean 으로 등록해놨음)
		 * => bean 으로 등록해뒀기 때문에
		 *    SqlSessionTemplate 객체를 직접 생성할 필요가 없음!!
		 *    (@Autowired 를 이용해서 생성받으면 됨)
		 * => 또한, 스프링이이 SqlSessionTemplate 객체를 관리해주기 때문에
		 *    내가 직접 SqlSession 객체를 반납할 필요도 없어짐!!
		 * => 트랜잭션 처리 또한 스프링한테 맡길 예정
		 */
		
		// Member loginUser = memberDao.loginMember(sqlSession, m);
		// return loginUser;
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String userId) {
		return memberDao.deleteMember(sqlSession, userId);
	}

	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	@Override
	public int pwdCheck(String checkPwd) {
		return memberDao.pwdCheck(sqlSession, checkPwd);
		
	}

	@Override
	public int changeStatus(Member m) {
		return memberDao.changeStatus(sqlSession,m);
	}

	@Override
	public int selectIncompleteListCount(int userNo) {
		return memberDao.selectIncompleteListCount(sqlSession, userNo);
	}

	@Override
	public int selectCompleteListCount(int userNo) {
		return memberDao.selectCompleteListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Estimate> selectIncompleteEstimateList(PageInfo pi1, int userNo) {
		return memberDao.selectIncompleteEstimateList(sqlSession, pi1, userNo);
	}

	@Override
	public ArrayList<Estimate> selectCompleteEstimateList(PageInfo pi2, int userNo) {
		return memberDao.selectCompleteEstimateList(sqlSession, pi2, userNo);
	}

	@Override
	public Estimate selectEstimateDetail(int eno) {
		return memberDao.selectEstimateDetail(sqlSession, eno);
	}


}
