package com.example.greenhotel.dto;




import org.hibernate.annotations.Entity;
import org.springframework.web.multipart.MultipartFile;

import com.example.greenhotel.model.Review;
import com.example.greenhotel.model.Room;
import com.example.greenhotel.model.User;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class uploadDto {
    private String roomname;
    private String roomcontent;
    private String maxpeople;
    private String size;
    private String view;
    private String bed;
    private String price;
    private MultipartFile roommainimg;
    private MultipartFile roomimg1;
    private MultipartFile roomimg2;
    private MultipartFile roomimg3;
    
    private String title;
    private String content;
    private MultipartFile photo;
    private User user;
    private Room room;
    
    public Room toEntity(String roomname, String roomcontent, String maxpeople, String size, String view, String bed, String price) {
        return Room.builder()
                .roomname(roomname)
                .roomcontent(roomcontent)
                .maxpeople(maxpeople)
                .size(size)
                .view(view)
                .bed(bed)
                .price(price)
                .build();
    }
    public Review review(String title,String content, User user, Room room) {
        return Review.builder()
        		.title(title)
        		.content(content)
                .user(user)
                .room(room)
                .build();
    }

}