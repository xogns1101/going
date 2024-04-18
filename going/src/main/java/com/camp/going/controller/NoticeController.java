package com.camp.going.controller;

import com.camp.going.common.PageMaker;
import com.camp.going.common.Search;
import com.camp.going.dto.request.NoticeModifyRequestDTO;
import com.camp.going.dto.request.NoticeWriteRequestDTO;
import com.camp.going.dto.response.NoticeDetailResponseDTO;
import com.camp.going.dto.response.NoticeListResponseDTO;
import com.camp.going.service.NoticeService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/main/notice")
@Slf4j
public class NoticeController {

    private final NoticeService service;

    // 목록 조회 요청
    @GetMapping("/list")
    public String list(Model model, @ModelAttribute("s")Search page) {
        System.out.println("search = " + page);
        List<NoticeListResponseDTO> dtoList = service.getList(page);

        PageMaker pageMaker = new PageMaker(page, service.getCount(page));

        model.addAttribute("nList", dtoList);
        model.addAttribute("maker", pageMaker);

//        return "(경로패키지명)/list";
        return "notice-admin";
    }


    // 글쓰기 화면 요청
    @GetMapping("/write")
    public String write(Model model) {
        // 사용자 인증 정보 가져오기.
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        // 사용자가 인증되었고, ADMIN 권한을 가지고 있는지 확인함.
        if (auth != null && auth.isAuthenticated() && auth.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ADMIN"))) {
            System.out.println("/notice/write: GET");

            // 카테고리 옵션 설정
            List<String> categories = Arrays.asList("ESSENTIAL", "NOTICE", "COMMON");
            model.addAttribute("categories", categories);



            return "(경로패키지명)/write";
        } else return "redirect:/notice/list";
    }


    // 글쓰기 등록 요청
    @PostMapping("/write")
    public String write(NoticeWriteRequestDTO dto, HttpSession session) {
        log.info("/notice/write: POST, dto: {}", dto);

        service.register(dto, session);
        return "redirect:/notice/list";
    }


    // 글 수정 요청
    @PostMapping("/modify")
    public String modify(NoticeModifyRequestDTO dto, HttpSession session, Model model) {
        log.info("/notice/modify: POST, dto: {}", dto);

        // 카테고리 옵션 설정
        List<String> categories = Arrays.asList("ESSENTIAL", "NOTICE", "COMMON");
        model.addAttribute("categories", categories);

        service.modify(dto, session);
        return "redirect:/notice/list";
    }


    // 글 삭제 요청
    @GetMapping("/delete")
    public String delete(int nno) {
        // 사용자 인증 정보 가져오기.
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        // 사용자가 인증되었고, ADMIN 권한을 가지고 있는지 확인함.
        if (auth != null && auth.isAuthenticated() && auth.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ADMIN"))) {
            System.out.println("/notice/delete: GET" + nno);
            service.delete(nno);
            return "redirect:/notice/list";
        } else return "redirect:/notice/list";
    }


    // 글 상세보기 요청
    @GetMapping("/detail/{nno}")
    public String detail(@PathVariable("nno") int nno, @ModelAttribute("s") Search search, Model model) {
        System.out.println("/notice/detail: GET" + nno);
        NoticeDetailResponseDTO dto = service.getDetail(nno);

        model.addAttribute("n", dto);
        return ("경로패키지명/detail");
    }


}