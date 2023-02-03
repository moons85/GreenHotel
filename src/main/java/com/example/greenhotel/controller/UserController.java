package com.example.greenhotel.controller;

import com.example.greenhotel.model.Event;
import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.UserRepository;
import com.example.greenhotel.service.EventService;
import com.example.greenhotel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    private final UserRepository userRepository;
    @Autowired
    private UserService userService;

    @Autowired
    private EventService eventService;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping(value = {"", "/"})
    public String index(){
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

}
