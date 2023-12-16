package com.kh.meetgo.admin.adminEstimate.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.dto.ReviewDto;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.gosu.model.vo.ReviewImg;

@Repository
public class AdminEstimateDao {

	public int adminEstimateInComplListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.adminEstimateInComplListCount");
	}

	public int adminEstimateComplListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.adminEstimateComplListCount");
	}

	public ArrayList<EstimateDto> adminEstimateComplList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		System.out.println(limit);
		System.out.println(offset);
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminEstimateComplList", null ,rowBounds);
	}

	public ArrayList<Estimate> adminEstimateInComplList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("adminMapper.adminEstimateInComplList", null ,rowBounds);
	}

	public EstimateDto adminEstimateDetail(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.selectOne("adminMapper.adminEstimateDetail", eno);
	}

	public int selectReviewListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectReviewListCount");
	}

	public ArrayList<ReviewDto> selectReviewListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectReviewList", null, rowBounds);
	}

	public ReviewDto adminReviewDetail(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.selectOne("adminMapper.adminReviewDetail", rno);
	}

	public ArrayList<ReviewImg> adminReviewImg(SqlSessionTemplate sqlSession, int rno) {
		return (ArrayList)sqlSession.selectList("adminMapper.adminReviewImg", rno);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
