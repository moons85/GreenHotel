package com.example.greenhotel.controller.api;

import com.example.greenhotel.dto.FaqReplyuploadDto;
import com.example.greenhotel.dto.ResponseDto;
import com.example.greenhotel.model.FaqReply;
import com.example.greenhotel.service.FaqReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
public class FaqReplyApiController {
    @Autowired
    private FaqReplyService faqReplyService;

    @Autowired
    public FaqReplyApiController(FaqReplyService faqReplyService) {
        this.faqReplyService = faqReplyService;
    }

    @PostMapping("/auth/faqreply")
    public ResponseDto<Integer> save(@RequestBody FaqReplyuploadDto replyuploadDto) {
        try {
            faqReplyService.댓글작성(replyuploadDto);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return new ResponseDto<>(HttpStatus.OK.value(),1);
    }

    @DeleteMapping("/auth/faqreply/{id}")
    public ResponseDto<Integer> deleteById(@PathVariable int id){
        faqReplyService.댓글삭제(id);
        return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
    }



}
