package com.kh.meetgo.board.model.vo;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Board {
	
	private int boardNo;// BOARD_NO	NUMBER 
	private String boardTitle; // BOARD_TITLE	VARCHAR2(100 BYTE)
	private String boardContent;	// BOARD_CONTENT	VARCHAR2(1000 BYTE)
	private String createDate;	// BOARD_CREATE_DATE	DATE
	private String boardUpdate;	// BOARD_UPDATE_DATE	DATE
	private int boardCount;	// BOARD_COUNT	NUMBER
	private String boardType;	// BOARD_TYPE	VARCHAR2(1 BYTE)
	private int userNo;	// USER_NO	NUMBER
	private String userNickname;
}
