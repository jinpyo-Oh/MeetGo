package com.kh.meetgo.chat.model.dto;

import com.kh.meetgo.gosu.model.vo.Review;
import com.kh.meetgo.gosu.model.vo.ReviewImg;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ChatReviewDto {
    private Review review;
    private ReviewImg reviewImg;
}
