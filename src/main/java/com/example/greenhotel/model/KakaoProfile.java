package com.example.greenhotel.model;

import lombok.Data;

import java.util.Date;

@Data
public class KakaoProfile {
    public long id;
    public Date connected_at;
    public Properties properties;
    public KakaoAccount kakao_account;

    @Data
    public class Properties{
        public String nickname;
    }

    @Data
    public class KakaoAccount{
        public boolean profile_nickname_needs_agreement;
        public Profile profile;
        public boolean has_email;
        public boolean email_needs_agreement;
        public boolean is_email_valid;
        public boolean is_email_verified;
        public String email;

        @Data
        public class Profile{
            public String nickname;
        }
    }
}
