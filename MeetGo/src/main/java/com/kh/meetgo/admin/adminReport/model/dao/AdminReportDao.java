package com.kh.meetgo.admin.adminReport.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.model.vo.Report;
@Repository
public class AdminReportDao {

	public int selectReportListCount(SqlSessionTemplate sqlSession, int reportStatus) {
		return sqlSession.selectOne("adminMapper.selectReportListCount", reportStatus);
	}
	
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, int reportStatus, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectReportListCount", reportStatus, rowBounds);
	}
	
}
