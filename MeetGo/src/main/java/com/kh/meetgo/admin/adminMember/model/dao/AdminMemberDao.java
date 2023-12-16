package com.kh.meetgo.admin.adminMember.model.dao;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.member.model.vo.Member;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class AdminMemberDao {
    public ArrayList<Member> selectAllMember(SqlSessionTemplate sqlSession, PageInfo pi) {
        int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;

        RowBounds rowBounds = new RowBounds(offset, limit);
        return (ArrayList)sqlSession.selectList("memberMapper.selectAllMember", null, rowBounds);
    }

    public int countAllMember(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("memberMapper.countAllMember");
    }
}
