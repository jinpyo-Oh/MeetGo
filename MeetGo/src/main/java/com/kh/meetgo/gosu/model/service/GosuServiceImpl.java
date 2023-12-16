package com.kh.meetgo.gosu.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dao.GosuDao;
import com.kh.meetgo.gosu.model.dto.GosuOpt;
import com.kh.meetgo.gosu.model.dto.PofolOpt;
import com.kh.meetgo.gosu.model.vo.GosuImg;
import com.kh.meetgo.member.model.vo.Gosu;

@Service
public class GosuServiceImpl implements GosuService {
	
	@Autowired
	private GosuDao gosuDao;
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	// 고수찾기 회원수 카운트
	@Override
	public int selectOptionalGosuCount(String region, String regionSub, int categoryBigNo, int categorySmallNo) {
		return gosuDao.selectOptionalGosuCount(sqlSession, region, regionSub, categoryBigNo, categorySmallNo);
	}
	
	// 고수찾기 조회결과
	@Override
	public ArrayList<GosuOpt> selectOptionalGosu(String region, String regionSub, int categoryBigNo, int categorySmallNo, String filter, PageInfo pi) {
		return gosuDao.selectOptionalGosu(sqlSession, region, regionSub, categoryBigNo, categorySmallNo, filter, pi);
	}
	
	// 고수찾기 상세정보 조회
	@Override
	public ArrayList<GosuOpt> gosuDetail(int gosuNo) {
		return gosuDao.gosuDetail(sqlSession, gosuNo);
	}
	
	// 고수찾기 이미지 불러오기
	@Override
	public ArrayList<GosuImg> getGosuImg(int gosuNo){
		return gosuDao.getGosuImg(sqlSession, gosuNo);
	}
	// 고수 좋아요 기록 검사
	@Override
	public int countGosuLike(int userNo, int gosuNo) {
		return gosuDao.countGosuLike(sqlSession, userNo, gosuNo);
	}
	@Override
	public int deleteGosuLike(int userNo, int gosuNo) {
		return gosuDao.deleteGosuLike(sqlSession, userNo, gosuNo);
	}
	public int insertGosuLike(int userNo, int gosuNo) {
		return gosuDao.insertGosuLike(sqlSession, userNo, gosuNo);
	}
	

	// 고수 등록용 메소드
	@Override
	public int insertGosu(Gosu gosu) {
		
		return gosuDao.insertGosu(sqlSession, gosu);
	}
	//고수 비활성화 메소드
	@Override
	public int deleteGosu(String userId) {
		// TODO Auto-generated method stub
		return gosuDao.deleteGosu(sqlSession,userId);
	}
	
	// 고수 서비스 등록용 메소드
	@Override
	public int insertGosuCate(int service, int gosuNo) {
		
		return gosuDao.insertGosuCate(sqlSession, service, gosuNo);
	}
	
	// 고수로 상태변경용 메소드
	@Override
	public int changeStatus(int userNo) {
		return gosuDao.changeStatus(sqlSession, userNo);
	}

	// 고수찾기 상세 - 포트폴리오 정보 불러오기
	@Override
	public ArrayList<PofolOpt> showGosuPofol(int gosuNo){
		return gosuDao.showGosuPofol(sqlSession, gosuNo);
	}
	
	// 고수찾기 상세 - 리뷰 정보 불러오기
	@Override
	public ArrayList<GosuOpt> getGosuReview(int gosuNo) {
		return gosuDao.getGosuReview(sqlSession, gosuNo);
	}
	@Override
	public ArrayList<GosuOpt> getGosuReviewImg(int gosuNo) {
		return gosuDao.getGosuReviewImg(sqlSession, gosuNo);
	}

	//고수 활성화
	@Override
	public int gosuActivate(String userId) {
		// TODO Auto-generated method stub
		return gosuDao.gosuActivate(sqlSession,userId);
	}

	

	
}
