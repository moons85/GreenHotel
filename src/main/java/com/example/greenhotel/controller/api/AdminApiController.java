package com.example.greenhotel.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.greenhotel.dto.uploadDto;
import com.example.greenhotel.service.AdminService;

@RestController
public class AdminApiController {

    @Autowired
    private  AdminService adminService;

    @PostMapping("/resRoom")
    public ResponseEntity<String> Upload(uploadDto boardUploadDto){
        adminService.방등록(boardUploadDto);
        return ResponseEntity.ok().body("방등록이 완료되었습니다.");
    }
    @PostMapping("/updateRoom/{id}")
    public ResponseEntity<String> Update(uploadDto boardUploadDto,@PathVariable int id){
        adminService.방수정(boardUploadDto,id);

        return ResponseEntity.ok().body("방등록이 완료되었습니다.");
    }

}
