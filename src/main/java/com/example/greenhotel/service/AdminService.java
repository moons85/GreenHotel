//package com.example.greenhotel.service;
//
//import java.io.File;
//import java.nio.file.Paths;
//import java.util.UUID;
//
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.example.greenhotel.dto.uploadDto;
//import com.example.greenhotel.model.Room;
//import com.example.greenhotel.model.User;
//import com.example.greenhotel.repository.RoomRepository;
//
//import lombok.RequiredArgsConstructor;
//
//@RequiredArgsConstructor
//@Service
//public class AdminService {
//    private final RoomRepository roomRepository;
//    @Transactional
//    public boolean 방등록(uploadDto roomuploadDto) {
//        // 유저정보 가져오기
//        String osName = System.getProperty("os.name");
//        String userName = System.getProperty("user.name");
//        String uploadPath = "";
//
//        // 파일경로 생성
//        if(osName.contains("Mac")) {
//            uploadPath = Paths.get("/Users",userName, "Pictures", "roomImg").toString();
//        } else if (osName.contains("Windows")) {
//            uploadPath = Paths.get("C:/Users",userName, "Pictures", "roomImg").toString();
//        } else {
//            return false;
//        }
//        File dir = new File(uploadPath);
//        dir.mkdirs();
//
//        MultipartFile file1 = roomuploadDto.getRoommainimg();
//        MultipartFile file2 = roomuploadDto.getRoomimg1();
//        MultipartFile file3 = roomuploadDto.getRoomimg2();
//        MultipartFile file4 = roomuploadDto.getRoomimg3();
//
//        UUID uuid = UUID.randomUUID();
//        String ImageName1;
//        String ImageName2;
//        String ImageName3;
//        String ImageName4;
//        ImageName1= uuid + "_" + file1.getOriginalFilename();
//        uuid = UUID.randomUUID();
//        ImageName2= uuid + "_" + file2.getOriginalFilename();
//        uuid = UUID.randomUUID();
//        ImageName3= uuid + "_" + file3.getOriginalFilename();
//        uuid = UUID.randomUUID();
//        ImageName4= uuid + "_" + file4.getOriginalFilename();
//
//
//        try { File target = new File(uploadPath, ImageName1);
//            file1.transferTo(target);
//        } catch(Exception e) {
//            return false; }
//        try { File target = new File(uploadPath, ImageName2);
//            file2.transferTo(target);
//        } catch(Exception e) {
//            return false; }
//        try { File target = new File(uploadPath, ImageName3);
//            file3.transferTo(target);
//        } catch(Exception e) {
//            return false; }
//        try { File target = new File(uploadPath, ImageName4);
//            file4.transferTo(target);
//        } catch(Exception e) {
//            return false; }
//
//        Room room = roomuploadDto.toEntity(roomuploadDto.getBed(),
//                roomuploadDto.getMaxpeople(), roomuploadDto.getRoomcontent(),roomuploadDto.getRoomname(),roomuploadDto.getSize(),roomuploadDto.getView(),roomuploadDto.getPrice());
//        room.setRoommainimg(ImageName1);
//        room.setRoomimg1(ImageName2);
//        room.setRoomimg2(ImageName3);
//        room.setRoomimg3(ImageName4);
//        roomRepository.save(room);
//
//        return true;
//    }
//}
package com.example.greenhotel.service;

import java.io.File;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;

