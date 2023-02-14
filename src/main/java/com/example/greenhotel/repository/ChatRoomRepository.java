package com.example.greenhotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.greenhotel.model.ChatRoom;

import net.bytebuddy.dynamic.DynamicType.Builder.FieldDefinition.Optional;

public interface ChatRoomRepository extends JpaRepository<ChatRoom, Integer> {



    Optional<ChatRoom>findByUserId(int id);

    boolean existsByUserId(int id);




}