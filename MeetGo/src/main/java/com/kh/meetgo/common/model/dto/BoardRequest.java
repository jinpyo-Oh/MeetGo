package com.kh.meetgo.common.model.dto;

import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.member.model.vo.Member;
import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class BoardRequest {
    private Board board;
    private Member member;
}
