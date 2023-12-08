package com.kh.meetgo.gosu.model.dto;

import com.kh.meetgo.gosu.model.vo.Estimate;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class EstimateDto {
	private Estimate estimate;
	private int reviewCnt;
}
