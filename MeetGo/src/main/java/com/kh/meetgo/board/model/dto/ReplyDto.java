package com.kh.meetgo.board.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString

public class ReplyDto {
	
	private String userNickname;
	private String replyDate;
	private String replyContent;

}
