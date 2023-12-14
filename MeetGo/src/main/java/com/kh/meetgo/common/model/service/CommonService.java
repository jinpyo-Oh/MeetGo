package com.kh.meetgo.common.model.service;

import com.kh.meetgo.common.model.dao.CommonDao;
import com.kh.meetgo.common.model.dto.PoFolRequest;
import com.kh.meetgo.common.model.vo.Report;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class CommonService {
    private final CommonDao commonDao;
    private final SqlSessionTemplate sqlSession;

    public ArrayList<PoFolRequest> selectMainPortfolio() { return commonDao.selectMainPortfolio(sqlSession);
    }

    public Member selectGosuInfo(int gosuNo) {
        return commonDao.selectGosuInfo(sqlSession, gosuNo);
    }

    public int insertReport(Report report) {
        return commonDao.insertReport(sqlSession, report);
    }
}
