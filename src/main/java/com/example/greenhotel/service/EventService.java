package com.example.greenhotel.service;

import com.example.greenhotel.model.Event;
import com.example.greenhotel.model.Faq;
import com.example.greenhotel.repository.EventRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class EventService {

    private final EventRepository eventRepository;

    public Page<Event> 쿠폰목록(Pageable pageable){
        return eventRepository.findAll(pageable);
    }
}
