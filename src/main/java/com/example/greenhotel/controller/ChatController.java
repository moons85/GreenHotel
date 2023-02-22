package com.example.greenhotel.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.WebSocketSession;

import com.example.greenhotel.dto.ChatMessage;
import com.example.greenhotel.model.Chat;
import com.example.greenhotel.model.ChatRoom;
import com.example.greenhotel.service.ChatService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class ChatController {

    private final ChatService chatService;
    private final Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();

    @MessageMapping("/{roomId}") //여기로 전송되면 메서드 호출 -> WebSocketConfig prefixes 에서 적용한건 앞에 생략
    @SendTo("/room/{roomId}")   //구독하고 있는 장소로 메시지 전송 (목적지)  -> WebSocketConfig Broker 에서 적용한건 앞에 붙어줘야됨
    public ChatMessage test(@DestinationVariable int roomId, ChatMessage message,@Header("simpSessionId") String sessionId) {
    	System.out.println("챗컨트롤러");
        //채팅 저장
        Chat chat = chatService.createChat(roomId, message.getSender(), message.getMessage());
        return ChatMessage.builder()
                .chat(roomId)
                .sender(chat.getSender())
                .message(chat.getMessage())
                .build();
    }

}
