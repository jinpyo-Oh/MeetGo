package com.kh.meetgo.admin.adminBoard.model.dao;

import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.common.model.vo.PageInfo;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

    public int insertNotice(SqlSessionTemplate sqlSession, String url, Board board) {
        int result1 = sqlSession.insert("adminMapper.insertNotice", board);
        Map<String, Object> map = new HashMap<>();
        map.put("boardNo", board.getBoardNo());
        map.put("url", url);
        System.out.println("map = " + map);
        int result2 = sqlSession.insert("adminMapper.insertNoticeImg", map);
        return result1*result2;
    }

    public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
        return sqlSession.update("adminMapper.deleteBoard", boardNo);
    }
}
