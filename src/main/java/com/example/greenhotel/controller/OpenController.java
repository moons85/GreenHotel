package com.example.greenhotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OpenController {
    @GetMapping("/auth/tour")
    public String callApi(){
        return "/tour";
    }
}
