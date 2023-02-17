package com.example.greenhotel.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.greenhotel.model.Room;
import com.example.greenhotel.service.ReservationService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReservationController {
    private final ReservationService reservationService;

    @GetMapping("/booklist/{startDate}/{endDate}/{adult}/{kid}")
    public String roomselect(Model model,@PathVariable String startDate, @PathVariable String endDate, @PathVariable int adult,@PathVariable int kid) {
        int people = kid + adult;
        System.out.println("startDate : "+startDate.toString());
        List<Room> roomlist = reservationService.방목록(startDate, endDate, people);
        model.addAttribute("room",roomlist);
        model.addAttribute("startDate",startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("adult", adult);
        model.addAttribute("kid", kid);
        return "/booklist";
    }

    @GetMapping("/reservationform/{startDate}/{endDate}/{adult}/{kid}/{id}")
    public String reserve(Model model, @PathVariable String startDate, @PathVariable String endDate, @PathVariable int adult,@PathVariable int kid,@PathVariable int id) {
        Room room = reservationService.방이름(id);
        model.addAttribute("room",room);
        model.addAttribute("startDate",startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("adult", adult);
        model.addAttribute("kid", kid);

        return "/reservationform";
    }


}