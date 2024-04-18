package com.camp.going.service;

import com.camp.going.dto.request.SignUpRequestDTO;
import com.camp.going.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;
    private final PasswordEncoder encoder;

    public void join(SignUpRequestDTO dto){

        userMapper.save(dto.toEntity(encoder));

    }

    public boolean checkDuplicateValue(String type, String keyword) {
        return userMapper.isDuplicate(type, keyword);
    }

}
