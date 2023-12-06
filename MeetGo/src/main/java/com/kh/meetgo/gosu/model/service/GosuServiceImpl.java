package com.kh.meetgo.gosu.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dao.GosuDao;
import com.kh.meetgo.gosu.model.dto.GosuOpt;
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
	public ArrayList<GosuOpt> selectOptionalGosu(String region, String regionSub, int categoryBigNo, int categorySmallNo, PageInfo pi) {
		return gosuDao.selectOptionalGosu(sqlSession, region, regionSub, categoryBigNo, categorySmallNo, pi);
	}
	
	// 고수찾기 상세정보 조회
	@Override
	public ArrayList<GosuOpt> gosuDetail(int gosuNo) {
		return gosuDao.gosuDetail(sqlSession, gosuNo);
	}
	
	// 고수찾기 이미지 불러오기
	public ArrayList<GosuImg> getGosuImg(int gosuNo){
		return gosuDao.getGosuImg(sqlSession, gosuNo);
	}

	// 고수 등록용 메소드
	@Override
	public int insertGosu(Gosu gosu) {
		
		return gosuDao.insertGosu(sqlSession, gosu);
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





	
}
