package com.kh.meetgo.admin.adminEstimate.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	
	public int adminEstimateSearchCount(SqlSessionTemplate sqlSession, String keyword, String condition) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		params.put("condition", condition);
		
		return sqlSession.selectOne("adminMapper.adminEstimateSearchCount", params);
	}
	
	public ArrayList<EstimateDto> adminEstimateSearch(SqlSessionTemplate sqlSession
										, PageInfo pi, String keyword, String condition) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		params.put("condition", condition);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminEstimateSearch", params, rowBounds);
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
	
	public int adminReviewSearchCount(SqlSessionTemplate sqlSession, String keyword, String condition) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		params.put("condition", condition);
		
		return sqlSession.selectOne("adminMapper.adminReviewSearchCount", params);
	}

	public ArrayList<ReviewDto> adminReviewSearch(SqlSessionTemplate sqlSession, PageInfo pi
												  , String keyword,String condition) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		params.put("condition", condition);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminReviewSearch", params, rowBounds);
	}
}
