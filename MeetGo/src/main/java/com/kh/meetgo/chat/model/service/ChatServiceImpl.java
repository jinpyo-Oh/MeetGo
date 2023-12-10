package com.kh.meetgo.chat.model.service;

import com.kh.meetgo.chat.model.dao.ChatDao;
import com.kh.meetgo.chat.model.dto.ChatListDto;
import com.kh.meetgo.chat.model.dto.ChatReviewDto;
import com.kh.meetgo.chat.model.vo.Chat;
import com.kh.meetgo.chat.model.vo.Chatroom;
import com.kh.meetgo.gosu.model.vo.*;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService{
    private final ChatDao chatDao;
    private final SqlSessionTemplate sqlSession;
    @Override
    public ArrayList<ChatListDto> selectChatroomList(Member m, String type) {
        return chatDao.selectChatroomList(sqlSession, m);
    }

    @Override
    public ArrayList<Chat> selectChatList(int chatroomNo) {
        return chatDao.selectChatList(sqlSession,chatroomNo);
    }

    @Override
    public Chatroom selectChatroom(int chatroomNo) {
        return chatDao.selectChatroom(sqlSession, chatroomNo);
    }

    @Override
    public int insertChat(Chat chat) {
        return chatDao.insertChat(sqlSession, chat);
    }

    @Override
    public Member selectChatUserInfo(String chatroomNo) {
        return chatDao.selectChatUserInfo(sqlSession, chatroomNo);
    }

    @Override
    public int insertEstimate(Estimate estimate) {
        return chatDao.insertEstimate(sqlSession,estimate);
    }

    @Override
    public Estimate searchEstimate(int estNo) {
        return chatDao.searchEstimate(sqlSession,estNo);
    }

    @Override
    public ArrayList<CategorySmall> selectAllCategory(String gosuNo) {
        return chatDao.selectAllCategory(sqlSession, gosuNo);
    }

    @Override
    public String selectService(int categorySmallNo) {
        return chatDao.selectService(sqlSession,categorySmallNo);
    }

    @Override
    public int insertChatImg(Chat chat) {
        return chatDao.insertChatImg(sqlSession,chat);
    }

    @Override
    public int changeEstStatus(Estimate estimate) {
        return chatDao.changeEstStatus(sqlSession,estimate);
    }

    @Override
    public Member selectChatGosuInfo(int chatroomNo) {
        return chatDao.selectChatGosuInfo(sqlSession,chatroomNo);
    }

    @Override
    public ArrayList<CategorySmall> selectServiceList(int userNo) {
        return chatDao.selectServiceList(sqlSession,userNo);
    }

    @Override
    public Gosu selectGosu(int userNo) {
        return chatDao.selectGosu(sqlSession, userNo);
    }

    @Override
    public ArrayList<GosuImg> selectGosuImg(int userNo) {
        return chatDao.selectGosuImg(sqlSession,userNo);
    }

    @Override
    public ArrayList<ChatReviewDto> selectReviewList(int userNo) {
        return chatDao.selectReviewList(sqlSession, userNo);
    }

    @Override
    public ArrayList<PofolImg> selectPofolList(int userNo) {
        return chatDao.selectPofolList(sqlSession, userNo);
    }

    @Override
    public double selectReviewAvg(int userNo) {
        return chatDao.selectReviewAvg(sqlSession,userNo);
    }

    @Override
    public int updateChatRead(Map<String, Object> params) {
        return chatDao.updateChatRead(sqlSession, params);
    }

}
