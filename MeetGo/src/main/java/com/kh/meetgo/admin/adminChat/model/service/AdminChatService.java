package com.kh.meetgo.admin.adminChat.model.service;

import com.kh.meetgo.admin.adminChat.model.dao.AdminChatDao;
import com.kh.meetgo.admin.adminChat.model.dto.AdminChatRequest;
import com.kh.meetgo.common.model.vo.PageInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AdminChatService {
    @Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private AdminChatDao adminChatDao;

    public int countAllChatRoom() {
        return adminChatDao.countAllChatRoom(sqlSession);
    }

    public ArrayList<AdminChatRequest> selectAllChatRoom(PageInfo pi) {
        return adminChatDao.selectAllChatRoom(sqlSession, pi);
    }
}
