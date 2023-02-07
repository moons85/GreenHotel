package com.example.greenhotel.repository;

import com.example.greenhotel.model.Faq;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FaqRepository extends JpaRepository<Faq, Integer> {
    @Query(value = "select * from faq where ?1 like '%?2%'", nativeQuery = true)
    List<Faq> findfaq(@Param("s_category") String s_category, @Param("s_data") String s_data);
}
