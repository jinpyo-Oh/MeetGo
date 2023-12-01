package com.kh.meetgo.chat.controller;

import com.google.gson.Gson;
import com.kh.meetgo.chat.model.dto.ChatListDto;
import com.kh.meetgo.chat.model.service.ChatService;
import com.kh.meetgo.chat.model.vo.Chat;
import com.kh.meetgo.chat.model.vo.Chatroom;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    @ResponseBody
    @GetMapping(value = "/chatUserInfo")
    public String selectChatUserInfo(String chatroomNo) {
        System.out.println("chatUserInfo 메서드 진입");

        Member m = chatService.selectChatUserInfo(chatroomNo);
        System.out.println("m = " + m);
        return new Gson().toJson(m);
    }
    @GetMapping(value = "/estimate.ct")
    public String estimateForm(){
        return "chat/estimate";
    }

//    @ResponseBody
//    @GetMapping(value = "/selectAllEstCategory")
//    public String selectAllEstCategory(String userNo){
//        if (userNo != null) {
//
//        }
//    }
    @ResponseBody
    @PostMapping(value = "/insertEstimate")
    public String insertEstimate(@RequestBody Estimate estimate){
        System.out.println(estimate);
        int result = chatService.insertEstimate(estimate);
        System.out.println("estimate = " + estimate.getEstNo());
        return String.valueOf(estimate.getEstNo());
    }
    @ResponseBody
    @GetMapping(value = "/searchEstimate", produces = "text/json; charset=UTF-8")
    public String searchEstimate(@RequestParam(value = "estimateNo", required = false) String estimateNo) {
        int estNo = 0;
        System.out.println(estimateNo);
        if (estimateNo != null && !estimateNo.isEmpty()) {
            try {
                estNo = Integer.parseInt(estimateNo.trim());
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        System.out.println("estNo = " + estNo);
        Estimate estimate = chatService.searchEstimate(estNo);
        System.out.println(estimate);
        return new Gson().toJson(estimate);
    }
    
}
