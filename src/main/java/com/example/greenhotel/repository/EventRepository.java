package com.example.greenhotel.repository;

import com.example.greenhotel.model.Event;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository<Event, Integer> {
}
