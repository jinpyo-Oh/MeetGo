package com.kh.meetgo.admin.adminMember.model.dao;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.member.model.vo.Gosu;
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
        return (ArrayList) sqlSession.selectList("memberMapper.selectAllMember", null, rowBounds);
    }

    public int countAllMember(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("memberMapper.countAllMember");
    }

    public Member selectOneMember(SqlSessionTemplate sqlSession, int userNo) {
        return sqlSession.selectOne("memberMapper.selectOneMember", userNo);
    }

    public int changeEnrollStatus(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.update("adminMapper.changeEnrollStatus", m);
    }

    public int countAllGosu(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.countAllGosu");
    }

    public ArrayList<Gosu> selectAllGosu(SqlSessionTemplate sqlSession, PageInfo pi) {
        int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return (ArrayList) sqlSession.selectList("adminMapper.selectAllGosu", null, rowBounds);
    }
}
