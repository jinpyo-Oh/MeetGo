package com.kh.meetgo.chat.model.dto;

import com.kh.meetgo.gosu.model.vo.Review;
import com.kh.meetgo.gosu.model.vo.ReviewImg;
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
public class RequestChatUserInfo {
    private Member member;
    private ArrayList<ChatReviewDto> reviewImgList;
    private int reviewCnt;
}
