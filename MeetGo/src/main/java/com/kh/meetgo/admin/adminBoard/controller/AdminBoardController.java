package com.kh.meetgo.admin.adminBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminBoardController {
    @RequestMapping("adminNoticeList.ad")
    public String adminNoticeList() {
        return "admin/board/notice/adminNoticeList";
    }
    @RequestMapping("adminTipList.ad")
    public String adminTipList() { return "admin/board/tip/adminTipList"; }
    @RequestMapping("adminGosuRequestList.ad")
    public String adminGosuRequestList() { return "admin/board/gosuRequest/adminGosuList"; }


}
