package com.kh.meetgo.admin.adminCommon.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ChartMemberDto {
	
	int count;
	int profit = count / 10;
	String month;
}
