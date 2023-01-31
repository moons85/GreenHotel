package com.example.greenhotel.controller.api;

import com.example.greenhotel.config.auth.PrincipalDetail;
import com.example.greenhotel.dto.ResponseDto;
import com.example.greenhotel.model.Faq;
import com.example.greenhotel.model.User;
import com.example.greenhotel.service.FaqService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
public class FaqApiController {

    private final FaqService faqService;
    @PostMapping("/api/qna")
    public ResponseDto<Integer> qna(@RequestBody Faq faq,@AuthenticationPrincipal PrincipalDetail principalDetail){
        faqService.문의(faq,principalDetail.getUser());
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }

    @DeleteMapping("/api/qna/{id}")
    public ResponseDto<Integer> deleteById(@PathVariable int id){
        faqService.글삭제(id);
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }

}
