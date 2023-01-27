package com.example.greenhotel.controller;

import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    private final UserRepository userRepository;

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

    @GetMapping("/mypage")
    public String mypage(){
        return "/mypage";
    }

    @GetMapping("/updateUserForm")
    public String updateUserForm() {
        return "/updateUserForm";
    }
}
