package com.kh.meetgo.chat.server;

import com.google.gson.Gson;
import com.kh.meetgo.chat.model.service.ChatService;
import com.kh.meetgo.chat.model.vo.Chat;
import com.kh.meetgo.chat.model.vo.Chatroom;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Controller
@RequiredArgsConstructor
public class WebSocketHandler extends TextWebSocketHandler {
    private final ChatService chatService;
    private Map<Integer, ArrayList<WebSocketSession>> roomList = new ConcurrentHashMap<Integer, ArrayList<WebSocketSession>>();
    private Map<WebSocketSession, Integer> sessionList = new ConcurrentHashMap<WebSocketSession, Integer>();
    private static int person;
    // websocket 연결 성공 시
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        person++;
        System.out.println("@@@@@@@@ 연결 성공 @@@@@@@@@");
    }

    // websocket 연결 종료 시
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        person--;
        System.out.println(session.getId() + " 연결 종료 => 총 접속 인원 : " + person + "명");
        // sessionList에 session이 있다면
        if(sessionList.get(session) != null) {
            // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
            roomList.get(sessionList.get(session)).remove(session);
            sessionList.remove(session);
        }
    }

    // websocket 메세지 수신 및 송신
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 전달받은 메세지
        String msg = message.getPayload();

        // Json객체 → Java객체
        // 출력값 : [roomId=123, messageId=null, message=asd, name=천동민, email=cheon@gmail.com, unReadCount=0]
        Chat chat = new ObjectMapper().readValue(msg,Chat.class);
        System.out.println("chat = " + chat);
        Chatroom chatroom = chatService.selectChatroom(chat.getChatroomNo());
        System.out.println("chatroom = " + chatroom);

        // 채팅방 세션 목록에 채팅방 x, 처음 들어옴, DB에 채팅방 있음 => 채팅방 생성
        if (roomList.get(chatroom.getChatroomNo()) == null && chat.getContent().equals("ENTER_CHAT") && chatroom != null){
            ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
            // session 추가
            sessionTwo.add(session);
            // sessionList에 추가
            sessionList.put(session, chatroom.getChatroomNo());
            // RoomList에 추가
            roomList.put(chatroom.getChatroomNo(), sessionTwo);
            System.out.println("sessionTwo = " + sessionList);
            System.out.println("roomList = " + roomList);
            System.out.println("채팅방 생성");
        }
        // 채팅방 세션 목록에 채팅방 o, 처음 들어옴, DB에 채팅방 있음
        else if (roomList.get(chatroom.getChatroomNo()) != null && chat.getContent().equals("ENTER_CHAT") && chatroom != null){
            // RoomList에서 해당 방번호를 가진 방이 있는지 확인.
            roomList.get(chatroom.getChatroomNo()).add(session);
            // sessionList에 추가
            sessionList.put(session, chatroom.getChatroomNo());
            System.out.println("채팅방 입장");
        }
        // 채팅 일시
        else {
//          String text = new Gson().toJson(chat);
            String text = chat.getChatNo()+","+chat.getContent()+","+chat.getSender()+","+chat.getType()+","+chat.getCreateAt()+","+chat.getChatroomNo();
//          System.out.println("text = " + text);
            TextMessage textMessage = new TextMessage(text);
            System.out.println("textMessage = " + textMessage);
            System.out.println("roomList = " + roomList);
            for (WebSocketSession sess : roomList.get(chat.getChatroomNo())){
                sess.sendMessage(textMessage);
            }
            int result = chatService.insertChat(chat);
            if(result > 0) {
                System.out.println("성공");
            } else {
                System.out.println("실패");
            }
        }



    }

}
