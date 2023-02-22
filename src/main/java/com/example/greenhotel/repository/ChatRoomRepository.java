package com.example.greenhotel.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.greenhotel.model.ChatRoom;



public interface ChatRoomRepository extends JpaRepository<ChatRoom, Integer> {

    
    
    Optional<ChatRoom> findByUserId(int id);
    void deleteByUserId(int id);
	boolean existsByUserId(int id);
	
	
    
    
}
