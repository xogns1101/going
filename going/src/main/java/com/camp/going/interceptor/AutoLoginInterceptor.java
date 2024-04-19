package com.camp.going.interceptor;

import com.camp.going.entity.User;
import com.camp.going.mapper.UserMapper;
import com.camp.going.service.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import java.time.LocalDateTime;

import static com.camp.going.util.LoginUtils.*;

@Configuration
@Slf4j
@RequiredArgsConstructor
public class AutoLoginInterceptor implements HandlerInterceptor {
    private final UserMapper userMapper;
    private final UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        // 1. 사이트에 들어오면 자동 로그인 쿠키를 가진 클라이언트인지를 체크
        Cookie autoLoginCookie = WebUtils.getCookie(request, AUTO_LOGIN_COOKIE);

        // 2. 자동 로그인 쿠키가 있다면
        if (autoLoginCookie != null) {

            // 3. 지금 읽어들인 쿠키가 가지고 있는 session_id를 꺼내자
            String sessionId = autoLoginCookie.getValue();

            // 4. DB에서 쿠키가 가지고 있던 session_id와 동일한 값을 가진 회원을 조회해 오자
            User user = userMapper.findUserByCookie(sessionId);

            // 5. 회원이 정상적으로 조회가 됐다면 and 자동로그인 만료시간 이전이면 로그인을 수행한다
            if (user != null && LocalDateTime.now().isBefore(user.getLimitTime())) {
                userService.maintainLoginState(request.getSession(), user.getEmail());
            }

        }


        // 자동로그인을 신청했거나 안했거나
        // 요청은 무조건 컨트롤러로 전달되어야 하니 리턴값은 true 고정
        return true;
    }
}
