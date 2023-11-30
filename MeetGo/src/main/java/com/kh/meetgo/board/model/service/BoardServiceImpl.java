package com.kh.meetgo.board.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.kh.meetgo.board.model.dao.BoardDao;

@Service
@EnableTransactionManagement // 트랜잭션 관리를 하겠다.

public class BoardServiceImpl implements BoardService{
	
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
}
