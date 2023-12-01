package com.kh.meetgo.gosu.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.GosuOpt;
import com.kh.meetgo.member.model.vo.Gosu;

@Repository
public class GosuDao {
	
	// 고수 전체 회원 수 조회용 메소드
	public int selectGosuCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("gosuMapper.selectGosuCount");
	}

	// 고수찾기 검색용 메소드 영역
	
	// 지역 전체 선택 | 서비스 선택
	public int selectAllRegionOptionResultCount(SqlSessionTemplate sqlSession
			  , String region, int categoryBigNo, int categorySmallNo) {
		
		Map<String, Object> params = new HashMap<>();
	    params.put("region", region);
	    params.put("categorySmallNo", categorySmallNo);
	    
		return sqlSession.selectOne("gosuMapper.selectAllRegionOptionResultCount", params);
	}
	
	public ArrayList<GosuOpt> selectAllRegionOptionResult(SqlSessionTemplate sqlSession, String region
														, int categoryBigNo, int categorySmallNo, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
	    Map<String, Object> params = new HashMap<>();
	    params.put("region", region);
	    params.put("categorySmallNo", categorySmallNo);
	    
	    return (ArrayList)sqlSession.selectList("gosuMapper.selectAllRegionOptionResult", params, rowBounds);

	    
	}
	
	// 지역 선택 | 서비스 선택
	public int selectRegionOptionResultCount(SqlSessionTemplate sqlSession
			  , String region, int categoryBigNo, int categorySmallNo) {
		
	    Map<String, Object> params = new HashMap<>();
	    params.put("region", region);
	    params.put("categorySmallNo", categorySmallNo);
	    
		return sqlSession.selectOne("gosuMapper.selectRegionOptionResultCount", params);
	}
	
	public ArrayList<GosuOpt> selectRegionOptionResult(SqlSessionTemplate sqlSession, String region
													 , int categoryBigNo, int categorySmallNo, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
	    Map<String, Object> params = new HashMap<>();
	    params.put("region", region);
	    params.put("categorySmallNo", categorySmallNo);
	    
	    return (ArrayList)sqlSession.selectList("gosuMapper.selectRegionOptionResult", params, rowBounds);

	}
	
	// 지역 선택 | 서비스 전체 선택
	public int selectRegionGosuCount(SqlSessionTemplate sqlSession
			  , String region, int categoryBigNo, int categorySmallNo) {
		return sqlSession.selectOne("gosuMapper.selectRegionGosuCount", region);
	}

	public ArrayList<GosuOpt> selectRegionGosu(SqlSessionTemplate sqlSession, String region
			 , int categoryBigNo, int categorySmallNo, PageInfo pi){

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("gosuMapper.selectRegionGosu", region, rowBounds);
		
	}
	
	// 지역 전체 선택 | 서비스 전체 선택
	public int selectAllRegionGosuCount(SqlSessionTemplate sqlSession
			  , String region, int categoryBigNo, int categorySmallNo) {
		return sqlSession.selectOne("gosuMapper.selectAllRegionGosuCount", region);
	}
	
	public ArrayList<GosuOpt> selectAllRegionGosu(SqlSessionTemplate sqlSession, String region
			 , int categoryBigNo, int categorySmallNo, PageInfo pi){

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("gosuMapper.selectAllRegionGosu", region, rowBounds);
		
	}
	
	// 고수 등록용 메소드
	public int insertGosu(SqlSessionTemplate sqlSession, Gosu gosu) {
		
		return sqlSession.insert("gosuMapper.insertGosu", gosu);
	}
	
	// 고수 서비스 등록용 메소드
	public int insertGosuCate(SqlSessionTemplate sqlSession, int service, int gosuNo) {
		
		Map<String, Object> params = new HashMap<>();
	    params.put("service", service);
	    params.put("gosuNo", gosuNo);
		    
		return sqlSession.insert("gosuMapper.insertGosuCate", params);
	}
	
	// 고수로 상태변경용 메소드
	public int changeStatus(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.update("gosuMapper.changeStatus", userNo);
	}
}
