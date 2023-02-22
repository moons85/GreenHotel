package com.example.greenhotel.service;

import java.io.File;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.greenhotel.dto.uploadDto;
import com.example.greenhotel.model.Review;
import com.example.greenhotel.model.Room;
import com.example.greenhotel.repository.ReviewRepository;
import com.example.greenhotel.repository.RoomRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewService {
	@Autowired
	ReviewRepository reviewRepository;
	@Autowired
	RoomRepository roomRepository;
	
	public Page<Review> 리뷰목록(Pageable pageable){
		return reviewRepository.findAll(pageable);
	}
	 @Transactional
	    public boolean 리뷰등록(uploadDto uploadDto) {
		 
		 String osName = System.getProperty("os.name");
	        String userName = System.getProperty("user.name");
	        String uploadPath = "";
	        if (osName.contains("Mac")) {
	            uploadPath = Paths.get("/Users", userName, "Pictures", "roomImg").toString();
	        } else if (osName.contains("Windows")) {
	            uploadPath = Paths.get("C:/Users", userName, "Pictures", "roomImg").toString();
	        } else {
	            return false;
	        }
	        File dir = new File(uploadPath);
	        dir.mkdirs();
	        
	        MultipartFile file1 = uploadDto.getPhoto();
	        String ImageName1;
	        UUID uuid = UUID.randomUUID();
	        ImageName1 = uuid + "_" + file1.getOriginalFilename();
	        try {
	            File target = new File(uploadPath, ImageName1);
	            file1.transferTo(target);
	        } catch (Exception e) {
	            return false;
	        }
	        Room roomId= roomRepository.findByRoomname(uploadDto.getRoom());
	        Review review = uploadDto.review(uploadDto.getTitle(), uploadDto.getContent(), uploadDto.getUser(), roomId);
	        review.setPhoto(ImageName1);
	        System.out.println(review);
	        
	        
	        reviewRepository.save(review);
	        return true;
	        
	        
	        
	        
	        
	 }
}
