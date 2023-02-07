package com.example.greenhotel.repository;

import com.example.greenhotel.model.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
    @Query(value = "select CONCAT(YEAR(ENDDate), '-', MONTH(EndDate)) AS ym, SUM(price)\r\n"
            + "from reservation as res\r\n"
            + "where YEAR(EndDATE) =2023 and MONTH(ENDDATE) = ?\r\n"
            + "group by ym;", nativeQuery = true)
    String sumPrice(@Param("MONTH")int num);
}
