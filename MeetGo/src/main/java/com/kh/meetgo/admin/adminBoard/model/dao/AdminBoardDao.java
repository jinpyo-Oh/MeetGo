package com.kh.meetgo.admin.adminBoard.model.dao;

import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.common.model.vo.PageInfo;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class AdminBoardDao {
    public int countAllBoard(SqlSessionTemplate sqlSession, String status) {
        int type = Integer.parseInt(status);
        return sqlSession.selectOne("adminMapper.countAllBoard", type);
    }

    public ArrayList<Board> selectAllBoard(SqlSessionTemplate sqlSession, PageInfo pi, String status) {
        int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        int type = Integer.parseInt(status);
        return (ArrayList)sqlSession.selectList("adminMapper.selectAllBoard", type, rowBounds);
    }
}
