package com.camp.going.interceptor;

import com.camp.going.mapper.NoticeMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import static com.camp.going.util.LoginUtils.isLogin;

@Configuration
@Slf4j
@RequiredArgsConstructor
public class NoticeInterceptor implements HandlerInterceptor {

    private final NoticeMapper noticeMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        String uri = request.getRequestURI();

        // 로그인을 안할 시 작동
        if (!isLogin(session)) {
            log.info("권한이 없어서 요청이 거부됐습니다. ({})", request.getRequestURI());
            response.sendRedirect("/user/sign-in");
            return false;
        }

        // 삭제 요청인지 확인
        if (uri.contains("delete")) {
            // 관리자가 아니면 삭제 요청을 취소한다.
//            if (!isAdmin(session)) {
//                log.info("관리자 권한이 없습니다. ({})", request.getRequestURI());
//                return false;
//            }

        }


        return true;
    }

}