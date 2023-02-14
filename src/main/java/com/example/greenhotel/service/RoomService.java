package com.example.greenhotel.service;

import com.example.greenhotel.model.Room;
import com.example.greenhotel.repository.RoomRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class RoomService {
    private final RoomRepository roomRepository;

    public Page<Room> 방목록(Pageable pageable){
        return roomRepository.findAll(pageable);
    }

    public Room 상세보기(int id){
        return roomRepository.findById(id).orElseThrow(()->{
            System.out.println(id);
            return new IllegalArgumentException("상세보기 실패 아이디를 확인해주세요");
        });
    }
}
