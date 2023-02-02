package com.example.greenhotel.repository;

import com.example.greenhotel.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByUsername(String username);

    @Query(value = "select username from User where email = ?1 and phonenumber = ?2", nativeQuery = true)
    String find_id(@Param("email") String email, @Param("phonenumber") String phonenumber);

    @Query(value = "select email from User where email = ?1", nativeQuery = true)
    String find_pwd(@Param("email") String email);

    @Query(value = "select username from User where email = ?1", nativeQuery = true)
    String findByMemberEmail(@Param("email") String email);


    
    @Modifying
    @Query(value = "update User set password=?2 where username = ?1",nativeQuery = true)
    void updatePassword(@Param("username") String username, @Param("password") String password);

}




