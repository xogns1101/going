package com.camp.going.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import java.io.PrintWriter;

import static com.camp.going.util.LoginUtils.isAdmin;
import static com.camp.going.util.LoginUtils.isLogin;

@Configuration
@Slf4j
@RequiredArgsConstructor
public class ReservationListInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();

        // 로그인을 안할 시 작동
        if (!isLogin(session)) {
            log.info("권한이 없어서 요청이 거부됐습니다. ({})", request.getRequestURI());

            response.setContentType("text/html; charset=UTF-8");
            PrintWriter w = response.getWriter();
            String htmlCode = "<script>\n" +
                    "    alert('로그인 시 사용 가능합니다.');\n" +
                    "    location.href='/user/sign-in';\n" +
                    "</script>";
            w.write(htmlCode);
            w.flush();

            return false;
        }

        // 관리자라면 통과
        if (!isAdmin(session)) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter w = response.getWriter();
            String htmlCode = "<script>\n" +
                    "    alert('해당 페이지는 관리자만 접근 가능합니다.');\n" +
                    "    location.href='/main/reservation';\n" +
                    "</script>";
            w.write(htmlCode);
            w.flush();

            return false;
        }

        return true;

    }

}