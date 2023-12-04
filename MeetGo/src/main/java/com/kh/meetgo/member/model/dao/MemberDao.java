package com.kh.meetgo.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.vo.Estimate;
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

    /*
	 * public int pwdCheck(SqlSessionTemplate sqlSession, String checkPwd) { return
	 * sqlSession.selectOne("memberMapper.pwdCheck", checkPwd); }
	 */
    
    public int selectIncompleteListCount(SqlSessionTemplate sqlSession, int userNo) {
    	return sqlSession.selectOne("memberMapper.selectIncompleteListCount", userNo);
    }
    
    public int selectCompleteListCount(SqlSessionTemplate sqlSession, int userNo) {
    	return sqlSession.selectOne("memberMapper.selectCompleteListCount", userNo);
    }
    
    public ArrayList<Estimate> selectIncompleteEstimateList(SqlSessionTemplate sqlSession, PageInfo pi1, int userNo){
    	int limit = pi1.getBoardLimit();
    	int offset = (pi1.getCurrentPage() - 1) * limit;
    	
    	RowBounds rowBounds = new RowBounds(offset, limit);
    	
    	return (ArrayList)sqlSession.selectList("memberMapper.selectIncompleteEstimateList", userNo, rowBounds);
    }
    
    public ArrayList<Estimate> selectCompleteEstimateList(SqlSessionTemplate sqlSession, PageInfo pi2, int userNo){
    	int limit = pi2.getBoardLimit();
    	int offset = (pi2.getCurrentPage() - 1) * limit;
    	
    	RowBounds rowBounds = new RowBounds(offset, limit);
    	
    	return (ArrayList)sqlSession.selectList("memberMapper.selectCompleteEstimateList", userNo, rowBounds);
    }
    
    public Estimate selectEstimateDetail(SqlSessionTemplate sqlSession, int eno) {
    	return sqlSession.selectOne("memberMapper.selectEstimateDetail", eno);
    }
    
}
