package com.kh.meetgo.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {

    @GetMapping(value = "/chat.ct")
    public String chatViewForm(String type, Model model){
        model.addAttribute("type", type);
        return "chat/chat";
    }
}
