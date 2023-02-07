package com.example.greenhotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.greenhotel.model.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {

    @Query(value = "select SUM(price)\r\n"
            + "from reservation as res\r\n"
            + "where YEAR(EndDATE) =2023 and MONTH(ENDDATE) = ?;", nativeQuery = true)
    String sumPrice(@Param("MONTH")int num);

}
