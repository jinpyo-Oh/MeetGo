package com.kh.meetgo.admin.adminEstimate.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminEstimateDao {

	public int adminEstimateComplListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.adminEstimateComplListCount");
	}

	public int adminEstimateInComplListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.adminEstimateInComplListCount");
	}

}
