package com.kh.meetgo.common.model.dao;

import com.kh.meetgo.common.model.dto.PoFolRequest;
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
}
