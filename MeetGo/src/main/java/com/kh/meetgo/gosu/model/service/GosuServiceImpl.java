package com.kh.meetgo.gosu.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dao.GosuDao;
import com.kh.meetgo.gosu.model.dto.GosuOpt;
import com.kh.meetgo.member.model.vo.Gosu;

@Service
public class GosuServiceImpl implements GosuService {
	
	@Autowired
	private GosuDao gosuDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 고수 전체 조회용 메소드
	@Override
	public int selectAllGosuCount() {
		return gosuDao.selectAllGosuCount(sqlSession);
	}
	@Override
	public ArrayList<GosuOpt> selectAllGosu(PageInfo pi) {
		return gosuDao.selectAllGosu(sqlSession, pi);
	}
	
	@Override
	public int selectAllRegionOptionResultCount(String region, int categoryBigNo, int categorySmallNo) {
		return gosuDao.selectAllRegionOptionResultCount(sqlSession, region, categoryBigNo, categorySmallNo);
	}

	@Override
	public int selectRegionOptionResultCount(String region, int categoryBigNo, int categorySmallNo) {
		return gosuDao.selectRegionOptionResultCount(sqlSession, region, categoryBigNo, categorySmallNo);
	}

	@Override
	public int selectAllRegionGosuCount(String region, int categoryBigNo, int categorySmallNo) {
		return gosuDao.selectAllRegionGosuCount(sqlSession, region, categoryBigNo, categorySmallNo);
	}

	@Override
	public int selectRegionGosuCount(String region, int categoryBigNo, int categorySmallNo) {
		return gosuDao.selectRegionGosuCount(sqlSession, region, categoryBigNo, categorySmallNo);
	}
	
	// 고수찾기 검색용 메소드(지역 전체)
	@Override
	public ArrayList<GosuOpt> selectAllRegionOptionResult(String region, int categoryBigNo, int categorySmallNo, PageInfo pi) {		
		return gosuDao.selectAllRegionOptionResult(sqlSession, region, categoryBigNo, categorySmallNo, pi);
	}

	// 고수찾기 검색용 메소드
	@Override
	public ArrayList<GosuOpt> selectRegionOptionResult(String region, int categoryBigNo, int categorySmallNo, PageInfo pi) {
		return gosuDao.selectRegionOptionResult(sqlSession, region, categoryBigNo, categorySmallNo, pi);
	}
	
	@Override
	public ArrayList<GosuOpt> selectAllRegionGosu(String region, int categoryBigNo, int categorySmallNo, PageInfo pi) {
		return gosuDao.selectAllRegionGosu(sqlSession, region, categoryBigNo, categorySmallNo, pi);
	}

	@Override
	public ArrayList<GosuOpt> selectRegionGosu(String region, int categoryBigNo, int categorySmallNo, PageInfo pi) {
		return gosuDao.selectRegionGosu(sqlSession, region, categoryBigNo, categorySmallNo, pi);
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
