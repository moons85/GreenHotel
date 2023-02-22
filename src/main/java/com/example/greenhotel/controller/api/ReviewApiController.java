package com.example.greenhotel.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.greenhotel.dto.uploadDto;
import com.example.greenhotel.service.ReviewService;

@RestController
public class ReviewApiController {
	
	@Autowired
	ReviewService reviewService;
	
	  @PostMapping("/save/review")
		public ResponseEntity<String> Upload(uploadDto boardUploadDto){
		    reviewService.리뷰등록(boardUploadDto);
		    return ResponseEntity.ok().body("리뷰가 등록되었습니다.");
		}

	
}
	