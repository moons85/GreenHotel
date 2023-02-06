package com.example.greenhotel.controller;

import com.example.greenhotel.model.Room;
import com.example.greenhotel.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class RoomController {

    @Autowired
    private RoomService roomService;

    @GetMapping("/auth/room")
    public String room(Model model,@PageableDefault Pageable pageable) {
        model.addAttribute("rooms", roomService.방목록(pageable));
        return "/room";
    }

    @GetMapping("/auth/roomdetail/{id}")
    public String room(@PathVariable int id, Model model) {
        model.addAttribute("rd", roomService.상세보기(id));
        return "/roomdetail";
    }



}
