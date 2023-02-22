package com.example.greenhotel.repository;

import com.example.greenhotel.model.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationsRepository extends JpaRepository<Reservation, Integer> {
}
