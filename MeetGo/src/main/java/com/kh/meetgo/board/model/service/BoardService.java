package com.kh.meetgo.board.model.service;

import java.util.ArrayList;

import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.board.model.vo.Reply;
import com.kh.meetgo.common.model.vo.PageInfo;

public interface BoardService {
	
	// 게시글 목록 조회 서비스 + 페이징처리
		// 게시글의 총 갯수 조회
		int selectListCount();
		
		// 게시글 리스트 조회
		ArrayList<Board> selectList(PageInfo pi);
		
		// 게시글 작성하기 서비스
		int insertBoard(Board m);
		
		// 게시글 상세조회 서비스
		// 게시글 조회수 증가
		int increaseCount(int boardNo);
		
		// 게시글 상세조회
		Board selectBoard(int boardNo);
		
		// 게시글 삭제 서비스
		int deleteBoard(int boardNo);
		
		// 게시글 수정 서비스
		int updateBoard(Board m);

		int insertTipboard(Board m);
		
		// 댓글 리스트 조회 서비스 (ajax)
		ArrayList<Reply> selectReplyList(int boardNo);
		
		// 댓글 작성 서비스 (ajax)
		int insertReply(Reply r);
	
	
}
