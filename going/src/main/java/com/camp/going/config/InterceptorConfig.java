package com.camp.going.config;

import com.camp.going.interceptor.*;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class InterceptorConfig implements WebMvcConfigurer {

    private final AfterLoginInterceptor afterLoginInterceptor;
    private final AutoLoginInterceptor autoLoginInterceptor;
    private final NoticeInterceptor noticeInterceptor;
    private final ReviewInterceptor reviewInterceptor;
    private final ReservationInterceptor reservationInterceptor;


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 로그인 후 비회원전용 페이지 접근 차단 인터셉터 등록
        registry
                .addInterceptor(afterLoginInterceptor) // 어떤 인터셉터를 등록할 것인가
                // sign-in(로그인), sign-up(회원가입), mypage(마이페이지)
                .addPathPatterns("/user/sign-in", "/user/sign-up"); // 어디서 들어온 요청을 강하게
        registry
                .addInterceptor(noticeInterceptor)
                //  notice/write(공지작성란)
                .addPathPatterns("/main/notice/write");
        registry
                .addInterceptor(reviewInterceptor)
//                  review-write(리뷰 작성), review-modify(리뷰 수정), review-delete(리뷰 삭제)
                .addPathPatterns("/main/review-write", "/main/review-modify", "/main/review-delete");
        registry
                .addInterceptor(reservationInterceptor)
                // reservation(예약하기), reservation-detail(관리자용 예약 현황)
                .addPathPatterns("/main/reservation", "/main/reservation-detail");

        // 자동 로그인 인터셉터 설정
        registry
                .addInterceptor(autoLoginInterceptor)
                .addPathPatterns("/**");

    }

}
