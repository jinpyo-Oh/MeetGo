package com.kh.meetgo.admin.adminReport.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.admin.adminReport.model.dao.AdminReportDao;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.model.vo.Report;

@Service
public class AdminReportServiceImpl implements AdminReportService {

	@Autowired
	private AdminReportDao adminReportDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectReportListCount(int reportStatus) {
		return adminReportDao.selectReportListCount(sqlSession, reportStatus);
	}

	@Override
	public ArrayList<Report> selectReportList(int reportStatus, PageInfo pi) {
		return adminReportDao.selectReportList(sqlSession, reportStatus, pi);
	}
	
	@Override
	public ArrayList<Report> reportDetail(int reportNo){
		return adminReportDao.reportDetail(sqlSession, reportNo);
	}
	@Override
	public int changeReportStatus(int reportStatus, int reportNo) {
		return adminReportDao.changeReportStatus(sqlSession, reportStatus, reportNo);
	}

}
