package com.kh.meetgo.member.model.service;

import java.util.ArrayList;

import com.kh.meetgo.gosu.model.vo.*;
import com.kh.meetgo.member.model.dto.GosuInfoCntRequest;
import com.kh.meetgo.member.model.dto.ServiceCategoryRequest;
import com.kh.meetgo.member.model.dto.WishListRequest;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.gosu.model.dto.EstimateDto;
import com.kh.meetgo.gosu.model.dto.ReviewDto;
import com.kh.meetgo.member.model.dao.MemberDao;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;

@Service
// Service 타입의 어노테이션을 붙여주면
// 빈 스캐닝을 통해 자동으로 bean 으로 등록됨
public class MemberServiceImpl implements MemberService {


    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private MemberDao memberDao;


    @Override
    public Member loginMember(Member m) {

        /*
         * * 기존 MyBatis 를 연동한 Service 단 코드 흐름
         * 1. SqlSession 객체 생성
         * 2. SqlSession 과 전달값을 DAO 로 넘기면서
         *    요청 후 결과 받기
         * 3. 트랜잭션 처리
         * 4. SqlSession 객체 반납
         * 5. 결과 리턴
         *
         * => Spring 에서는 SqlSession 객체 대신
         *    SqlSessionTemplate 객체를 이용할 것임!!
         *    (root-context.xml 에 bean 으로 등록해놨음)
         * => bean 으로 등록해뒀기 때문에
         *    SqlSessionTemplate 객체를 직접 생성할 필요가 없음!!
         *    (@Autowired 를 이용해서 생성받으면 됨)
         * => 또한, 스프링이이 SqlSessionTemplate 객체를 관리해주기 때문에
         *    내가 직접 SqlSession 객체를 반납할 필요도 없어짐!!
         * => 트랜잭션 처리 또한 스프링한테 맡길 예정
         */

        // Member loginUser = memberDao.loginMember(sqlSession, m);
        // return loginUser;
        return memberDao.loginMember(sqlSession, m);
    }

    @Override
    public int insertMember(Member m) {
        return memberDao.insertMember(sqlSession, m);
    }

    @Override
    public int updateMember(Member m) {
        return memberDao.updateMember(sqlSession, m);
    }

    @Override
    public int deleteMember(String userId) {
        return memberDao.deleteMember(sqlSession, userId);
    }

    @Override
    public int idCheck(String checkId) {
        return memberDao.idCheck(sqlSession, checkId);
    }

    @Override
    public int pwdCheck(String checkPwd) {
        return memberDao.pwdCheck(sqlSession, checkPwd);
    }

    public int emailCheck(String checkEmail) {
        return memberDao.emailCheck(sqlSession, checkEmail);
    }

    @Override
    public int uploadImg(String imgUpload) {
        return 0;
    }

    @Override
    public int changeStatus(Member m) {
        return memberDao.changeStatus(sqlSession, m);
    }

    @Override
    public int selectIncompleteListCount(int userNo) {
        return memberDao.selectIncompleteListCount(sqlSession, userNo);
    }

    @Override
    public int selectCompleteListCount(int userNo) {
        return memberDao.selectCompleteListCount(sqlSession, userNo);
    }

    @Override
    public ArrayList<Estimate> selectIncompleteEstimateList(PageInfo pi1, int userNo) {
        return memberDao.selectIncompleteEstimateList(sqlSession, pi1, userNo);
    }

    @Override
    public ArrayList<EstimateDto> selectCompleteEstimateList(PageInfo pi2, int userNo) {
        return memberDao.selectCompleteEstimateList(sqlSession, pi2, userNo);
    }

    @Override
    public Estimate selectEstimateDetail(int eno) {
        return memberDao.selectEstimateDetail(sqlSession, eno);
    }

    @Override
    public String getName(int userNo) {
        return memberDao.getName(sqlSession, userNo);
    }


    // 결제 관련 서비스
    @Override
    public int payService(String estNo, String tid) {
        return memberDao.payService(sqlSession, estNo, tid);
    }

    @Override
    public int updateStatus(int estNo) {
        return memberDao.updateStatus(sqlSession, estNo);
    }

    @Override
    public int reviewEnroll(Review review) {
        return memberDao.reviewEnroll(sqlSession, review);
    }

    @Override
    public int reviewImageEnroll(ReviewImg reImg) {
        return memberDao.reviewImageEnroll(sqlSession, reImg);
    }

    @Override
    public int reviewListCount(int userNo) {
        return memberDao.reviewListCount(sqlSession, userNo);
    }

    @Override
    public ArrayList<ReviewDto> myReviewList(PageInfo pi, int userNo) {
        return memberDao.myReviewList(sqlSession, pi, userNo);
    }

    @Override
    public ReviewDto myReviewDetail(int revNo) {
        return memberDao.myReviewDetail(sqlSession, revNo);
    }

    @Override
    public ArrayList<ReviewImg> myReviewDetailImg(int revNo) {
        return memberDao.myReviewDetailImg(sqlSession, revNo);
    }

