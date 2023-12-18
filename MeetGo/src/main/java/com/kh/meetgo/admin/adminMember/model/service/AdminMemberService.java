package com.kh.meetgo.admin.adminMember.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.admin.adminMember.model.dao.AdminMemberDao;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.member.model.vo.Gosu;
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

    public Member selectOneMember(int userNo) { return adminMemberDao.selectOneMember(sqlSession, userNo);
    }

    public int changeEnrollStatus(Member m) { return adminMemberDao.changeEnrollStatus(sqlSession, m);
    }

    public int countAllGosu() {return adminMemberDao.countAllGosu(sqlSession);
    }

    public ArrayList<Gosu> selectAllGosu(PageInfo pi) { return adminMemberDao.selectAllGosu(sqlSession, pi);
    }
}
