package com.camp.going.dto.request;

import com.camp.going.entity.User;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class KakaoSignUpRequestDTO {


    @NotBlank
    @Size(min = 4, max = 14)
    private String account;

    @NotBlank
    private String password;

    @NotBlank
    @Size(min = 2, max = 6)
    private String name;

    @NotBlank
    @Email
    private String email;

    private String phoneNumber;

    // 프로필 사진 파일
    private MultipartFile profileImage;

    private User.LoginMethod loginMethod;

    // dto를 엔터티로 변환하는 유틸메서드
    public User toEntity(PasswordEncoder encoder, String savePath) {
        return User.builder()
                .email(account)
                .password(encoder.encode(password))
                .name(name)
                .email(email)
                .phoneNumber(phoneNumber)
                .profileImage(savePath)
                .loginMethod(loginMethod)
                .build();
    }

}
