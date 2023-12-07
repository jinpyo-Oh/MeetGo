package com.kh.meetgo.common.model.service;

import com.kh.meetgo.common.model.dao.CommonDao;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommonService {
    private final CommonDao commonDao;
    private final SqlSessionTemplate sqlSession;

}
