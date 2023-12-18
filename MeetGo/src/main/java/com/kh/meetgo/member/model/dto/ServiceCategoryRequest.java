package com.kh.meetgo.member.model.dto;

import com.kh.meetgo.gosu.model.vo.CategoryBig;
import com.kh.meetgo.gosu.model.vo.CategorySmall;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class ServiceCategoryRequest {
    private CategoryBig categoryBig;
    private ArrayList<CategorySmall> categorySmalls;
}

