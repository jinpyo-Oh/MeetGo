package com.kh.meetgo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.member.model.vo.Member;

@Repository // 저장소 (DAO 는 데이터 입출력이 일어나는 부분)
// Repository 타입의 어노테이션을 붙이면
// 빈 스캐닝을 통해 DAO 형식의 bean 으로 등록됨
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

    public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
    }

    public int updateMember(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.update("memberMapper.updateMember", m);
    }

    public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
        return sqlSession.update("memberMapper.deleteMember", userId);
    }

    public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
        return sqlSession.selectOne("memberMapper.idCheck", checkId);
    }
    public int updateEmailPassword(SqlSessionTemplate sqlSession, String email) {
    	return sqlSession.selectOne("memberMapper.updateEmailPassword",email);
    }

    public int changeStatus(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.update("memberMapper.changeStatus", m);
    }

	public int pwdCheck(SqlSessionTemplate sqlSession, String checkPwd) {
		return sqlSession.selectOne("memberMapper.pwdCheck", checkPwd);
	}

	public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.emailCheck",checkEmail);
	}



    /*
	 * public int pwdCheck(SqlSessionTemplate sqlSession, String checkPwd) { return
	 * sqlSession.selectOne("memberMapper.pwdCheck", checkPwd); }
	 */
}
