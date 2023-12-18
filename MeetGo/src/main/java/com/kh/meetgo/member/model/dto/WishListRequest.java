package com.kh.meetgo.member.model.dto;

import com.kh.meetgo.member.model.vo.Gosu;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.bind.annotation.GetMapping;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class WishListRequest {
    private Gosu gosu;
    private String userProfile;
    private String userName;
    private GosuInfoCntRequest gosuInfoCntRequest;
}
