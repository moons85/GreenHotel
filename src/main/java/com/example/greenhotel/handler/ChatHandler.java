package com.example.greenhotel.handler;





import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class ChatHandler extends TextWebSocketHandler {
    private List<WebSocketSession> sessionList;

    private ChatHandler() {
        sessionList = new ArrayList<>();
    }



    // message
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

        System.out.println(session);

    }

    // connection established
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println(session);


    }

    // connection closed
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println(session);

    }

}