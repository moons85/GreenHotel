package com.example.greenhotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
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
}
