package com.kh.meetgo.board.model.service;

import java.util.ArrayList;

import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.board.model.vo.Board_File;
import com.kh.meetgo.board.model.vo.Reply;
import com.kh.meetgo.board.model.dto.ReplyDto;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.PofolOpt;
import com.kh.meetgo.gosu.model.vo.Pofol;
import com.kh.meetgo.gosu.model.vo.PofolImg;

public interface BoardService {
	
		// 고수찾아요 게시글 목록 조회 서비스 + 페이징처리
		// 고수찾아요 게시글의 총 갯수 조회
		int selectGosuReqListCount();
		
		// 고수찾아요 게시판 리스트 조회
		ArrayList<Board> selectGosuReqList(PageInfo pi);
		
		// 고수찾아요 작성하기 서비스
		int insertGosuReqBoard(Board gosuReq);
		
		// 고수찾아요 상세조회 서비스
		// 고수찾아요 조회수 증가
		int increaseGosuReqCount(int boardNo);
		
		// 고수찾아요 게시글 상세조회
		Board selectGosuReqBoard(int boardNo);
		
		// 고수이미지 
		int insertGosuReqImg(String filePath, int boardNo);

		ArrayList<Board_File> selectGosuReqImgList(int boardNo);
		
		
		
		
		// 팁노하우 게시판 리스트 조회		
		ArrayList<Board> selectTipList(PageInfo pi);
		
		// 팁게시판 총 갯수 목록 조회 서비
		int selectTipListCount();

		// 팁노하우 작성하기 서비스
		int insertTipBoard(Board m);
		
		// 팁노하우 게시글 상세조회
		Board selectTipBoard(int boardNo);
		
		// 팁노하우 상세조회 서비스
		// 팁노하우 조회수 증가
		int increaseTipCount(int boardNo);
		
		// 댓글 리스트 조회 서비스 (ajax)
		ArrayList<ReplyDto> selectGosuReplyList(int boardNo);
		
		// 댓글 작성 서비스 (ajax)
		int insertGosuReply(Reply r);
		
		
		int insertTipImg(String filePath, int boardNo);

		ArrayList<Board_File> selectTipImgList(int boardNo);
		
	


		
		// 댓글 리스트 조회 서비스 (ajax)
		ArrayList<Reply> selectReplyList(int boardNo);
		
		// 댓글 작성 서비스 (ajax)
		int insertReply(Reply r);
	
		// 포트폴리오 전체 개수
		int countPofolList();
		
		// 포트폴리오 전체조회
		ArrayList<PofolOpt> selectPofolList(PageInfo pi, String standard, int categoryBigNo);
		
		// 로그인한 고수의 등록된 카테고리 이름
		ArrayList<String> getLoginUserCtgName(int userNo);
	
		// 포폴 정보 등록
		int insertPofol(Pofol pofol);
		
		// 포폴 이미지 등록
		int insertPofolImg(String pofolImgUrl, int pofolNo);
		
		// 포폴 상세조회
		int increasePofolCount(int pofolNo);
		ArrayList<PofolOpt> pofolDetail(int pofolNo);
		ArrayList<PofolImg> pofolDetailImg(int pofolNo);

		// 포폴 수정하기
		int updatePofol(int pofolNo, String pofolTitle, String pofolPrice, String pofolIntro, String pofolContent);
		int updatePofolImg(int pofolImgNo, String pofolImgUrl);
		
}
