package com.kh.meetgo.chat.controller;

import com.google.gson.Gson;
import com.kh.meetgo.chat.model.dto.ChatListDto;
import com.kh.meetgo.chat.model.service.ChatService;
import com.kh.meetgo.chat.model.vo.Chat;
import com.kh.meetgo.chat.model.vo.Chatroom;
import com.kh.meetgo.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

@Controller
@RequiredArgsConstructor
public class ChatController {
    private final ChatService chatService;
    @GetMapping(value = "/chat.ct")
    public String chatViewForm(String type, Model model, HttpSession session, String chatroomNo){
        model.addAttribute("type", type);
        Member m = (Member) session.getAttribute("loginUser");
        ArrayList<ChatListDto> chatroomList = chatService.selectChatroomList(m);
        model.addAttribute("chatroomList", chatroomList);
        return "chat/chat";
    }

    @ResponseBody
    @GetMapping(value = "/chatlist")
    public String selectChatList(String chatroomNo) {
        ArrayList<Chat> chatList = null;
        if (chatroomNo != null) {
            int roomNo = Integer.parseInt(chatroomNo);
            chatList = chatService.selectChatList(roomNo);
        }
        return new Gson().toJson(chatList);
    }
    @GetMapping(value = "/estimate.ct")
    public String estimateForm(){
        return "chat/estimate";
    }

}