import com.example.greenhotel.dto.uploadDto;
import com.example.greenhotel.model.Room;
import com.example.greenhotel.repository.ReservationRepository;
import com.example.greenhotel.repository.RoomRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminService {
    private final RoomRepository roomRepository;
    private final ReservationRepository reservationRepository;

    @Transactional
    public boolean 방등록(uploadDto roomuploadDto) {
        // 유저정보 가져오기
        String osName = System.getProperty("os.name");
        String userName = System.getProperty("user.name");
        String uploadPath = "";

        // 파일경로 생성
        if (osName.contains("Mac")) {
            uploadPath = Paths.get("/Users", userName, "Pictures", "roomImg").toString();
        } else if (osName.contains("Windows")) {
            uploadPath = Paths.get("C:/Users", userName, "Pictures", "roomImg").toString();
        } else {
            return false;
        }
        File dir = new File(uploadPath);
        dir.mkdirs();

        MultipartFile file1 = roomuploadDto.getRoommainimg();
        MultipartFile file2 = roomuploadDto.getRoomimg1();
        MultipartFile file3 = roomuploadDto.getRoomimg2();
        MultipartFile file4 = roomuploadDto.getRoomimg3();

        UUID uuid = UUID.randomUUID();
        String ImageName1;
        String ImageName2;
        String ImageName3;
        String ImageName4;
        ImageName1 = uuid + "_" + file1.getOriginalFilename();
        uuid = UUID.randomUUID();
        ImageName2 = uuid + "_" + file2.getOriginalFilename();
        uuid = UUID.randomUUID();
        ImageName3 = uuid + "_" + file3.getOriginalFilename();
        uuid = UUID.randomUUID();
        ImageName4 = uuid + "_" + file4.getOriginalFilename();

        try {
            File target = new File(uploadPath, ImageName1);
            file1.transferTo(target);
        } catch (Exception e) {
            return false;
        }
        try {
            File target = new File(uploadPath, ImageName2);
            file2.transferTo(target);
        } catch (Exception e) {
            return false;
        }
        try {
            File target = new File(uploadPath, ImageName3);
            file3.transferTo(target);
        } catch (Exception e) {
            return false;
        }
        try {
            File target = new File(uploadPath, ImageName4);
            file4.transferTo(target);
        } catch (Exception e) {
            return false;
        }

        Room room = roomuploadDto.toEntity(roomuploadDto.getRoomname(),roomuploadDto.getRoomcontent(),roomuploadDto.getMaxpeople(),roomuploadDto.getSize(),roomuploadDto.getView(),roomuploadDto.getBed(),roomuploadDto.getPrice());
        room.setRoommainimg(ImageName1);
        room.setRoomimg1(ImageName2);
        room.setRoomimg2(ImageName3);
        room.setRoomimg3(ImageName4);
        roomRepository.save(room);

        return true;
    }

    public String 매출(int num) {
        return reservationRepository.sumPrice(num);
    }

    @Transactional
    public boolean 방수정(uploadDto roomuploadDto, int id) {
        // 유저정보 가져오기
        String osName = System.getProperty("os.name");
        String userName = System.getProperty("user.name");
        String uploadPath = "";

        // 파일경로 생성
        if (osName.contains("Mac")) {
            uploadPath = Paths.get("/Users", userName, "Pictures", "roomImg").toString();
        } else if (osName.contains("Windows")) {
            uploadPath = Paths.get("C:/Users", userName, "Pictures", "roomImg").toString();
        } else {
            return false;
        }
        File dir = new File(uploadPath);
        dir.mkdirs();

        MultipartFile file1 = roomuploadDto.getRoommainimg();
        MultipartFile file2 = roomuploadDto.getRoomimg1();
        MultipartFile file3 = roomuploadDto.getRoomimg2();
        MultipartFile file4 = roomuploadDto.getRoomimg3();

        UUID uuid = UUID.randomUUID();
        String ImageName1;
        String ImageName2;
        String ImageName3;
        String ImageName4;
        ImageName1 = uuid + "_" + file1.getOriginalFilename();
        uuid = UUID.randomUUID();
        ImageName2 = uuid + "_" + file2.getOriginalFilename();
        uuid = UUID.randomUUID();
        ImageName3 = uuid + "_" + file3.getOriginalFilename();
        uuid = UUID.randomUUID();
        ImageName4 = uuid + "_" + file4.getOriginalFilename();

        try {
            File target = new File(uploadPath, ImageName1);
            file1.transferTo(target);
        } catch (Exception e) {
            return false;
        }
        try {
            File target = new File(uploadPath, ImageName2);
            file2.transferTo(target);
        } catch (Exception e) {
            return false;
        }
        try {
            File target = new File(uploadPath, ImageName3);
            file3.transferTo(target);
        } catch (Exception e) {
            return false;
        }
        try {
            File target = new File(uploadPath, ImageName4);
            file4.transferTo(target);
        } catch (Exception e) {
            return false;
        }
        Room room = roomRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("방 찾기 실패: 아이디를 찾을 수 없습니다.");
        });
        System.out.println("asdfasefasefasefasefasfeasefseaf"+roomuploadDto.getBed());
        room.setBed(roomuploadDto.getBed());
        room.setMaxpeople(roomuploadDto.getMaxpeople());
        room.setPrice(roomuploadDto.getPrice());
        room.setRoomcontent(roomuploadDto.getRoomcontent());
        room.setRoomname(roomuploadDto.getRoomname());
        room.setSize(roomuploadDto.getSize());
        room.setView(roomuploadDto.getView());
        room.setRoommainimg(ImageName1);
        room.setRoomimg1(ImageName2);
        room.setRoomimg2(ImageName3);
        room.setRoomimg3(ImageName4);
        return true;
    }

}

