package com.kh.meetgo.admin.adminChat.model.dao;

import com.kh.meetgo.admin.adminChat.model.dto.AdminChatRequest;
import com.kh.meetgo.common.model.vo.PageInfo;
import lombok.Data;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class AdminChatDao {
    public int countAllChatRoom(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.countAllChatRoom");
    }

    public ArrayList<AdminChatRequest> selectAllChatRoom(SqlSessionTemplate sqlSession, PageInfo pi) {
        int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return (ArrayList) sqlSession.selectList("adminMapper.selectAllChatRoom",null, rowBounds);
    }
}
