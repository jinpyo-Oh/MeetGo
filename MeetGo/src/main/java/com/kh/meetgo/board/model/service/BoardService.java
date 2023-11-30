package com.kh.meetgo.board.model.service;

import java.util.ArrayList;

import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.common.model.vo.PageInfo;

public interface BoardService {
	
		int selectListCount();
		
		ArrayList<Board> selectList(PageInfo pi);
		
		int insertBoard(Board b);
		
		int increaseCount(int boardNo);
		
		Board selectBoard(int boardNo);
	
}