    @Override
    public int deleteReview(int revNo) {
        return memberDao.deleteReview(sqlSession, revNo);
    }

    @Override
    public int completeEstimate(int eno) {
        return memberDao.completeEstimate(sqlSession, eno);
    }

    @Override
    public int elaborateUpdate(Gosu g) {
        return memberDao.elaborateUpdate(sqlSession, g);
    }

    @Override
    public int introductionUpdate(Gosu g) {
        return memberDao.introductionUpdate(sqlSession, g);
    }

    @Override
    public Gosu getGosuInfoByUserNo(int userNo) {
        // TODO Auto-generated method stub
        return memberDao.getGosuInfoByUserNo(sqlSession, userNo);
    }

    @Override
    public int availableTimeUpdate(Gosu g) {
        // TODO Auto-generated method stub
        return memberDao.availableTimeUpdate(sqlSession, g);
    }

    @Override
    public int educationUpdate(Gosu g) {
        // TODO Auto-generated method stub
        return memberDao.educationUpdate(sqlSession, g);
    }

    @Override
    public int moveDistanceUpdate(Gosu g) {
        // TODO Auto-generated method stub
        return memberDao.moveDistanceUpdate(sqlSession, g);
    }

    @Override
    public int employeesUpdate(Gosu g) {
        // TODO Auto-generated method stub
        return memberDao.employeesUpdate(sqlSession, g);
    }
    /*
     * @Override public ArrayList<CategoryBig> SelectCategoryBigList(int
     * categoryBigNo){ return
     * memberDao.SelectCategoryBigList(sqlSession,categoryBigNo); }
     *
     * @Override public ArrayList<CategorySmall> SelectCategorySmallList(int
     * categorySmallNo) { // TODO Auto-generated method stub return
     * memberDao.SelectCategorySmallList(sqlSession, categorySmallNo); }
     */

    @Override
    public int regionUpdate(Gosu g) {
        // TODO Auto-generated method stub
        return memberDao.regionUpdate(sqlSession, g);
    }

    @Override
    public int careerUpdate(Gosu g) {
        // TODO Auto-generated method stub
        return memberDao.careerUpdate(sqlSession, g);
    }

    /*
     * @Override public int potoupdate(Gosu g) { // TODO Auto-generated method stub
     * return memberDao.potoupdate(sqlSession,g); }
     */

    @Override
    public int uploadFile(GosuImg gosuImg) {
        return memberDao.uploadFile(sqlSession, gosuImg);
    }

    @Override
    public ArrayList<GosuImg> selectAllGosuImg(int userNo) {
        return memberDao.selectAllGosuImg(sqlSession, userNo);
    }


    @Override
    public Member selectMember(Member member) {
        return memberDao.selectMember(sqlSession, member);
    }

    @Override
    public int insertKakaoMember(Member member) {
        return memberDao.insertKakaoMember(sqlSession, member);
    }

    @Override
    public int WrittenReviewToMeCount(int gosuNo) {
        return memberDao.WrittenReviewToMeCount(sqlSession, gosuNo);
    }

    @Override
    public ArrayList<ReviewDto> WrittenReviewToMe(PageInfo pi, int gosuNo) {
        return memberDao.WrittenReviewToMeCount(sqlSession, pi, gosuNo);
    }

    @Override
    public ReviewDto WrittenReviewDetail(int revNo) {
        return memberDao.WrittenReviewDetail(sqlSession, revNo);
    }

    @Override
    public int checkEmail(String checkEmail) {
        // TODO Auto-generated method stub
        return memberDao.checkEmail(sqlSession, checkEmail);
    }


    @Override
    public int deleteGosuImg(int gosuImgNo) {
		return memberDao.deleteGosuImg(sqlSession, gosuImgNo);
    }

    @Override
    public GosuInfoCntRequest gosuInfoDetailCnt(int userNo) {
        return memberDao.gosuInfoDetailCnt(sqlSession, userNo);
    }

    @Override
    public ArrayList<CategorySmall> selectAllService(int userNo) {
        return memberDao.selectAllService(sqlSession, userNo);
    }

    @Override
    public ArrayList<ServiceCategoryRequest> selectAllServiceCategory() {
        return memberDao.selectAllServiceCategory(sqlSession);
    }

    @Override
    public int insertGosuService(String categorySmallNo, int userNo) {
        return memberDao.insertGosuService(sqlSession, categorySmallNo, userNo);
    }

    @Override
    public int deleteGosuService(String categorySmallNo, int userNo) {
        return memberDao.deleteGosuService(sqlSession, categorySmallNo, userNo);
    }

    @Override
    public ArrayList<WishListRequest> selectAllWishList(int userNo) {
        return memberDao.selectAllWishList(sqlSession, userNo);
    }

    @Override
    public ArrayList<Member> selectWishlist(int gosuNo) {
        // TODO Auto-generated method stub
        return memberDao.selectWishlist(sqlSession, gosuNo);
    }

	@Override
	public int updatePassword(String email, String userPwd) {
		// TODO Auto-generated method stub
		return memberDao.updatePassword(sqlSession, email,userPwd);
	}

 


}