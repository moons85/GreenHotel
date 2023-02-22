package com.example.greenhotel.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.greenhotel.model.Chat;
import com.example.greenhotel.model.ChatRoom;
import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.ChatRepository;
import com.example.greenhotel.repository.ChatRoomRepository;
import com.example.greenhotel.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatService {
	@Autowired
    private ChatRepository chatRepository;
	@Autowired
	private ChatRoomRepository chatRoomRepository;
    @Autowired
    private UserRepository userRepository;
    /**
     * 모든 채팅방 찾기
     */

    public List<ChatRoom> 모든채팅방() {
        return chatRoomRepository.findAll();
    }

    /**
     * 특정 채팅방 찾기
     * @param id room_id
     */
    @Transactional
    public Optional<User> 채팅방찾기(int id) {
        return userRepository.findById(id);
    }
    /**
     * 채팅방 만들기
     * @param name 방 이름
     */
    @Transactional
    public void 방만들기(int id) {
    	
    	User user = userRepository.findById(id).orElseThrow();
    	if(chatRoomRepository.existsByUserId(id)) {
    		return;
    	}
    	else {
    		ChatRoom room=new ChatRoom();
        	room.setUser(user);
        	chatRoomRepository.save(room);
    	}
    	

    }
    @Transactional
    public void 채팅방삭제(User id) {
    
    	chatRoomRepository.deleteByUserId(id.getId());
    	
    	
    	
    	
    	
    	
    }
    @Transactional
    public void 안읽은메세지수(int id) {
    	ChatRoom chatRoom =chatRoomRepository.findById(id).orElseThrow();
    	int chat=chatRepository.countByRoomId(id);
    	System.out.println("안읽은메세지수"+chat);
    	chatRoom.setMsgCount(chat);
    	
    	
    	
    }
    @Transactional
    public void 메세지읽음확인(int id,String sender) {

    	List<Chat> chat=chatRepository.읽음확인(id,sender);

    	for (Chat e : chat) {
    		e.setReadck(1);

    	}
    }
    @Transactional
    public void 매니저접속(int id) {
    	System.out.println(id);
    	ChatRoom chatRoom =chatRoomRepository.findById(id).orElseThrow();
    	LocalDateTime currentDate = LocalDateTime.now();

    	chatRoom.setReadDate(currentDate);

    	
    	
    	
    }
    @Transactional
    public void 유저접속(int id) {
    	ChatRoom chatRoom =chatRoomRepository.findById(id).orElseThrow();
    	LocalDateTime currentDate = LocalDateTime.now();
    	
    	chatRoom.setReadDate2(currentDate);
    	
    	
    	
    	
    }
    @Transactional
    public void 마지막메세지(int id) {
    	ChatRoom chatRoom =chatRoomRepository.findById(id).orElseThrow();
    	String chat = chatRepository.findByIdOrderByIdDescLimit1(id);
    	chatRoom.setMsg(chat);
    	
    	
    }
    @Transactional
    public int 방인원증가(int id) {
    	ChatRoom chatRoom =chatRoomRepository.findById(id).orElseThrow();
    
    	
    	chatRoom.setUserCount(chatRoom.getUserCount()+1);
    	return chatRoom.getUserCount();
    }
    @Transactional
    public int 방인원감소(int id) {
    	ChatRoom chatRoom =chatRoomRepository.findById(id).orElseThrow();
    	
    	chatRoom.setUserCount(chatRoom.getUserCount()-1);
    	return chatRoom.getUserCount();
    }

    /////////////////
    
    /**
     * 채팅 생성
     * @param roomId 채팅방 id
     * @param sender 보낸이
     * @param message 내용
     */
    @Transactional
    public Chat createChat(int roomId, String sender, String message) {
        ChatRoom chat = chatRoomRepository.findById(roomId).orElseThrow();  //방 찾기 -> 없는 방일 경우 여기서 예외처리
        return chatRepository.save(Chat.createChat(chat, sender, message));
    }

    /**
     * 채팅방 채팅내용 불러오기
     * @param roomId 채팅방 id
     */
    @Transactional
    public List<Chat> findAllChatByRoomId(ChatRoom roomId) {
    	System.out.println("asdfasedfasefasef"+chatRepository.findAllByRoomOrderBySendDate(roomId));
        return chatRepository.findAllByRoomOrderBySendDate(roomId);
    }


}
