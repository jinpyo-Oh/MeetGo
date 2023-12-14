package com.kh.meetgo.admin.adminEstimate.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.admin.adminEstimate.model.dao.AdminEstimateDao;

@Service
public class AdminEstimateServiceImpl implements AdminEstimateService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminEstimateDao adminDao;
	
	@Override
	public int adminEstimateComplListCount() {
		return adminDao.adminEstimateComplListCount(sqlSession);
	}

	@Override
	public int adminEstimateInComplListCount() {
		return adminDao.adminEstimateInComplListCount(sqlSession);
	}
	
	
}
