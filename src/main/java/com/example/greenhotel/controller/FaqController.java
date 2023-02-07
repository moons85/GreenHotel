package com.example.greenhotel.controller;

import com.example.greenhotel.model.Faq;
import com.example.greenhotel.service.FaqReplyService;
import com.example.greenhotel.service.FaqService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FaqController {
    @Autowired
    private FaqService faqService;

    @Autowired
    private FaqReplyService faqReplyService;
    
//    @GetMapping("/auth/qnaForm")
//    public String qnaForm(Model model){
//        model.addAttribute("faqs", faqService.글목록());
//        return "/qnaForm";
//    }
    @GetMapping("/auth/qnaForm")
    public String qnaForm(Model model, @PageableDefault(size = 3, sort = "id", direction = Sort.Direction.DESC)Pageable pageable){
        model.addAttribute("faqs", faqService.글목록(pageable));
        return "/qnaForm";
    }

    @GetMapping("/auth/searchqnaform/{title}/{content}")
    public String searchqnaForm(Model model,@PathVariable String title,@PathVariable String content,@PageableDefault(size = 3, sort = "id", direction = Sort.Direction.DESC)Pageable pageable){

        Page<Faq> faqs=faqService.글검색(title,content,pageable);
        System.out.println(faqs);
        model.addAttribute("faqs", faqs );


        return "/searchqnaform";
    }

    @GetMapping("/auth/qnadetail/{id}")
    public String findById(@PathVariable int id, Model model,@PageableDefault Pageable pageable){
        model.addAttribute("faq",faqService.상세보기(id));
//        System.out.println(faqReplyService.댓글목록(id).getClass().getName());
        model.addAttribute("faqreplys", faqReplyService.댓글목록());
        return "/qnaDetail";
    }
}
