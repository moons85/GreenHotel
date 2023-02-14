package com.example.greenhotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.greenhotel.config.auth.PrincipalDetail;
import com.example.greenhotel.service.UserService;

@Controller
public class ReservationController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/reservation")
	public String reservationform(Model model,@AuthenticationPrincipal PrincipalDetail principalDetail) {
		model.addAttribute("user",userService.회원찾기2(principalDetail.getUser().getId()));
		return "/reservationform";
	}
	
	
}
