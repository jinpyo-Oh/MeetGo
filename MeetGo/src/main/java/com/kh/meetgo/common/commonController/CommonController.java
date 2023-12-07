package com.kh.meetgo.common.commonController;

import com.google.gson.Gson;
import com.kh.meetgo.common.model.dto.PoFolRequest;
import com.kh.meetgo.common.model.service.CommonService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
@RequiredArgsConstructor
public class CommonController {
    private final CommonService commonService;

    @ResponseBody
    @GetMapping(value = "selectMainPortfolio", produces = "text/json; charset=UTF-8")
    public String selectMainPortfolio(){
        ArrayList<PoFolRequest> list = commonService.selectMainPortfolio();
        return new Gson().toJson(list);
    }
}
