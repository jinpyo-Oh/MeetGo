package com.kh.meetgo.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class Report {
    private int reportNo;
    private int reportUser;
    private int reportedUser;
    private String reportCategory;
    private String reportContent;
    private int reportStatus;
}
