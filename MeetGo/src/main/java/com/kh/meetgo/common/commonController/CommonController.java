package com.kh.meetgo.common.commonController;

import com.google.gson.Gson;
import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.common.model.dto.BoardRequest;
import com.kh.meetgo.common.model.dto.PoFolRequest;
import com.kh.meetgo.common.model.service.CommonService;
import com.kh.meetgo.common.model.vo.Report;
import com.kh.meetgo.member.model.vo.Gosu;
import com.kh.meetgo.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@Controller
@RequiredArgsConstructor
public class CommonController {
    private final CommonService commonService;
    private static Logger LOGGER = LoggerFactory.getLogger(CommonController.class);
    @ResponseBody
    @GetMapping(value = "selectMainPortfolio", produces = "text/json; charset=UTF-8")
    public String selectMainPortfolio(){
        ArrayList<PoFolRequest> list = commonService.selectMainPortfolio();
        return new Gson().toJson(list);
    }
    @ResponseBody
    @GetMapping(value = "selectMainTipList", produces = "text/json; charset=UTF-8")
    public String selectMainTipList(){
        ArrayList<BoardRequest> list = commonService.selectMainTipList();
        return new Gson().toJson(list);
    }
    @ResponseBody
    @GetMapping(value = "selectReportedGosuInfo", produces = "text/json; charset=UTF-8")
    public String selectGosuInfo(String gosuNo){
        return new Gson().toJson((Member)commonService.selectGosuInfo(Integer.parseInt(gosuNo)));
    }

    @ResponseBody
    @PostMapping(value = "insertReport", produces = "text/json; charset=UTF-8")
    public String insertReport(@RequestBody Report report){
        int result = commonService.insertReport(report);
        return new Gson().toJson(report);
    }

}
