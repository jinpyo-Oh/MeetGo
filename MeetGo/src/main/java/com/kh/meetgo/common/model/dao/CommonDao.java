package com.kh.meetgo.common.model.dao;

import com.kh.meetgo.common.model.dto.PoFolRequest;
import com.kh.meetgo.common.model.vo.Report;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Repository
@RequiredArgsConstructor
public class CommonDao {
    public ArrayList<PoFolRequest> selectMainPortfolio(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("commonMapper.selectMainPortfolio");
    }

    public Member selectGosuInfo(SqlSessionTemplate sqlSession, int gosuNo) {
        return sqlSession.selectOne("commonMapper.selectGosuInfo", gosuNo);
    }

    public int insertReport(SqlSessionTemplate sqlSession, Report report) {
        return sqlSession.insert("commonMapper.insertReport", report);
    }
}
