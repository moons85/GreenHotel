package com.example.greenhotel.service;

import com.example.greenhotel.dto.FaqReplyuploadDto;
import com.example.greenhotel.model.Faq;
import com.example.greenhotel.model.FaqReply;
import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.FaqReplyRepository;
import com.example.greenhotel.repository.FaqRepository;
import com.example.greenhotel.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class FaqReplyService {

    private final FaqReplyRepository faqReplyRepository;

    private final FaqRepository faqRepository;

    private final UserRepository userRepository;


    @Transactional(readOnly=true)
    public List<FaqReply> 댓글목록(){
        return faqReplyRepository.findAll();
    }

    @Transactional
    public void 댓글작성(FaqReplyuploadDto replyuploadDto) throws IllegalAccessException {
        Faq faq = faqRepository.findById(replyuploadDto.getFaqId())
                .orElseThrow(()->new IllegalAccessException("1번 오류"));
        User user = userRepository.findById(replyuploadDto.getUserId())
                .orElseThrow(()->new IllegalAccessException("2번 오류"));

        FaqReply reply = FaqReply.builder()
                .faq(faq)
                .user(user)
                .content(replyuploadDto.getContent())
                .build();

        faqReplyRepository.save(reply);
    }

    @Transactional
    public void 댓글삭제(int id) {
        faqReplyRepository.deleteById(id);
    };

}
