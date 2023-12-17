package com.kh.meetgo.admin.adminCommon.model.dao;

import com.kh.meetgo.admin.adminCommon.model.dto.ChartMemberDto;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.vo.Estimate;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class AdminCommonDao {

	public ArrayList<ChartMemberDto> selectMember(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectMember");
	}


}
