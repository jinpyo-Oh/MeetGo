package com.kh.meetgo.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.board.model.vo.Reply;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.PofolOpt;
import com.kh.meetgo.gosu.model.vo.Pofol;

@Repository
public class BoardDao {
	
	// 고수찾아요 게시글 총 갯수
	
	public int selectGosuReqListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectGosuReqListCount");
	}
	
	// 고수찾아요 리스트 조회 
	public ArrayList<Board> selectGosuReqList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectGosuReqList", null, rowBounds);
	}
	
	// 고수찾아요 게시판 작성
	public int insertGosuReqBoard(SqlSessionTemplate sqlSession, Board m) {
		
		return sqlSession.insert("boardMapper.insertGosuReqBoard", m);
	}
	
	// 카운트 
	public int selectGosuReqListCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("boardMapper.selectGosuReqListCount", boardNo);
	}
	
	// 고수찾아요 게시판 상세
	public Board selectGosuReqBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("boardMapper.selectGosuReqBoard", boardNo);
	}
	
	public int increaseGosuReqCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("boardMapper.increaseGosuReqCount", boardNo);
	}	

		
	// 팁노하우 게시글 총 갯수	
	public int selectTipListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectTipListCount");
	}
	
	// 팁노하우 리스트 조회 
	public ArrayList<Board> selectTipList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectTipList", null, rowBounds);
	}
	
	// 팁노하우 게시판 작성
	public int insertTipBoard(SqlSessionTemplate sqlSession, Board m) {
		
		return sqlSession.insert("boardMapper.insertTipBoard", m);
	}
	
	// 카운트 
	public int selectTipListCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("boardMapper.selectTipListCount", boardNo);
	}
	
	// 고수찾아요 게시판 상세
	public Board selectTipBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("boardMapper.selectTipBoard", boardNo);
	}
		
	public int increaseTipCount(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.update("boardMapper.increaseTipCount", boardNo);
	}	

	
	
	
	// 포폴리스트 전체카운트
	public int countPofolList(SqlSessionTemplate sqlSession) {	
		return sqlSession.selectOne("boardMapper.countPofolList");
	}
	// 포폴리스트 전체조회
	public ArrayList<PofolOpt> selectPofolList(SqlSessionTemplate sqlSession, PageInfo pi, String standard, int categoryBigNo) {
		
		Map<String, Object> params = new HashMap<>();
		
		params.put("standard", standard);
		params.put("categoryBigNo", categoryBigNo);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectPofolList", params, rowBounds);
	}
	
	// 로그인 고수의 카테고리 이름 가져오기
	public ArrayList<String> getLoginUserCtgName(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.getLoginUserCtgName", userNo);
	}
	
	// 포트폴리오 등록
	public int insertPofol(SqlSessionTemplate sqlSession, Pofol pofol){
		return sqlSession.insert("boardMapper.insertPofol", pofol);
	}
	
	public int insertPofolImg(SqlSessionTemplate sqlSession, String pofolImgUrl, int pofolNo) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("pofolImgUrl", pofolImgUrl);
		params.put("pofolNo", pofolNo);
		
		return sqlSession.insert("boardMapper.insertPofolImg", params);
	}

}