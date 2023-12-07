package com.kh.meetgo.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.kh.meetgo.board.model.dao.BoardDao;
import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.board.model.vo.Reply;
import com.kh.meetgo.common.model.vo.PageInfo;

// @Component
@Service
@EnableTransactionManagement // 트랜잭션 관리를 하겠다.
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return boardDao.selectList(sqlSession, pi);
	}

	@Override
	@Transactional 

	public int insertBoard(Board m) {
		return boardDao.insertBoard(sqlSession, m);
	}

	@Override
	@Transactional
	public int increaseCount(int boardNo) {
		return boardDao.increaseCount(sqlSession, boardNo);
	}

	@Override
	public Board selectBoard(int boardNo) {
		return boardDao.selectBoard(sqlSession, boardNo);
	}

	@Override
	@Transactional
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(sqlSession, boardNo);
	}

	@Override
	@Transactional
	public int updateBoard(Board m) {
		return boardDao.updateBoard(sqlSession, m);
	}


	@Override
	public int insertTipboard(Board m) {
		return boardDao.insertTipboard(sqlSession, m);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(Reply r) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}







