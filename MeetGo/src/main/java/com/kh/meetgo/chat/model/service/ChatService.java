package com.kh.meetgo.chat.model.service;

import com.kh.meetgo.chat.model.dto.ChatListDto;
import com.kh.meetgo.chat.model.vo.Chat;
import com.kh.meetgo.chat.model.vo.Chatroom;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.member.model.vo.Member;

import java.util.ArrayList;

public interface ChatService {
    ArrayList<ChatListDto> selectChatroomList(Member m);

    ArrayList<Chat> selectChatList(int roomNo);

    Chatroom selectChatroom(int chatroomNo);

    int insertChat(Chat chat);

    Member selectChatUserInfo(String chatroomNo);

    int insertEstimate(Estimate estimate);

    Estimate searchEstimate(int estNo);
}
