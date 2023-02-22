package com.example.greenhotel.dto;


import java.util.List;

import com.example.greenhotel.model.Chat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatDto {

    private int chatId;
    private List<Chat> chatList;
    private String sender;
    private String receiver;

}