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
public class SignUpRequestDTO {

    @NotBlank
    @Email
    private String email;

    @NotBlank
    private String password;

    @NotBlank
    private String name;

    @NotBlank
    private String phoneNumber;

    private User.LoginMethod loginMethod;



    // dto를 엔터티로 변환하는 유틸메서드
    public User toEntity(PasswordEncoder encoder) {
        return User.builder()
                .email(email)
                .password(encoder.encode(password))
                .name(name)
                .email(email)
                .loginMethod(loginMethod)
                .build();
    }

}
