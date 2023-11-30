package com.kh.meetgo.gosu.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.gosu.model.dao.GosuDao;
import com.kh.meetgo.gosu.model.dto.GosuOpt;

@Service
public class GosuServiceImpl implements GosuService {
	
	@Autowired
	private GosuDao gosuDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 고수찾기 검색용 메소드(지역과 카테고리)
	@Override
	public ArrayList<GosuOpt> selectOptionResult(String region, int categoryBigNo, int categorySmallNo){
			
		return gosuDao.selectOptionResult(sqlSession, region, categoryBigNo, categorySmallNo);
	}

	
}
