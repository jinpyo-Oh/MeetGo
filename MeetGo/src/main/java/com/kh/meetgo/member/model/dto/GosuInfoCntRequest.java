package com.kh.meetgo.member.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class GosuInfoCntRequest {
    private double reviewAvg;
    private int reviewCnt;
    private int employmentCnt;
}

