package com.example.greenhotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.greenhotel.model.User;

public interface IdRepository extends JpaRepository<User, Long>{
	int countByUsername(String username);

}