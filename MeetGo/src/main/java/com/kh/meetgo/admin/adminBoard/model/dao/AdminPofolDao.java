package com.kh.meetgo.admin.adminBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.PofolOpt;

@Repository
public class AdminPofolDao {

	public int selectAdminPofolListCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("adminMapper.selectAdminPofolListCount", keyword);
	}
	
	public ArrayList<PofolOpt> selectAdminPofolList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectAdminPofolList", keyword, rowBounds);
	}
	
	public ArrayList<PofolOpt> adminPofolDetail(SqlSessionTemplate sqlSession, int pofolNo){
		return (ArrayList)sqlSession.selectList("adminMapper.adminPofolDetail", pofolNo);
	}
	
	public int changePofolStatus(SqlSessionTemplate sqlSession, int pofolNo, int pofolStatus) {
		Map<String, Object> params = new HashMap<>();
		params.put("pofolNo", pofolNo);
		params.put("pofolStatus", pofolStatus);
		return sqlSession.update("adminMapper.changePofolStatus", params);
	}
	
}
