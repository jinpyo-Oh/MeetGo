package com.kh.meetgo.chat.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Chatroom {
    private int chatroomNo;
    private Date createAt;
    private int userNo;
    private int gosuNo;
}
