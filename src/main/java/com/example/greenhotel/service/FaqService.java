package com.example.greenhotel.service;

import com.example.greenhotel.config.auth.PrincipalDetail;
import com.example.greenhotel.model.Faq;
import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.FaqRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class FaqService {
    private final FaqRepository faqRepository;

    @Transactional
    public void 문의(Faq faq,User user){
        faq.setUser(user);
        faqRepository.save(faq);
    }
}
