package com.example.greenhotel.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.greenhotel.model.Room;

public interface ReservationRepository extends JpaRepository<Room, Integer> {
    @Query(value = "SELECT * FROM ROOM "
            + " WHERE roomname NOT IN  (SELECT roomname FROM reservation WHERE startDate<?2 OR endDate>?1) "
            + " and maxpeople>=?3", nativeQuery = true)
    List<Room> room(Timestamp startDate, Timestamp endDate, int maxpeople);

    @Query(value = "select SUM(price)\r\n"
            + "from reservation as res\r\n"
            + "where YEAR(EndDATE) =2023 and MONTH(ENDDATE) = ?;", nativeQuery = true)
    String sumPrice(@Param("MONTH")int num);





}
