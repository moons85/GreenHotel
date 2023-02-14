package com.example.greenhotel.controller.api;

import com.example.greenhotel.config.auth.PrincipalDetail;
import com.example.greenhotel.dto.ResponseDto;
import com.example.greenhotel.model.Faq;
import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.FaqRepository;
import com.example.greenhotel.service.FaqService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class FaqApiController {

    private final FaqService faqService;
    private final FaqRepository faqRepository;

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

//    @PostMapping("/auth/find_faq")
//    @ResponseBody
//    public List<Faq> find_faq(@RequestParam("s_category") String s_category,@RequestParam("s_data") String s_data){
//        List<Faq> faq = faqService.글검색(s_category,s_data);
//        return faq;
//    }

}
