package com.kh.meetgo.admin.adminReport.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.model.vo.Report;

public interface AdminReportService {

	// 신고 리스트 개수, 내용조회
	int selectReportListCount(int reportStatus);
	ArrayList<Report> selectReportList(int reportStatus, PageInfo pi);
	
	// 신고 상세조회
	ArrayList<Report> reportDetail(int reportNo);
}
