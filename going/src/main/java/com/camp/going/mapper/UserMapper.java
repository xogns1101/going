package com.camp.going.mapper;

import com.camp.going.dto.request.AutoLoginDTO;
import com.camp.going.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

    // 회원 가입
    void save(User user);

    // 회원 정보 단일 조회
    User findUser(String email);
    
    // 이메일 (아이디) 중복확인
    // @Param("type") String type (대기)

    void saveAutoLogin(AutoLoginDTO build);

    User findUserByCookie(String sessionId);

    /**
     * 중복 체크(account, email) 기능
     * @param type - 중복을 검사할 내용 (account, email)
     * @param keyword - 중복 검사 입력값 (ex: abc1234@naver.com...)
     * @return 중복이면 true, 중복이 아니면 false
     */
    boolean isDuplicate(@Param("type") String type, @Param("keyword") String keyword);

    User selectUserById(int userId);
}
