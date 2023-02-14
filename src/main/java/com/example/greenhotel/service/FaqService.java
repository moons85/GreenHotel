package com.example.greenhotel.service;

import com.example.greenhotel.config.auth.PrincipalDetail;
import com.example.greenhotel.model.Faq;
import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.FaqRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
public class FaqService {
    private final FaqRepository faqRepository;

    @Transactional
    public void 문의(Faq faq,User user){
        faq.setUser(user);
        faqRepository.save(faq);
    }

    @Transactional
    public void 글삭제(int id){
        faqRepository.deleteById(id);
    }

    public Page<Faq> 글목록(Pageable pageable){
        return faqRepository.findAll(pageable);
    }

    public Page<Faq> 글검색(String title, String content, Pageable pageable) {
    	
    	if(title.equals("title")) {
    		return faqRepository.findByTitleContaining(content,pageable);
    	}
    	else if(title.equals("category")) {
    		return faqRepository.findByCategoryContaining(content,pageable);
    	}
    	else {
    		return faqRepository.findByContentContaining(content,pageable);
    	}
    	
        
    }

    public Faq 상세보기(int id){
        return faqRepository.findById(id).orElseThrow(()->{
            System.out.println(id);
            return new IllegalArgumentException("상세보기 실패 아이디를 확인해주세요");
        });
    }
}
