package com.example.greenhotel.dto;

import java.util.List;

import com.example.greenhotel.model.Room;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoomDto {
    private List<Room> roomlist;
}
