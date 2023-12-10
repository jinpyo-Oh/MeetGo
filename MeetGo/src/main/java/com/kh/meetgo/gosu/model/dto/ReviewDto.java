package com.kh.meetgo.gosu.model.dto;

import com.kh.meetgo.gosu.model.vo.Review;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReviewDto {
	private Review review;
	private String revImgUrl;
}
