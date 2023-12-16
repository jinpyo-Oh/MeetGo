package com.kh.meetgo.admin.adminReport.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.model.vo.Report;

public interface AdminReportService {

	int selectReportListCount(int reportStatus);
	ArrayList<Report> selectReportList(int reportStatus, PageInfo pi);
	
}
