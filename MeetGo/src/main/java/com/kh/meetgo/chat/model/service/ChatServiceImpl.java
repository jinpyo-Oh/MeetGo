package com.kh.meetgo.chat.model.service;

import com.kh.meetgo.chat.model.dao.ChatDao;
import com.kh.meetgo.chat.model.dto.ChatListDto;
import com.kh.meetgo.chat.model.vo.Chat;
import com.kh.meetgo.chat.model.vo.Chatroom;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService{
    private final ChatDao chatDao;
    private final SqlSessionTemplate sqlSession;
    @Override
    public ArrayList<ChatListDto> selectChatroomList(Member m) {
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
}
