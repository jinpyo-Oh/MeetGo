package com.kh.meetgo.board.model.dto;


import lombok.*;
@Getter
@Setter
@NoArgsConstructor
@ToString
public class BoardFileDto {
    private int boardNo;
    private String boardTitle;
    private String boardContent;
    private String boardCreateDate;
    private int boardCount;
    private String BfilePath;
    private int userNo;
}