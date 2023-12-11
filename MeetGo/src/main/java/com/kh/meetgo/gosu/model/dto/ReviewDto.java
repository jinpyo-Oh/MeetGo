package com.kh.meetgo.gosu.model.dto;

import java.util.ArrayList;

import com.kh.meetgo.gosu.model.vo.Review;
import com.kh.meetgo.gosu.model.vo.ReviewImg;

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
	private ArrayList<ReviewImg> reviewImgList;
	private String revImgUrl;
	private String userName;
	private String gosuName;
	private String estTitle;
}
