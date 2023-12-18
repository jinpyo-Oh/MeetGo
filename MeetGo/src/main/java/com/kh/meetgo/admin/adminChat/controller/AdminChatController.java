package com.kh.meetgo.admin.adminChat.controller;

import com.google.gson.Gson;
import com.kh.meetgo.admin.adminChat.model.dto.AdminChatRequest;
import com.kh.meetgo.admin.adminChat.model.service.AdminChatService;
import com.kh.meetgo.common.model.vo.PageInfo;
import com.kh.meetgo.common.template.Pagination;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class AdminChatController {
    private final AdminChatService adminChatService;

    @GetMapping("adminChatList.ad")
    private String adminChatList(){
        return "admin/chat/adminChatRoomList";
    }

    @ResponseBody
    @GetMapping(value = "selectAllChatRoom.ad", produces = "text/json; charset=UTF-8")
    public String selectAllChatRoom(int cPage, Model model) {
        int pageLimit = 10;
        int boardLimit = 10;
        int listCount = adminChatService.countAllChatRoom();
        PageInfo pi = Pagination.getPageInfo(listCount, cPage, pageLimit, boardLimit);
        ArrayList<AdminChatRequest> list = adminChatService.selectAllChatRoom(pi);
        Map<String, Object> map = new HashMap<>();
        map.put("chatList", list);
        map.put("pi", pi);
        model.addAttribute("cPage", cPage);
        return new Gson().toJson(map);
    }
}
