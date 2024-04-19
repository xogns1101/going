package com.camp.going.interceptor;

import com.camp.going.mapper.ReservationMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import static com.camp.going.util.LoginUtils.*;

@Configuration
@Slf4j
@RequiredArgsConstructor
public class ReservationInterceptor implements HandlerInterceptor {

    private final ReservationMapper reservationMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();


//        if (!isLogin(session)) {
//            log.info("권한이 없어서 요청이 거부됐습니다. ({})", request.getRequestURI());
//            response.sendRedirect("/error/403");
//            return false;
//        }

//        if (!isLogin(session)) {
//            log.info("권한이 없어서 요청이 거부됐습니다. ({})", request.getRequestURI());
//            response.sendRedirect("/main/reservation");
//            return false;
//        }



        return true;
    }

}
