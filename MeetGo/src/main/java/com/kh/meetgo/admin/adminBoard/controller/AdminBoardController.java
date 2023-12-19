package com.kh.meetgo.admin.adminBoard.controller;

import com.google.gson.Gson;
import com.kh.meetgo.admin.adminBoard.model.service.AdminBoardService;
import com.kh.meetgo.admin.adminChat.model.dto.AdminChatRequest;
import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AdminBoardController {
    @Autowired
    private AdminBoardService adminBoardService;

    @RequestMapping("adminNoticeList.ad")
    public String adminNoticeList(Model model) {
        model.addAttribute("cPage", 1);
        return "admin/board/notice/adminNoticeList";
    }
    @RequestMapping("adminTipList.ad")
    public String adminTipList(Model model) {
        model.addAttribute("cPage", 1);
        return "admin/board/tip/adminTipList";
    }
    @RequestMapping("adminGosuRequestList.ad")
    public String adminGosuRequestList(Model model) {
        model.addAttribute("cPage", 1);
        return "admin/board/gosuRequest/adminGosuList";
    }

    @ResponseBody
    @GetMapping(value = "selectBoardList", produces = "text/json; charset=UTF-8")
    public String selectAllChatRoom(String status, int cPage, Model model) {
        int pageLimit = 10;
        int boardLimit = 10;
        int listCount = adminBoardService.countAllBoard(status);
        PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
        model.addAttribute("cPage", cPage);
        ArrayList<Board> list = adminBoardService.selectAllBoard(pi,status);
        Map<String, Object> map = new HashMap<>();
        model.addAttribute("cPage", cPage);
        map.put("list", list);
        map.put("pi", pi);
        return new Gson().toJson(map);
    }
}
