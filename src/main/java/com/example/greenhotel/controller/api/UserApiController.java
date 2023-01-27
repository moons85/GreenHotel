package com.example.greenhotel.controller.api;

import com.example.greenhotel.dto.ResponseDto;
import com.example.greenhotel.model.User;
import com.example.greenhotel.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
public class UserApiController {
    private final UserService userService;

    @PostMapping("/auth/api/user")
    public ResponseDto<Integer> join(@RequestBody User user) {
        userService.회원가입(user);
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }
}
