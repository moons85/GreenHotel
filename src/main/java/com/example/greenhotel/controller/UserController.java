package com.example.greenhotel.controller;

import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.UserRepository;
import com.example.greenhotel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    private final UserRepository userRepository;

    @Autowired
    private UserService userService;

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

    @GetMapping("/auth/qnaForm")
    public String qnaForm(){return "/qnaForm";}

    @GetMapping("/updateUserForm")
    public String updateUserForm() {
        return "/updateUserForm";
    }

    @GetMapping("/auth/findId")
    public String findId() {return "/findId";}

    @GetMapping("/auth/newPassword")
    public String newPassword(){return "/newPassword";}

}
