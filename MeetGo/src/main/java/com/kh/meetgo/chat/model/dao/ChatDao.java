package com.kh.meetgo.chat.model.dao;

import com.kh.meetgo.chat.model.dto.ChatListDto;
import com.kh.meetgo.chat.model.vo.Chat;
import com.kh.meetgo.chat.model.vo.Chatroom;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class ChatDao {
    public ArrayList<ChatListDto> selectChatroomList(SqlSessionTemplate sqlSession, Member m) {
        return (ArrayList) sqlSession.selectList("chatMapper.selectChatRoomList", m);
    }

    public ArrayList<Chat> selectChatList(SqlSessionTemplate sqlSession, int chatroomNo) {
        return (ArrayList) sqlSession.selectList("chatMapper.selectChatList", chatroomNo);
    }

    public Chatroom selectChatroom(SqlSessionTemplate sqlSession, int chatroomNo) {
        return sqlSession.selectOne("chatMapper.selectChatroom", chatroomNo);
    }

    public int insertChat(SqlSessionTemplate sqlSession, Chat chat) {
        return sqlSession.insert("chatMapper.insertChat", chat);
    }

    public Member selectChatUserInfo(SqlSessionTemplate sqlSession, String no) {
        int chatroomNo = Integer.parseInt(no);
        return sqlSession.selectOne("memberMapper.selectChatUserInfo", chatroomNo);
    }

    public int insertEstimate(SqlSessionTemplate sqlSession, Estimate estimate) {
        return sqlSession.insert("chatMapper.insertEstimate", estimate);
    }
}
