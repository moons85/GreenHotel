package com.example.greenhotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.greenhotel.service.ReservationService;
import com.example.greenhotel.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	@Autowired
	ReservationService reservationService;
	
	@GetMapping("/auth/review")
	public String 리뷰페이지(Model model, @PageableDefault(size = 6, sort = "id", direction = Sort.Direction.DESC)Pageable pageable) {
		model.addAttribute("review",reviewService.리뷰목록(pageable));
		return "/blog";
	}
	@GetMapping("/reviewForm")
	public String 리뷰작성페이지(Model model) {
		model.addAttribute("room",reservationService.예약리스트());
		return "/reviewForm";
	}
}
