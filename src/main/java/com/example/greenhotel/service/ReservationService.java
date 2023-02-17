package com.example.greenhotel.service;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.example.greenhotel.model.*;
import com.example.greenhotel.repository.ReservationsRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.greenhotel.repository.ReservationRepository;
import com.example.greenhotel.repository.RoomRepository;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class ReservationService {
    private final ReservationRepository reservationRepository;

    private final ReservationsRepository reservationsRepository;
    private final RoomRepository roomRepository;

    @Transactional
    public List<Room> 방목록(String startDate, String endDate, int maxpeople) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate sdate = LocalDate.parse(startDate, formatter);
        LocalDate edate = LocalDate.parse(endDate, formatter);
        Timestamp sdat = Timestamp.valueOf(sdate.atStartOfDay());
        Timestamp edat = Timestamp.valueOf(edate.atStartOfDay());
        return reservationRepository.room(sdat, edat, maxpeople);
    }
    @Transactional
    public Room 방이름(int id) {
        return roomRepository.findById(id).orElseThrow();
    }

    @Transactional
    public void 예약(Reservation reservation, User user){
        reservation.setUser(user);
        reservationsRepository.save(reservation);
    }

    public Page<Reservation> 예약목록(Pageable pageable){
        return reservationsRepository.findAll(pageable);
    }



}
