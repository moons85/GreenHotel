package com.example.greenhotel.service;

import com.example.greenhotel.model.RoleType;
import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class UserService {
    private final UserRepository userRepository;
    private final BCryptPasswordEncoder encoder;

    private final AuthenticationManager authenticationManager;

    @Transactional
    public void 회원가입(User user) {
        String rawPassword = user.getPassword();
        String encPassword = encoder.encode(rawPassword);
        user.setPassword(encPassword);
        user.setRoleType(RoleType.USER);
        userRepository.save(user);
    }

    @Transactional(readOnly = true)
    public User 회원찾기(String username) {
        return userRepository.findByUsername(username)
                .orElse(new User());
    }

    @Transactional
    public void 회원수정(User user,User raw){
        User percitence = userRepository.findById(user.getId()).orElseThrow(()->{
            return new IllegalArgumentException("회원 찾기 실패");
        });
        String rawPassword = raw.getPassword();
        String encPassword = encoder.encode(rawPassword);
        percitence.setPassword(encPassword);
        percitence.setEmail(raw.getEmail());
        percitence.setName(raw.getName());
        percitence.setPhonenumber(raw.getPhonenumber());


    }
}
