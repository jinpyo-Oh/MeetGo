package com.kh.meetgo.admin.adminEstimate.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.admin.adminEstimate.model.dao.AdminEstimateDao;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.vo.Estimate;

@Service
public class AdminEstimateServiceImpl implements AdminEstimateService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminEstimateDao adminDao;
	
	@Override
	public int adminEstimateInComplListCount() {
		return adminDao.adminEstimateInComplListCount(sqlSession);
	}
	
	@Override
	public int adminEstimateComplListCount() {
		return adminDao.adminEstimateComplListCount(sqlSession);
	}

	@Override
	public ArrayList<EstimateDto> adminEstimateComplList(PageInfo pi) {
		return adminDao.adminEstimateComplList(sqlSession, pi);
	}

	@Override
	public ArrayList<Estimate> adminEstimateInComplList(PageInfo pi) {
		return adminDao.adminEstimateInComplList(sqlSession, pi);
	}

	@Override
	public EstimateDto adminEstimateDetail(int eno) {
		return adminDao.adminEstimateDetail(sqlSession, eno);
	}
	

	
	
}
