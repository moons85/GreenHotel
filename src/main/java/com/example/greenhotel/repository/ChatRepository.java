package com.example.greenhotel.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.greenhotel.model.Chat;
import com.example.greenhotel.model.ChatRoom;



public interface ChatRepository extends JpaRepository<Chat, Integer> {

    List<Chat> findAllByRoomOrderBySendDate(ChatRoom id);
    
    @Query(value = "select count(*) from chat , chatRoom where chat.roomid=chatRoom.id and sendDate between  chatRoom.ReadDate and sysdate() and roomid=?; ", nativeQuery = true)
    int countByRoomId(int roomid);
    
    
//    Chat[] findAllBySender(@Param("SENDER") String sender);
    
    Optional<Chat> findByRoom(int id);
    @Query(value = "select message from chat where roomid=? order by id DESC LIMIT 1; ", nativeQuery = true)
    String findByIdOrderByIdDescLimit1(int roomid);
    
    @Query(value = "select * from chat where roomid=? and sender !=? and readck=0; ", nativeQuery = true)
    List<Chat> 읽음확인(int roomid, String sender);
}
