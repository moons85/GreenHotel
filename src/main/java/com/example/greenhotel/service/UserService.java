package com.example.greenhotel.service;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Autowired;
=======
import com.example.greenhotel.dto.MailDto;
import com.example.greenhotel.model.Event;
import com.example.greenhotel.model.RoleType;
import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.EventRepository;
import com.example.greenhotel.repository.UserRepository;
import lombok.RequiredArgsConstructor;
>>>>>>> branch 'master' of https://github.com/moons85/GreenHotel.git
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.greenhotel.dto.MailDto;
import com.example.greenhotel.model.RoleType;
import com.example.greenhotel.model.User;
import com.example.greenhotel.repository.IdRepository;
import com.example.greenhotel.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {
    private final UserRepository userRepository;

    private final EventRepository eventRepository;
    private final BCryptPasswordEncoder encoder;

    private final AuthenticationManager authenticationManager;
    private final JavaMailSenderImpl mailSender;

<<<<<<< HEAD
    @Autowired
    private IdRepository idRepository;
=======
>>>>>>> branch 'master' of https://github.com/moons85/GreenHotel.git

    @Transactional
    public void 회원가입(User user) {
        String rawPassword = user.getPassword();
        String encPassword = encoder.encode(rawPassword);
        user.setPassword(encPassword);
        user.setPoint(1000);
        user.setRoleType(RoleType.USER);
        userRepository.save(user);
    }

    @Transactional
    public void 쿠폰발급(Event event,User user){
        event.setUser(user);
        eventRepository.save(event);
    }

    @Transactional(readOnly = true)
    public User 회원찾기(String username) {
        return userRepository.findByUsername(username)
                .orElse(new User());
    }

    @Transactional(readOnly = true)
    public User 회원찾기2(int id) {
        return userRepository.findById(id)
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
//    @Transactional
//    public void 포인트적립(User user,User raw){
//        User percitences = userRepository.findById(user.getId()).orElseThrow(()->{
//            return new IllegalArgumentException("회원 찾기 실패");
//        });
//        percitences.setPoint(raw.getPoint());
//    }

    @Transactional
    public String find_id(String email, String phonenumber) {

        String result = "";

        try {
            result= userRepository.find_id(email, phonenumber);

        } catch(Exception e) {

            e.printStackTrace();
        }

        return result;
    }

    @Transactional
    public String find_pwd(String email) {

        String result = "";

        try {
            result= userRepository.find_pwd(email);

        } catch(Exception e) {

            e.printStackTrace();
        }

        return result;
    }

    @Transactional
    public MailDto createMailAndChangePassword(String memberEmail) {
        String str = getTempPassword();
        MailDto dto = new MailDto();
        dto.setAddress(memberEmail);
        dto.setTitle("임시비밀번호 안내 이메일 입니다.");
        dto.setMessage("안녕하세요. 임시비밀번호 안내 관련 이메일 입니다." + " 회원님의 임시 비밀번호는 "
                + str + " 입니다." + "로그인 후에 비밀번호를 변경을 해주세요");
        updatePassword(str,memberEmail);
        return dto;
    }

    @Transactional
    public void updatePassword(String str, String userEmail){
        String memberPassword = str;
        String encPassword = encoder.encode(memberPassword);
        String memberId = userRepository.findByMemberEmail(userEmail);
        userRepository.updatePassword(memberId,encPassword);
    }

    @Transactional
    public String getTempPassword(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String str = "";

        // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }

    @Transactional
    public void mailSend(MailDto mailDTO) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mailDTO.getAddress());
        message.setSubject(mailDTO.getTitle());
        message.setText(mailDTO.getMessage());
        message.setFrom("hyn6305@naver.com");
        message.setReplyTo("hyn6305@naver.com");
        System.out.println("message"+message);
        mailSender.send(message);
    }

<<<<<<< HEAD
	@Transactional(readOnly = true)
	public int idCheck(String username) {
		int cnt = idRepository.countByUsername(username);
		System.out.println(username);
		return cnt;
	}
=======
    @Transactional(readOnly = true)
    public int idCheck(String username) {
        int cnt = userRepository.countByUsername(username);
        System.out.println(username);
        return cnt;
    }


>>>>>>> branch 'master' of https://github.com/moons85/GreenHotel.git
}
