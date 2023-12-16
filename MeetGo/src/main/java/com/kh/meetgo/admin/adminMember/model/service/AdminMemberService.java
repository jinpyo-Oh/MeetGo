package com.kh.meetgo.admin.adminMember.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.admin.adminMember.model.dao.AdminMemberDao;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.member.model.vo.Member;

@Service
public class AdminMemberService {

	@Autowired
    private SqlSessionTemplate sqlSession;
    
	@Autowired
	private AdminMemberDao adminMemberDao;
    
	public ArrayList<Member> selectAllMember(PageInfo pi) {
        return adminMemberDao.selectAllMember(sqlSession,pi);
    }

    public int countAllMember() { return adminMemberDao.countAllMember(sqlSession);
    }
}
