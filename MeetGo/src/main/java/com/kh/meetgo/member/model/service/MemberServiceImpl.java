package com.kh.meetgo.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.vo.CategoryBig;
import com.kh.meetgo.gosu.model.vo.CategorySmall;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.member.model.dao.MemberDao;
import com.kh.meetgo.member.model.vo.Gosu;
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
	public int emailCheck(String checkEmail) {
		return memberDao.emailCheck(sqlSession, checkEmail);
		
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


	/*
	 * @Override public ArrayList<Estimate> selectCompleteEstimateList(PageInfo pi2,
	 * int userNo) { return memberDao.selectCompleteEstimateList(sqlSession, pi2,
	 * userNo); }
	 */
	 
	@Override
	public Estimate selectEstimateDetail(int eno) {
		return memberDao.selectEstimateDetail(sqlSession, eno);
	}

	@Override
	public String getName(int userNo) {
		return memberDao.getName(sqlSession, userNo);
	}
	@Override
	public int elaborateUpdate(Gosu g) {
		return memberDao.elaborateUpdate(sqlSession, g);
	}
	@Override
	public int introductionUpdate(Gosu g) {
		return memberDao.introductionUpdate(sqlSession,g);
	}

	@Override
	public Gosu getGosuInfoByUserNo(int userNo) {
		// TODO Auto-generated method stub
		return memberDao.getGosuInfoByUserNo(sqlSession,userNo);
	}

	@Override
	public int availableTimeUpdate(Gosu g) {
		// TODO Auto-generated method stub
		return memberDao.availableTimeUpdate(sqlSession,g);
	}

	@Override
	public int educationUpdate(Gosu g) {
		// TODO Auto-generated method stub
		return memberDao.educationUpdate(sqlSession,g);
	}

	@Override
	public int moveDistanceUpdate(Gosu g) {
		// TODO Auto-generated method stub
		return memberDao.moveDistanceUpdate(sqlSession,g);
	}
	@Override
	public int employeesUpdate(Gosu g) {
		// TODO Auto-generated method stub
		return memberDao.employeesUpdate(sqlSession,g);
	}
	/*
	 * @Override public ArrayList<CategoryBig> SelectCategoryBigList(int
	 * categoryBigNo){ return
	 * memberDao.SelectCategoryBigList(sqlSession,categoryBigNo); }
	 * 
	 * @Override public ArrayList<CategorySmall> SelectCategorySmallList(int
	 * categorySmallNo) { // TODO Auto-generated method stub return
	 * memberDao.SelectCategorySmallList(sqlSession, categorySmallNo); }
	 */

	@Override
	public int regionUpdate(Gosu g) {
		// TODO Auto-generated method stub
		return memberDao.regionUpdate(sqlSession,g);
	}

	@Override
	public int careerUpdate(Gosu g) {
		// TODO Auto-generated method stub
		return memberDao.careerUpdate(sqlSession,g);
	}


	  @Override public int insertKakaoMember(Member member) { return
	  memberDao.insertKakaoMember(sqlSession,member); }
	  
	  @Override public Member selectMember(Member member) { return
	  memberDao.selectMember(sqlSession, member); }

	@Override
	public ArrayList<Estimate> selectCompleteEstimateList(PageInfo pi2, int userNo) {
		// TODO Auto-generated method stub
		return null;
	}
	 







}
