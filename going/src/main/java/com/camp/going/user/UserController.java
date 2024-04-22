package com.camp.going.user;

import com.camp.going.dto.request.SignUpRequestDTO;
import com.camp.going.dto.request.UserLoginRequestDTO;
import com.camp.going.dto.response.LoginUserResponseDTO;
import com.camp.going.entity.User;
import com.camp.going.service.LoginResult;
import com.camp.going.service.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


// 이따가 jsp 파일 들어오는거 보고 경로 맞는지 잘 수정하기
@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    private static final Logger log = LoggerFactory.getLogger(UserController.class);
    private final UserService userService;

    @GetMapping("/sign-up")
    public String signUp() {return "user/signup";}


    // 이따가 jsp 파일 들어오면 입력값 중복 이거들 더 만들어놓기



    @PostMapping("/sign-up")
    public String signup(SignUpRequestDTO dto){
         System.out.println("/user/sign-up: POST!");
         System.out.println("dto = " + dto);

        userService.join(dto);

        dto.setLoginMethod(User.LoginMethod.COMMON);

        return "redirect:/main";
        // 이따가 조원들한테 물어보고 마이페이지로 가면 마이페이지로 수정하기
    }

    // 로그인 화면  요청 처리 -- 위에 사인업처럼 경로 맞으면 보이드로 바꾸기
    @GetMapping("/sign-in")
    public void signIn() {
        System.out.println("/user/sign-in: GET!");
    }

    // 로그인  요청
    @PostMapping("/sign-in")
    public String signIn(UserLoginRequestDTO dto,
                         RedirectAttributes ra, // 이거도 같음
                         HttpServletResponse response,
                         HttpServletRequest request
                         ) {
        System.out.println("/user/sign-in: POST!");
        System.out.println("dto = " + dto);

        LoginResult result = userService.authenticate(dto);

        ra.addFlashAttribute("result", result); // 이 코드 지울 수도 있으니까 잘보기

        if (result == LoginResult.SUCCESS) {

            // makeLoginCookie(dto, response); 세션 말고 쿠키 사용하면 이거로 쓰기

            // 세션
            userService.maintainLoginState(request.getSession(), dto.getEmail());

            return "redirect:/main";
        }

        return "redirect:/user/sign-in";
    }

    // 쿠키 생성 근데 세션으로 처리할꺼 같아서 확정나면 이함수는 그냥 지워도됨
    private void makeLoginCookie(UserLoginRequestDTO dto, HttpServletResponse response) {

        Cookie cookie = new Cookie("login", dto.getEmail());

        cookie.setMaxAge(60); // 일단 60초로 설정 이따가 쿠키 사용하면 꼭 수정하기
        cookie.setPath("/");

        response.addCookie(cookie);

    }

    // 로그아웃 처리 부분
    @GetMapping("/sign-out")
    public String signOut(HttpSession session,
                          HttpServletRequest request,
                          HttpServletResponse response) {
        log.info("/user/sign-out: GET!");


        LoginUserResponseDTO dto = (LoginUserResponseDTO) session.getAttribute("login");
        if(dto.getLoginMethod().equals("KAKAO")) {
            userService.kakaoLogout(dto, session);
        }

        session.removeAttribute("login");

        session.invalidate();
        return "redirect:/";




    }


}
