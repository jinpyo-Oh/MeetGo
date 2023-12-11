package com.kh.meetgo.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.dto.ReviewDto;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.gosu.model.vo.Review;
import com.kh.meetgo.gosu.model.vo.ReviewImg;
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
    
    public ArrayList<EstimateDto> selectCompleteEstimateList(SqlSessionTemplate sqlSession, PageInfo pi2, int userNo){
    	int limit = pi2.getBoardLimit();
    	int offset = (pi2.getCurrentPage() - 1) * limit;
    	
    	RowBounds rowBounds = new RowBounds(offset, limit);
    	
    	return (ArrayList)sqlSession.selectList("memberMapper.selectCompleteEstimateList", userNo, rowBounds);
    }
    
    public Estimate selectEstimateDetail(SqlSessionTemplate sqlSession, int eno) {
    	return sqlSession.selectOne("memberMapper.selectEstimateDetail", eno);
    }
    
    public String getName(SqlSessionTemplate sqlSession, int userNo) {
    	return sqlSession.selectOne("memberMapper.getName", userNo);
    }

	public int payService(SqlSessionTemplate sqlSession, String estNo, String tid) {
		
		Estimate e = new Estimate();
		
		e.setEstNo(Integer.parseInt(estNo));
		e.setTid(tid);
		
		return sqlSession.update("memberMapper.payService", e);
	}

	public int updateStatus(SqlSessionTemplate sqlSession, int estNo) {
		return sqlSession.update("memberMapper.updateStatus", estNo);
	}

	public int reviewEnroll(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("memberMapper.reviewEnroll", review);
	}

	public int reviewImageEnroll(SqlSessionTemplate sqlSession, ReviewImg reImg) {
		return sqlSession.insert("memberMapper.reviewImageEnroll", reImg);
	}

	public int reviewListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.reviewListCount", userNo);
	}

	public ArrayList<ReviewDto> myReviewList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
    	
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
    	
    	RowBounds rowBounds = new RowBounds(offset, limit);
    	
    	return (ArrayList)sqlSession.selectList("memberMapper.myReviewList", userNo, rowBounds);
	}

	public ReviewDto myReviewDetail(SqlSessionTemplate sqlSession, int revNo) {
		return (ReviewDto)sqlSession.selectOne("memberMapper.myReviewDetail", revNo);
	}

	public ArrayList<ReviewImg> myReviewDetailImg(SqlSessionTemplate sqlSession, int revNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.myReviewDetailImg", revNo);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.update("memberMapper.deleteReview", revNo);
	}
}
