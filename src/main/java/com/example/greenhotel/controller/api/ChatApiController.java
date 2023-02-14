package com.example.greenhotel.controller.api;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.greenhotel.dto.ChatDto;
import com.example.greenhotel.dto.ResponseDto;
import com.example.greenhotel.model.Chat;
import com.example.greenhotel.model.ChatRoom;
import com.example.greenhotel.service.ChatService;

import lombok.RequiredArgsConstructor;


@RestController
@RequiredArgsConstructor
public class ChatApiController {

    private final ChatService chatService;

    @PostMapping("/readck/{id}")
    public ChatDto readck(@PathVariable ChatRoom id) {
        chatService.접속(1);
        chatService.메세지읽음확인(id.getId(),"상담사");
        List<Chat> chatList = chatService.findAllChatByRoomId(id);
        chatService.접속(id.getId());
        ChatDto chatDto =new ChatDto();
        chatDto.setChatId(id.getId());
        chatDto.setChatList(chatList);
        chatDto.setReceiver(id.getUser().getName());
        chatDto.setSender("상담사");
        return chatDto;
    }

    @PostMapping("/deleteChat/{id}")
    public ResponseDto<Integer> deleteChat(@PathVariable ChatRoom id) {;
        chatService.채팅방삭제(id.getId());

        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }


}