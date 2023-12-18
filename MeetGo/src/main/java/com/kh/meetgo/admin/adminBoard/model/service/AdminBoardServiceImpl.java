package com.kh.meetgo.admin.adminBoard.model.service;

import com.kh.meetgo.admin.adminBoard.model.dao.AdminBoardDao;
import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.common.model.vo.PageInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{
    @Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private AdminBoardDao adminBoardDao;
    @Override
    public int countAllBoard(String status) {
        return adminBoardDao.countAllBoard(sqlSession, status);
    }

    @Override
    public ArrayList<Board> selectAllBoard(PageInfo pi, String status) {
        return adminBoardDao.selectAllBoard(sqlSession,pi, status);
    }
}
