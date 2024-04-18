package com.camp.going.config;

import com.camp.going.interceptor.AfterLoginInterceptor;
import com.camp.going.interceptor.AutoLoginInterceptor;
import com.camp.going.interceptor.NoticeInterceptor;
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


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 로그인 후 비회원전용 페이지 접근 차단 인터셉터 등록
        registry
                .addInterceptor(afterLoginInterceptor) // 어떤 인터셉터를 등록할 것인가
                .addPathPatterns("user/sign-in", "user/sign-up"); // 어디서 들어온 요청을 강하게
        registry
                .addInterceptor(noticeInterceptor)
                .addPathPatterns("/notice/*")
                .excludePathPatterns("/notice/list", "/notice/detail");


        // 자동 로그인 인터셉터 설정
        registry
                .addInterceptor(autoLoginInterceptor)
                .addPathPatterns("/**");

    }

}
