package com.kh.meetgo.admin.adminBoard.model.service;

import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.common.model.vo.PageInfo;

import java.util.ArrayList;

public interface AdminBoardService {
    int countAllBoard(String status);

    ArrayList<Board> selectAllBoard(PageInfo pi, String status);
}
