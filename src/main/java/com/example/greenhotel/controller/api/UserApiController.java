package com.example.greenhotel.controller.api;

import java.util.Objects;

import javax.transaction.Transactional;

import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.greenhotel.config.auth.PrincipalDetail;
import com.example.greenhotel.dto.MailDto;
import com.example.greenhotel.dto.ResponseDto;
import com.example.greenhotel.model.Event;
import com.example.greenhotel.model.KakaoProfile;
import com.example.greenhotel.model.User;
import com.example.greenhotel.service.UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class UserApiController {
    private final UserService userService;

    private final AuthenticationManager authenticationManager;

    @PostMapping("/auth/api/user")
    public ResponseDto<Integer> join(@RequestBody User user) {
        userService.회원가입(user);
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }

    @PostMapping("/api/event")
    public ResponseDto<Integer> eventcoupon(@RequestBody Event event,@AuthenticationPrincipal PrincipalDetail principalDetail){
        userService.쿠폰발급(event,principalDetail.getUser());
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }


    @GetMapping("/auth/api/kakao")
    public ModelAndView join(@RequestAttribute KakaoProfile kakaoProfile) {
        User kakaoUser = User.builder()
                .username(kakaoProfile.getProperties().nickname)
                .password(String.valueOf(Objects.hash(kakaoProfile.id)))
                .email(kakaoProfile.kakao_account.email)
                .build();
        System.out.println("kakaoProfile = " + kakaoProfile);


        User orginUser = userService.회원찾기(kakaoUser.getUsername());

        if(orginUser.getUsername() == null) {
            userService.회원가입(kakaoUser);
        }

        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(kakaoProfile.getProperties().nickname, String.valueOf(Objects.hash(kakaoProfile.id))));
        SecurityContextHolder.getContext().setAuthentication(authentication);

        return new ModelAndView("redirect:/");
    }

    @PutMapping ("/api/updateuser")
    public ResponseDto<Integer> update(@AuthenticationPrincipal PrincipalDetail principalDetail,@RequestBody User user){
        userService.회원수정(principalDetail.getUser(),user);
        Authentication authenticate = authenticationManager.authenticate(new
                UsernamePasswordAuthenticationToken(principalDetail.getUsername(), user.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authenticate);
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }

//    @PostMapping("/api/point")
//    public ResponseDto<Integer> pointupdate(@AuthenticationPrincipal PrincipalDetail principalDetail,@RequestBody User user){
//        userService.포인트적립(principalDetail.getUser(),user);
//        return new ResponseDto<>(HttpStatus.OK.value(), 1);
//    }

    @PostMapping("/auth/find_id")
    @ResponseBody
    public String find_id(@RequestParam("email") String email,@RequestParam("phonenumber") String phonenumber) {
        System.out.println(email);
        System.out.println(phonenumber);
        String result = userService.find_id(email, phonenumber);

        return result;
    }

    @Transactional
    @PostMapping("/auth/sendEmail")
    public String sendEmail(@RequestParam("email") String email, @RequestParam("username") String username){
        String result = userService.find_pwd(email);
        if(result==null){
            System.out.println(result);
            return result;
        }
        else{
            System.out.println(result);
            MailDto dto = userService.createMailAndChangePassword(email);
            userService.mailSend(dto);

            return "/auth/login";
        }
    }
    

    @ResponseBody
    @PostMapping("/auth/idcheck")
    public ResponseDto<Integer> idcheck(@RequestBody User user) {
        System.out.println("idcheck실행");
        int count = 0;
        count = userService.idCheck(user.getUsername());
        System.out.println(count);
        return new ResponseDto<Integer>(HttpStatus.OK.value(),count);
    }



}
