package com.kh.meetgo.gosu.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.gosu.model.dto.GosuOpt;
import com.kh.meetgo.member.model.vo.Gosu;

@Repository
public class GosuDao {
	
	// 고수찾기 검색용 메소드(지역과 카테고리)
	public ArrayList<GosuOpt> selectOptionResult(SqlSessionTemplate sqlSession, String region, int categoryBigNo, int categorySmallNo){

		return (ArrayList)sqlSession.selectList("gosuMapper.selectOptionResult", region);
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
