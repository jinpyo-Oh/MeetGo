package com.kh.meetgo.chat.model.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Chat {
    private int chatNo;
    private String content;
    private int sender;
    private String type;
    private String createAt;
    private int chatroomNo;
    private int chatRead;
}
