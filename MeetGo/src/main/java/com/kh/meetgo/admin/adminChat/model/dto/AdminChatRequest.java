package com.kh.meetgo.admin.adminChat.model.dto;

import com.kh.meetgo.chat.model.vo.Chatroom;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class AdminChatRequest {
    private Chatroom chatroom;
    private String userName;
    private String gosuName;
}
