package com.example.greenhotel.repository;

import com.example.greenhotel.model.Faq;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FaqRepository extends JpaRepository<Faq, Integer> {
	Page<Faq> findByTitleContaining(String keyword,Pageable pageable);
	Page<Faq> findByCategoryContaining(String keyword,Pageable pageable);
	Page<Faq> findByContentContaining(String keyword,Pageable pageable);
}
