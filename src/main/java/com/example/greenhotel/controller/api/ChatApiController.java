package com.example.greenhotel.controller.api;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.greenhotel.config.auth.PrincipalDetail;
import com.example.greenhotel.dto.ResponseDto;
import com.example.greenhotel.model.User;
import com.example.greenhotel.service.ChatService;

import lombok.RequiredArgsConstructor;


@RestController
@RequiredArgsConstructor
public class ChatApiController {

    private final ChatService chatService;

    @PostMapping("/readck/{id}")
    public ResponseDto<Integer> readck(@PathVariable int id,@AuthenticationPrincipal PrincipalDetail principalDetail) {
    	
		if(principalDetail.getUser().getRoleType().toString()=="USER") {
    		chatService.메세지읽음확인(id,principalDetail.getUser().getName());
    		chatService.유저접속(id);
    	}
    	
    	else {
    		chatService.메세지읽음확인(id,"상담사");
    		chatService.매니저접속(id);
    	}
    	
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }
    
    @DeleteMapping("/deleteChat/{id}")
    public ResponseDto<Integer> deleteChat(@PathVariable User id) {
    	
        chatService.채팅방삭제(id);
   
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }
    
    @PostMapping("/plusCount/{id}")
    public int plusCnt(@PathVariable int id) {
    	return chatService.방인원증가(id);
    }
    @PostMapping("/minusCount/{id}")
    public int minusCnt(@PathVariable int id) {
    	return chatService.방인원감소(id);
    }
    

}
