package com.kh.meetgo.common.commonController;

import com.google.gson.Gson;
import com.kh.meetgo.common.model.dto.PoFolRequest;
import com.kh.meetgo.common.model.service.CommonService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @GetMapping("/error404")
    public String Error404(HttpServletResponse res, Model model) {
//        LOGGER.warn("========== ERROR 404 PAGE ==========");
        model.addAttribute("code", "ERROR_404");
        return "common/errorPage";
    }

    @GetMapping("/error500")
    public String Error500(HttpServletResponse res, Model model) {
//        LOGGER.warn("========== ERROR 500 PAGE ==========");
        model.addAttribute("code", "ERROR_500");
        return "common/errorPage";
    }
}
