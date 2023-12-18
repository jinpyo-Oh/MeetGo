package com.kh.meetgo.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.board.model.dto.BoardFileDto;
import com.kh.meetgo.board.model.dto.ReplyDto;
import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.board.model.vo.Board_File;
import com.kh.meetgo.board.model.vo.Reply;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.PofolOpt;
import com.kh.meetgo.gosu.model.vo.Pofol;
import com.kh.meetgo.gosu.model.vo.PofolImg;

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
	public int insertGosuReqBoard(SqlSessionTemplate sqlSession, Board gosuReq) {
		
		return sqlSession.insert("boardMapper.insertGosuReqBoard", gosuReq);
	}
	
	// 고수찾아요 이미지 등록
	public int insertGosuReqImg(SqlSessionTemplate sqlSession, String filePath, int boardNo) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("filePath", filePath);
		params.put("boardNo", boardNo);
		
		return sqlSession.insert("boardMapper.insertGosuReqImg", params);
	}
	
	public ArrayList<Board_File>selectGosuReqImgList(SqlSessionTemplate sqlSession, int boardNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectGosuReqImgList", boardNo);
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
	public ArrayList<BoardFileDto> selectTipList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectTipList", null, rowBounds);
	}
	
	// 팁노하우 게시판 작성
	public int insertTipBoard(SqlSessionTemplate sqlSession, BoardFileDto tipDto) {
		
		return sqlSession.insert("boardMapper.insertTipBoard",tipDto);
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

	// 팁노하우 이미지 등록
		public int insertTipImg(SqlSessionTemplate sqlSession, String BfilePath, int boardNo) {
			
			Map<String, Object> params = new HashMap<>();
			params.put("BfilePath", BfilePath);
			params.put("boardNo", boardNo);
			
			return sqlSession.insert("boardMapper.insertTipImg", params);
		}
		
		public ArrayList<BoardFileDto>selectTipImgList(SqlSessionTemplate sqlSession, int boardNo){
			return (ArrayList)sqlSession.selectList("boardMapper.selectTipImgList", boardNo);
		}
	
	public ArrayList<ReplyDto> selectGosuReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectGosuReplyList", boardNo);
	}
	
	public int insertGosuReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("boardMapper.insertGosuReply", r);
	}	
	
	public int selectNoticeListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectNoticeListCount");
	}
	
	// 고수찾아요 리스트 조회 
	public ArrayList<Board> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoticeList", null, rowBounds);
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
	
	// 포폴 상세조회
	public int increasePofolCount(SqlSessionTemplate sqlSession, int pofolNo) {
		return sqlSession.update("boardMapper.increasePofolCount", pofolNo);
	}
	public ArrayList<PofolOpt> pofolDetail(SqlSessionTemplate sqlSession, int pofolNo){
		return (ArrayList)sqlSession.selectList("boardMapper.pofolDetail", pofolNo);
	}
	public ArrayList<PofolImg> pofolDetailImg(SqlSessionTemplate sqlSession, int pofolNo){
		return (ArrayList)sqlSession.selectList("boardMapper.pofolDetailImg", pofolNo);
	}

}