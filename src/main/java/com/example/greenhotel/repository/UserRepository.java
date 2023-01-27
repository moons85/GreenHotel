package com.example.greenhotel.repository;

import com.example.greenhotel.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Integer> {
    //Optional<User> findByUsername(String username);
    Optional<User> findByUsername(String username);
}
