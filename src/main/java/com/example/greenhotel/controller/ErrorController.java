package com.example.greenhotel.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class ErrorController {
    private String VIEW_PATH = "/errors/";

    @GetMapping(value = "/error")
    public String handleError(HttpServletRequest request) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        if(status != null){
            int statusCode = Integer.valueOf(status.toString());

            if(statusCode == HttpStatus.NOT_FOUND.value()){
                return VIEW_PATH + "404";
            }
            if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()){
                return VIEW_PATH + "500";
            }
        }
        return "error";
    }

    public String getErrorPath() {
        return null;
    }
}