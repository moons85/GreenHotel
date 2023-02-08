package com.example.greenhotel.dto;




import org.hibernate.annotations.Entity;
import org.springframework.web.multipart.MultipartFile;

import com.example.greenhotel.model.Room;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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

    public Room toEntity(String roomname, String roomcontent, String maxpeople, String size, String views, String bed, String price) {
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

}
