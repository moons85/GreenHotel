package com.example.greenhotel.repository;

import com.example.greenhotel.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoomRepository extends JpaRepository<Room, Integer> {

	Room findByRoomname(Room room);
}
