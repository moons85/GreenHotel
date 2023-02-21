package com.example.greenhotel.controller;

import com.example.greenhotel.model.Event;
import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.UserRepository;
import com.example.greenhotel.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    private final UserRepository userRepository;
    @Autowired
    private UserService userService;

    @Autowired
    private EventService eventService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private ReservationService reservationService;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping(value = {"", "/"})
    public String index(Model model,@PageableDefault Pageable pageable){
        model.addAttribute("rooms", roomService.방목록(pageable));
        return "/index";
    }
    @GetMapping("/auth/login")
    public String loginForm() {
        return "/login";
    }

    @GetMapping("/auth/signup")
    public String signup() {
        return "/signup";
    }

    @GetMapping("/auth/service")
    public String service(){ return "/service";}

    @GetMapping("/auth/about")
    public String about() {return "/about";}

    @GetMapping("/mypage/{id}")
    public String mypage(@PathVariable int id, Model model,@PageableDefault(size = 8, sort = "id", direction = Sort.Direction.DESC) Pageable pageable){
//        User user = userService.회원찾기2(id);
        model.addAttribute("user",userService.회원찾기2(id));
        model.addAttribute("coupons",eventService.쿠폰목록(pageable));
        model.addAttribute("res",reservationService.예약목록(pageable));
        return "/mypage";
    }



    @GetMapping("/updateUserForm")
    public String updateUserForm() {
        return "/updateUserForm";
    }

    @GetMapping("/auth/findId")
    public String findId() {return "/findId";}

    @GetMapping("/auth/newPassword")
    public String newPassword(){return "/newPassword";}

    @GetMapping("/admin")
    public String admin(Model model,@PageableDefault Pageable pageable) {
        model.addAttribute("rooms", roomService.방목록(pageable));
        model.addAttribute("reservation",reservationService.예약목록(pageable));

        List<String> price = new ArrayList<>();
        for(int i=1; i<13; i++) {
            price.add(adminService.매출(i));
            if(price.get(i-1)==null) {
                price.set((i-1), "0");
                System.out.println("asdfasdfsadf"+price.get(0));
            }


        }
        model.addAttribute("price", price);

        return "/admin";
    }

}
