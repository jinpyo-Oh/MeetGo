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
	private String originName;		//	BFILE_ORIGIN_NAME	VARCHAR2(1000 BYTE)	No		2	
	private String changeName;		//	BFILE_CHANGE_NAME	VARCHAR2(1000 BYTE)	No		3	
	private String filePath;		//	BFILE_PATH	VARCHAR2(1000 BYTE)	No		4	
	private String status;		//	BFILE_STATUS	VARCHAR2(1 BYTE)	Yes		5	
	private int boardNo;		//	BOARD_NO	NUMBER	No		6	
	

}
