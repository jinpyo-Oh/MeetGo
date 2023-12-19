package com.kh.meetgo.admin.adminBoard.controller;

import com.google.gson.Gson;
import com.kh.meetgo.admin.adminBoard.model.service.AdminBoardService;
import com.kh.meetgo.admin.adminChat.model.dto.AdminChatRequest;
import com.kh.meetgo.board.model.vo.Board;
import com.kh.meetgo.common.config.S3Uploader;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import com.kh.meetgo.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AdminBoardController {
    @Autowired
    private AdminBoardService adminBoardService;
    @Autowired
    private S3Uploader s3Uploader;
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
    @RequestMapping("adminInsertNotice.ad")
    public String adminInsertNoticeForm(){
        return "admin/board/notice/adminInsertNotice";
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

    @ResponseBody
    @PostMapping(value = "adminInsertNotice.insert", produces = "text/json; charset=UTF-8")
    public void adminInsertNotice(MultipartFile boardImg, String boardTitle, String boardContent, HttpSession session) throws IOException {
        String url = s3Uploader.upload(boardImg, "boardImg");
        Board board = new Board();
        board.setBoardTitle(boardTitle);
        board.setBoardContent(boardContent);
        board.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
        int result = adminBoardService.insertNotice(url, board);
    }

    @ResponseBody
    @GetMapping(value = "deleteBoard.ad", produces = "text/json; charset=UTF-8")
    public void deleteBoard(String boardNo) {
        int result = adminBoardService.deleteBoard(Integer.parseInt(boardNo));
        System.out.println("result = " + result);
    }
}
