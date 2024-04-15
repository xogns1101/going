package com.camp.going.dto.request;


import com.camp.going.entity.User;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;
import org.springframework.security.crypto.password.PasswordEncoder;

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SignUpRequestDTO {

    @NotBlank
    @Size(min = 10, max = 26)
    @Email
    private String email;

    @NotBlank
    private String password;

    @NotBlank
    private String phone_number;

    // private LocalDate user_date 영섭이한테 물어보기
    private User.LoginMethod loginMethod;


    // dto -> entity method
    public User toEntity(PasswordEncoder encoder) {
        return User.builder()
                .email(email)
                .password(encoder.encode(password))
                .phoneNumber(phone_number)
                .loginMethod(loginMethod)
                .build();
    }

}
