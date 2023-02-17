package com.example.greenhotel.controller.api;

import java.util.List;

import com.example.greenhotel.config.auth.PrincipalDetail;
import com.example.greenhotel.dto.ResponseDto;
import com.example.greenhotel.model.Faq;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.greenhotel.dto.RoomDto;
import com.example.greenhotel.model.Reservation;
import com.example.greenhotel.model.Room;
import com.example.greenhotel.service.ReservationService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@RestController
public class ReservationApiController {
    private final ReservationService reservationService;

    @PostMapping("/booklist/{startDate}/{endDate}/{adult}/{kid}")
    public RoomDto select(Model model, @PathVariable String startDate, @PathVariable String endDate, @PathVariable int adult,@PathVariable int kid) {
        int people = kid + adult;
        List<Room> roomlist = reservationService.방목록(startDate, endDate, people);
        RoomDto room = new RoomDto();
        System.out.println(roomlist);
        room.setRoomlist(roomlist);
        System.out.println(room.getRoomlist());
        return room;

    }

    @PostMapping("/reservation")
    public ResponseDto<Integer> qna(@RequestBody Reservation reservation, @AuthenticationPrincipal PrincipalDetail principalDetail){
        reservationService.예약(reservation,principalDetail.getUser());
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }

}
