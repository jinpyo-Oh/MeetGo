package com.kh.meetgo.admin.adminCommon.model.service;

import com.kh.meetgo.admin.adminCommon.model.dao.AdminCommonDao;
import com.kh.meetgo.admin.adminCommon.model.dto.ChartMemberDto;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.vo.Estimate;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AdminCommonServiceImpl implements AdminCommonService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminCommonDao adminDao;
	
	@Override
	public ArrayList<ChartMemberDto> selectMember() {
		return adminDao.selectMember(sqlSession);
	}

	@Override
	public ArrayList<ChartMemberDto> selectProfit() {
		return adminDao.selectProfit(sqlSession);
	}

}
