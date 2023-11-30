package com.kh.meetgo.gosu.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.gosu.model.dto.GosuOpt;

@Repository
public class GosuDao {
	
	// 고수찾기 검색용 메소드(지역과 카테고리)
	public ArrayList<GosuOpt> selectOptionResult(SqlSessionTemplate sqlSession, String region, int categoryBigNo, int categorySmallNo){

		return (ArrayList)sqlSession.selectList("gosuMapper.selectOptionResult", region);
	}
	
}
