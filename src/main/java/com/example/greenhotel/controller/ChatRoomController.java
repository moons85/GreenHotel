package com.example.greenhotel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.socket.WebSocketSession;

import com.example.greenhotel.config.auth.PrincipalDetail;
import com.example.greenhotel.model.Chat;
import com.example.greenhotel.model.ChatRoom;
import com.example.greenhotel.model.User;
import com.example.greenhotel.service.ChatService;
import com.example.greenhotel.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChatRoomController {

    private final ChatService chatService;
    private final UserService userService;
    private final Map<String, WebSocketSession> userSessionsMap;
    /**
     * 채팅방 참여하기
     * @param roomId 채팅방 id
     */
    @GetMapping("chat/{id}")
    public String joinRoom(@PathVariable ChatRoom id,Model model,@AuthenticationPrincipal PrincipalDetail principal) {
        List<Chat> chatList = chatService.findAllChatByRoomId(id);
        if(principal.getUser().getId() == 1 || principal.getUser().getId() == id.getUser().getId()) {
        	if(principal.getUser().getRoleType().toString() =="USER") {
        		
           	 chatService.유저접속(id.getId());
           	 model.addAttribute("roomId", id.getId());
                model.addAttribute("chatList", chatList);
                model.addAttribute("sender",principal.getUser().getName());
                model.addAttribute("receiver","상담사");
                model.addAttribute("userid",principal.getUser().getId());
                return "thymeleaf/room";
           }
           else {
           	chatService.매니저접속(id.getId());
           	User user = userService.회원찾기2(id.getUser().getId());
           	 model.addAttribute("roomId", id.getId());
                model.addAttribute("chatList", chatList);
                model.addAttribute("sender", "상담사");
                model.addAttribute("receiver", user.getName());
                model.addAttribute("userid",principal.getUser().getId());
                return "thymeleaf/room";
           }
        	
        }
        return "/index";
        
        
        
       
    }
    
    /**
     * 채팅방 등록
     * @param form
     */
    @PostMapping("/room")
    public String createRoom(@AuthenticationPrincipal PrincipalDetail principal) {
        chatService.방만들기(principal.getUser().getId());
        return "redirect:/roomList";
    }

    /**
     * 채팅방
     */
    @GetMapping("admin/roomList")
    public String roomList(Model model,@AuthenticationPrincipal PrincipalDetail principal) {
    	
           
        
    	
        List<ChatRoom> roomList = chatService.모든채팅방();

        for (ChatRoom e : roomList) {
        	chatService.안읽은메세지수(e.getId());
        	chatService.마지막메세지(e.getId());
        	
        }
        model.addAttribute("roomList", roomList);
       
        return "thymeleaf/roomList";
    }

    /**
     * 방만들기 폼
     */
    @GetMapping("/roomForm")
    public String roomForm(Model model,@AuthenticationPrincipal PrincipalDetail principal) {
    	model.addAttribute("user",principal.getUser());
    	
        return "thymeleaf/roomForm";
    }

}
