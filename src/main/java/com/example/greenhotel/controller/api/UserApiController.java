package com.example.greenhotel.controller.api;

import com.example.greenhotel.config.auth.PrincipalDetail;
import com.example.greenhotel.dto.MailDto;
import com.example.greenhotel.dto.ResponseDto;
import com.example.greenhotel.model.Event;
import com.example.greenhotel.model.KakaoProfile;
import com.example.greenhotel.model.User;
import com.example.greenhotel.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.transaction.Transactional;
import java.util.Objects;

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



}
