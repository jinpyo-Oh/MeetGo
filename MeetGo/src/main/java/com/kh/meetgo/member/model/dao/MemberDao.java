package com.kh.meetgo.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.meetgo.gosu.model.vo.*;
import com.kh.meetgo.member.model.dto.GosuInfoCntRequest;
import com.kh.meetgo.member.model.dto.ServiceCategoryRequest;
import com.kh.meetgo.member.model.dto.WishListRequest;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.dto.ReviewDto;
import com.kh.meetgo.member.model.vo.Gosu;
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
        return sqlSession.selectOne("memberMapper.updateEmailPassword", email);
    }

    public int changeStatus(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.update("memberMapper.changeStatus", m);
    }

    public int pwdCheck(SqlSessionTemplate sqlSession, String checkPwd) {
        return sqlSession.selectOne("memberMapper.pwdCheck", checkPwd);
    }

    public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
        // TODO Auto-generated method stub
        return sqlSession.selectOne("memberMapper.emailCheck", checkEmail);
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

    public ArrayList<Estimate> selectIncompleteEstimateList(SqlSessionTemplate sqlSession, PageInfo pi1, int userNo) {
        int limit = pi1.getBoardLimit();
        int offset = (pi1.getCurrentPage() - 1) * limit;

        RowBounds rowBounds = new RowBounds(offset, limit);

        return (ArrayList) sqlSession.selectList("memberMapper.selectIncompleteEstimateList", userNo, rowBounds);
    }

    public ArrayList<EstimateDto> selectCompleteEstimateList(SqlSessionTemplate sqlSession, PageInfo pi2, int userNo) {
        int limit = pi2.getBoardLimit();
        int offset = (pi2.getCurrentPage() - 1) * limit;

        RowBounds rowBounds = new RowBounds(offset, limit);

        return (ArrayList) sqlSession.selectList("memberMapper.selectCompleteEstimateList", userNo, rowBounds);
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

        return (ArrayList) sqlSession.selectList("memberMapper.myReviewList", userNo, rowBounds);
    }

    public ReviewDto myReviewDetail(SqlSessionTemplate sqlSession, int revNo) {
        return (ReviewDto) sqlSession.selectOne("memberMapper.myReviewDetail", revNo);
    }

    public ArrayList<ReviewImg> myReviewDetailImg(SqlSessionTemplate sqlSession, int revNo) {
        return (ArrayList) sqlSession.selectList("memberMapper.myReviewDetailImg", revNo);
    }

    public int deleteReview(SqlSessionTemplate sqlSession, int revNo) {
        return sqlSession.update("memberMapper.deleteReview", revNo);
    }

    public int completeEstimate(SqlSessionTemplate sqlSession, int eno) {
        return sqlSession.update("memberMapper.completeEstimate", eno);
    }

    public Member selectMember(SqlSessionTemplate sqlSession, Member member) {
        return sqlSession.selectOne("memberMapper.selectMember", member);
    }

    public int insertKakaoMember(SqlSessionTemplate sqlSession, Member member) {
        return sqlSession.insert("memberMapper.insertKakaoMember", member);
    }


    public int elaborateUpdate(SqlSessionTemplate sqlSession, Gosu g) {
        // TODO Auto-generated method stub
        return sqlSession.update("memberMapper.elaborateUpdate", g);
    }

    public int introductionUpdate(SqlSessionTemplate sqlSession, Gosu g) {
        // TODO Auto-generated method stub
        return sqlSession.update("memberMapper.introductionUpdate", g);
    }

    public Gosu getGosuInfoByUserNo(SqlSessionTemplate sqlSession, int userNo) {
        // TODO Auto-generated method stub
        return sqlSession.selectOne("memberMapper.gosuInfoByUserNo", userNo);
    }

    public int availableTimeUpdate(SqlSessionTemplate sqlSession, Gosu g) {
        // TODO Auto-generated method stub
        return sqlSession.update("memberMapper.availableTimeUpdate", g);
    }

    public int educationUpdate(SqlSessionTemplate sqlSession, Gosu g) {
        // TODO Auto-generated method stub
        return sqlSession.update("memberMapper.educationUpdate", g);
    }

    public int moveDistanceUpdate(SqlSessionTemplate sqlSession, Gosu g) {
        // TODO Auto-generated method stub
        return sqlSession.update("memberMapper.moveDistanceUpdate", g);
    }

    public int employeesUpdate(SqlSessionTemplate sqlSession, Gosu g) {
        // TODO Auto-generated method stub
        return sqlSession.update("memberMapper.employeesUpdate", g);
    }

    public int regionUpdate(SqlSessionTemplate sqlSession, Gosu g) {
        // TODO Auto-generated method stub
        return sqlSession.update("memberMapper.regionUpdate", g);
    }

    public int careerUpdate(SqlSessionTemplate sqlSession, Gosu g) {
        // TODO Auto-generated method stub
        return sqlSession.update("memberMapper.careerUpdate", g);
    }


    public int uploadFile(SqlSessionTemplate sqlSession, GosuImg gosuImg) {
        // TODO Auto-generated method stub
        return sqlSession.insert("memberMapper.insertGosuImg", gosuImg);
    }


    public ArrayList<GosuImg> selectAllGosuImg(SqlSessionTemplate sqlSession, int userNo) {
        // TODO Auto-generated method stub
        return (ArrayList) sqlSession.selectList("memberMapper.selectAllGosuImg", userNo);
    }


    public int WrittenReviewToMeCount(SqlSessionTemplate sqlSession, int gosuNo) {
        return sqlSession.selectOne("memberMapper.WrittenReviewToMeCount", gosuNo);
    }

    public ArrayList<ReviewDto> WrittenReviewToMeCount(SqlSessionTemplate sqlSession, PageInfo pi, int gosuNo) {

        int limit = pi.getBoardLimit();
        int offset = (pi.getCurrentPage() - 1) * limit;

        RowBounds rowBounds = new RowBounds(offset, limit);

        return (ArrayList) sqlSession.selectList("memberMapper.WrittenReviewToMe", gosuNo, rowBounds);
    }

    public ReviewDto WrittenReviewDetail(SqlSessionTemplate sqlSession, int revNo) {
        return sqlSession.selectOne("memberMapper.WrittenReviewDetail", revNo);
    }

	public int checkEmail(SqlSessionTemplate sqlSession, String checkEmail) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.checkEmail",checkEmail);
	}

	public ArrayList<Member> selectWishlist(SqlSessionTemplate sqlSession, int gosuNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectWishList",gosuNo);
	}

    public int deleteGosuImg(SqlSessionTemplate sqlSession, int gosuImgNo) {
        return sqlSession.delete("memberMapper.deleteGosuImg", gosuImgNo);
    }

    public GosuInfoCntRequest gosuInfoDetailCnt(SqlSessionTemplate sqlSession, int userNo) {
        return sqlSession.selectOne("memberMapper.gosuInfoDetailCnt", userNo);
    }

    public ArrayList<CategorySmall> selectAllService(SqlSessionTemplate sqlSession, int userNo) {
        return (ArrayList) sqlSession.selectList("memberMapper.selectAllService", userNo);
    }

    public ArrayList<ServiceCategoryRequest> selectAllServiceCategory(SqlSessionTemplate sqlSession) {
        ArrayList<ServiceCategoryRequest> serviceCategoryRequests = new ArrayList<>();
        ArrayList<CategoryBig> list = (ArrayList) sqlSession.selectList("memberMapper.selectAllBigCategory");
        for (int i = 0; i < list.size(); i++) {
            ServiceCategoryRequest data = new ServiceCategoryRequest();
            data.setCategoryBig(list.get(i));
            int categoryBigNo = list.get(i).getCategoryBigNo();
            data.setCategorySmalls((ArrayList) sqlSession.selectList("memberMapper.selectAllSmallCategory", categoryBigNo));
            serviceCategoryRequests.add(data);
        }
        return serviceCategoryRequests;
    }

    public int insertGosuService(SqlSessionTemplate sqlSession, String categorySmallNo, int userNo) {
        Map<String, Integer> params = new HashMap<>();
        params.put("categorySmallNo", Integer.valueOf(categorySmallNo));
        params.put("userNo", userNo);
        return sqlSession.insert("memberMapper.insertGosuService", params);
    }

    public int deleteGosuService(SqlSessionTemplate sqlSession, String categorySmallNo, int userNo) {
        Map<String, Integer> params = new HashMap<>();
        params.put("categorySmallNo", Integer.valueOf(categorySmallNo));
        params.put("userNo", userNo);
        return sqlSession.delete("memberMapper.deleteGosuService", params);
    }

    public ArrayList<WishListRequest> selectAllWishList(SqlSessionTemplate sqlSession, int userNo) {
        return (ArrayList)sqlSession.selectList("memberMapper.selectAllWishList", userNo);
    }
}
