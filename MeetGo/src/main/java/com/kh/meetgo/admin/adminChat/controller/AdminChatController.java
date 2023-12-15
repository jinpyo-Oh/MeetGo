package com.kh.meetgo.admin.adminChat.controller;

import com.kh.meetgo.admin.adminChat.model.service.AdminChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
public class AdminChatController {
    private final AdminChatService adminChatService;

    @GetMapping("adminChatList.ad")
    private String adminChatList(){
        return "admin/chat/adminChatRoomList";
    }
}
