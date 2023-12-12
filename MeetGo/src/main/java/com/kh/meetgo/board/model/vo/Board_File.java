package com.kh.meetgo.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
public class Board_File {
	

	
	private int bFileNo;//	BFILE_NO	NUMBER	No		1	
	private String filePath;		//	BFILE_PATH	VARCHAR2(1000 BYTE)	No		4	
	private String bFileStatus;		//	BFILE_STATUS	VARCHAR2(1 BYTE)	Yes		5	
	private int boardNo;		//	BOARD_NO	NUMBER	No		6	
	

}
