package com.kh.meetgo.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Reply {
	
		private int replyNo;	//	REPLY_NO	NUMBER
		private String replyContent;	//	REPLY_CONTENT	VARCHAR2(100 BYTE)
		private String replyDate;		//	REPLY_DATE	DATE
		private int rplyStatus;			//	REPLY_STATUS	NUMBER
		private int boardNo;			//	BOARD_NO	NUMBER
		private int userNo;			//	USER_NO	NUMBER
		private String userNickname;
}
