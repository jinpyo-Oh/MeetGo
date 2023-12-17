package com.kh.meetgo.admin.adminChat.model.dao;

import lombok.Data;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminChatDao {
    public int countAllChatRoom(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.countAllChatRoom");
    }
}
