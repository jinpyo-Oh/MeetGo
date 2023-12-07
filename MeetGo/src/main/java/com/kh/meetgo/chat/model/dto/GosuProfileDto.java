package com.kh.meetgo.chat.model.dto;

import com.kh.meetgo.gosu.model.vo.*;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class GosuProfileDto {
    private Member member;
    private ArrayList<ChatReviewDto> chatReviewDtoList;
    private Gosu gosu;
    private ArrayList<GosuImg> gosuImgList;
    private ArrayList<CategorySmall> serviceList;
    private ArrayList<PofolImg> pofolImgList;
    private double reviewAvg;
}
