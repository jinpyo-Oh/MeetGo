package com.kh.meetgo.admin.adminBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.admin.adminBoard.model.dao.AdminPofolDao;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.PofolOpt;

@Service
public class AdminPofolServiceImpl implements AdminPofolService{

	@Autowired
	private AdminPofolDao adminPofolDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectAdminPofolListCount(String keyword) {
		return adminPofolDao.selectAdminPofolListCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<PofolOpt> selectAdminPofolList(String keyword, PageInfo pi) {
		return adminPofolDao.selectAdminPofolList(sqlSession, keyword, pi);
	}
	
	@Override
	public ArrayList<PofolOpt> adminPofolDetail(int pofolNo){
		return adminPofolDao.adminPofolDetail(sqlSession, pofolNo);
	}
	@Override
	public int changePofolStatus(int pofolNo, int pofolStatus) {
		return adminPofolDao.changePofolStatus(sqlSession, pofolNo, pofolStatus);
	}

}
