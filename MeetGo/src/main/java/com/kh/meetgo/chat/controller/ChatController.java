package com.kh.meetgo.chat.controller;

import com.amazonaws.Request;
import com.google.gson.Gson;
import com.kh.meetgo.chat.model.dto.ChatListDto;
import com.kh.meetgo.chat.model.dto.ChatReviewDto;
import com.kh.meetgo.chat.model.dto.GosuProfileDto;
import com.kh.meetgo.chat.model.dto.RequestChatUserInfo;
import com.kh.meetgo.chat.model.service.ChatService;
import com.kh.meetgo.chat.model.vo.Chat;
import com.kh.meetgo.chat.model.vo.Chatroom;
import com.kh.meetgo.common.config.S3Uploader;
import com.kh.meetgo.gosu.model.vo.CategorySmall;
import com.kh.meetgo.gosu.model.vo.Estimate;
import com.kh.meetgo.gosu.model.vo.ReviewImg;
import com.kh.meetgo.member.model.service.MemberService;
import com.kh.meetgo.member.model.vo.Member;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class ChatController {
    private final ChatService chatService;
    private final MemberService memberService;
    private final S3Uploader s3Uploader;

    @GetMapping(value = "/chat.ct")
    public String chatViewForm(String type, Model model, HttpSession session, String chatroomNo) {
        model.addAttribute("type", type);
        if(session.getAttribute("loginUser") == null){
            return "common/errorPage";
        }
        if(chatroomNo != null){
            model.addAttribute("chatroomNo", chatroomNo);
        }
        return "chat/chat";
    }


    @ResponseBody
    @GetMapping(value = "/chatroomList", produces = "text/json; charset=UTF-8")
    public String selectChatroomList(String type, Model model, String userNo, String userStatus) {
        model.addAttribute("type", type);
        Member m = new Member();
        m.setUserNo(Integer.parseInt(userNo));
        m.setUserStatus(Integer.parseInt(userStatus));
        ArrayList<ChatListDto> chatroomList = chatService.selectChatroomList(m, type);
        return new Gson().toJson(chatroomList);
    }

    @ResponseBody
    @GetMapping(value = "/chatlist")
    public String selectChatList(String chatroomNo, String userNo) {
        ArrayList<Chat> chatList = null;
        if (chatroomNo != null && userNo != null) {
            Map<String, Object> params = new HashMap<>();
            int roomNo = Integer.parseInt(chatroomNo);
            params.put("chatroomNo", roomNo);
            params.put("sender", Integer.parseInt(userNo));
            chatService.updateChatRead(params);
            chatList = chatService.selectChatList(roomNo);
        }
        return new Gson().toJson(chatList);
    }

    @ResponseBody
    @GetMapping(value = "/chatUserInfo")
    public String selectChatUserInfo(String chatroomNo) {
        Member m = chatService.selectChatUserInfo(chatroomNo);

        RequestChatUserInfo requestChatUserInfo = new RequestChatUserInfo();
        requestChatUserInfo.setMember(m);
        requestChatUserInfo.setReviewImgList(chatService.selectUserReviewList(m.getUserNo()));
        requestChatUserInfo.setReviewCnt(memberService.reviewListCount(m.getUserNo()));
        return new Gson().toJson(requestChatUserInfo);
    }

    @ResponseBody
    @GetMapping(value = "/chatGosuInfo")
    public String selectChatGosuInfo(String chatroomNo){
        GosuProfileDto gosuProfileDto = new GosuProfileDto();

        int no = 0;
        if(!chatroomNo.isEmpty()) no = Integer.parseInt(chatroomNo);
        gosuProfileDto.setMember(chatService.selectChatGosuInfo(no));
        int userNo = gosuProfileDto.getMember().getUserNo();
        gosuProfileDto.setGosu(chatService.selectGosu(userNo));
        gosuProfileDto.setServiceList(chatService.selectServiceList(userNo));
        gosuProfileDto.setGosuImgList(chatService.selectGosuImg(userNo));
        gosuProfileDto.setChatReviewDtoList(chatService.selectReviewList(userNo));
        gosuProfileDto.setPofolImgList(chatService.selectPofolList(userNo));
        gosuProfileDto.setReviewAvg(chatService.selectReviewAvg(userNo));
        return new Gson().toJson(gosuProfileDto);
    }

    @GetMapping(value = "/estimate.ct")
    public String estimateForm() {
        return "chat/estimate";
    }
    @ResponseBody
    @PostMapping(value = "/insertEstimate")
    public String insertEstimate(@RequestBody Estimate estimate) {
        System.out.println("estimate = " + estimate);
        int result = chatService.insertEstimate(estimate);
        return String.valueOf(estimate.getEstNo());
    }
    @ResponseBody
    @GetMapping(value = "selectAllCategory", produces = "text/json; charset=UTF-8")
    public String selectAllCategory(String gosuNo){
        ArrayList<CategorySmall> list = chatService.selectAllCategory(gosuNo);
        return new Gson().toJson(list);
    }
    @ResponseBody
    @GetMapping(value = "/searchEstimate", produces = "text/json; charset=UTF-8")
    public String searchEstimate(@RequestParam(value = "estimateNo", required = false) String estimateNo) {
        int estNo = 0;
        if (estimateNo != null && !estimateNo.isEmpty()) {
            try {
                estNo = Integer.parseInt(estimateNo.trim());
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        Estimate estimate = chatService.searchEstimate(estNo);
        return new Gson().toJson(estimate);
    }

    @ResponseBody
    @PostMapping(value = "/uploadChatImg", produces = "text/json; charset=UTF-8")
    public String uploadChatImg(@RequestPart(value = "chatImg", required = false) MultipartFile file, String uNo,String cNo) throws IOException {
        String content = s3Uploader.upload(file, "chat");
        int userNo = 0; int chatroomNo = 0;
        if(!uNo.isEmpty()) userNo = Integer.parseInt(uNo);
        if(!cNo.isEmpty()) chatroomNo = Integer.parseInt(cNo);
        Chat chat = new Chat();
        chat.setContent(content);
        chat.setSender(userNo);
        chat.setChatroomNo(chatroomNo);
        chat.setType("P");
        return new Gson().toJson(content);
    }

    @ResponseBody
    @GetMapping(value = "/changeEstStatus", produces = "text/json; charset=UTF-8")
    public String changeEstStatus(String estNo, String status) {
        Estimate estimate = memberService.selectEstimateDetail(Integer.parseInt(estNo));
        if (!estNo.isEmpty()) {
            estimate.setEstNo(Integer.parseInt(estNo));
            estimate.setStatus(status);
            int result = 0;
            if(estimate.getStatus().equals("3")){
                System.out.println("estimate = " + estimate);
                result = chatService.changeAllEstStatus(estimate);
            }
            int result2 = chatService.changeEstStatus(estimate);

            if (result > 0 && result2 > 0) {
                return new Gson().toJson(estimate);
            } else {
                return new Gson().toJson("fail");
            }
        } else {
            System.out.println("에러");
            return "";
        }
    }

    @GetMapping(value = "/insertChatRoom")
    public String insertChatRoom(HttpSession session, String gno, Model model){
        Member m = (Member)session.getAttribute("loginUser");
        if(session.getAttribute("loginUser") != null && gno != null){
            Map<String, Integer> params = new HashMap<>();
            params.put("userNo", m.getUserNo());
            params.put("gosuNo", Integer.valueOf(gno));
            Chatroom chatroom = chatService.checkChatRoom(params);
            if(chatroom == null) {
                chatroom = new Chatroom();
                chatroom.setGosuNo(Integer.parseInt(gno));
                chatroom.setUserNo(((Member)session.getAttribute("loginUser")).getUserNo());
                int result = chatService.insertChatRoom(chatroom);
                if(result > 0) {
                    model.addAttribute("chatroomNo", chatroom.getChatroomNo());
                    m.setUserStatus(1);
                    session.setAttribute("loginUser", m);
                    return "redirect:/chat.ct?type=All";
                } else {
                    return "commom/errorPage";
                }
            }
            model.addAttribute("chatroomNo", chatroom.getChatroomNo());
            m.setUserStatus(1);
            session.setAttribute("loginUser", m);
            return "redirect:/chat.ct?type=All";
        }
        return "commom/errorPage";
    }

    @ResponseBody
    @GetMapping(value = "selectEst", produces = "text/json; charset=UTF-8")
    public String selectEst(String estNo){
        return new Gson().toJson(memberService.selectEstimateDetail(Integer.parseInt(estNo)));
    }
}
