package com.kh.meetgo.admin.adminChat.model.service;

import com.kh.meetgo.admin.adminChat.model.dao.AdminChatDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminChatService {
    @Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private AdminChatDao adminChatDao;

    public int countAllChatRoom() {
        return adminChatDao.countAllChatRoom(sqlSession);
    }
}
