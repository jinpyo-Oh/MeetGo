package com.kh.meetgo.board.model.dto;

import com.kh.meetgo.board.model.vo.Board;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class BoardDto {

	private Board board;
	private String userProfile;
	private String userNickname;
}
