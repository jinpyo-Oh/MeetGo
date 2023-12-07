package com.kh.meetgo.common.model.dto;

import com.kh.meetgo.gosu.model.vo.Pofol;
import com.kh.meetgo.gosu.model.vo.PofolImg;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class PoFolRequest {
    private Pofol pofol;
    private String firstImg;
    private String gosuImg;
    private String userNickname;
}
