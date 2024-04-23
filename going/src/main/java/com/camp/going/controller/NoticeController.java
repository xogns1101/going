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
@RequestMapping("/main")
@Slf4j
public class NoticeController {

    private final NoticeService service;

    // 목록 조회 요청
    @GetMapping("/notice")
    public String list(Model model, @ModelAttribute("s")Search page) {
        System.out.println("search = " + page);
        List<NoticeListResponseDTO> dtoList = service.getList(page);

        PageMaker pageMaker = new PageMaker(page, service.getCount(page));

        model.addAttribute("nList", dtoList);
        model.addAttribute("maker", pageMaker);


        return "notice";
    }


    // 글쓰기 화면 요청
    @GetMapping("notice-detail-write")
    public String write(Model model) {
        // 사용자 인증 정보 가져오기.
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        // 사용자가 인증되었고, ADMIN 권한을 가지고 있는지 확인함.
        if (auth != null && auth.isAuthenticated() && auth.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ADMIN"))) {
            System.out.println("/notice-detail-write: GET");

            // 카테고리 옵션 설정
            // List<String> categories = Arrays.asList("ESSENTIAL", "NOTICE", "COMMON");
            // model.addAttribute("categories", categories);



            return "notice-detail-write";
        } else return // "redirect:/main/notice"; -> 어드민 로그인 전까지 주석처리
        "notice-detail-write";
    }


    // 글쓰기 등록 요청
    @PostMapping("notice-detail-write")
    public String write(NoticeWriteRequestDTO dto, HttpSession session) {
        log.info("/notice-detail-write: POST, dto: {}", dto);

        service.register(dto, session);
        return "redirect:/main/notice";
    }


    // 글 수정 화면 요청
    @GetMapping("/notice-modify/{nno}")
    public String modifyScreen(@PathVariable("nno") int nno, Model model) {
        log.info("/notice-modify: GET");
        NoticeDetailResponseDTO dto = service.getDetail(nno);
        model.addAttribute("notice", dto);
        return "notice-modify"; // 수정 폼으로 이동
    }


    // 글 수정 요청
    @PostMapping("notice-modify")
    public String modify(NoticeModifyRequestDTO dto, HttpSession session, Model model) {
        log.info("/notice-modify: POST, dto: {}", dto);

         // 카테고리 옵션 설정
         // List<String> categories = Arrays.asList("ESSENTIAL", "NOTICE", "COMMON");
         // model.addAttribute("categories", categories);

        service.modify(dto, session);
        return "redirect:/main/notice";
    }


    // 글 삭제 요청
    @GetMapping("notice-delete")
    public String delete(int nno) {
        // 사용자 인증 정보 가져오기.
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        // 사용자가 인증되었고, ADMIN 권한을 가지고 있는지 확인함.
        if (auth != null && auth.isAuthenticated() && auth.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ADMIN"))) {
            System.out.println("/notice-delete: GET" + nno);
            service.delete(nno);
            return "redirect:/main/notice";
        } else return "redirect:/main/notice";
    }


    // 글 상세보기 요청
    @GetMapping("notice-detail/{nno}")
    public String detail(@PathVariable("nno") int nno, @ModelAttribute("s") Search page, Model model) {
        System.out.println("/notice-detail: GET" + nno);
        NoticeDetailResponseDTO dto = service.getDetail(nno);

        model.addAttribute("n", dto);

        // 목록 보여주기
        List<NoticeListResponseDTO> dtoList = service.getList(page);

        PageMaker pageMaker = new PageMaker(page, service.getCount(page));

        model.addAttribute("nList", dtoList);
        model.addAttribute("maker", pageMaker);

        // 상세보기와 같은 목록 찾기
        model.addAttribute("currentNoticeNo", nno);
        NoticeDetailResponseDTO dto2 = service.getDetail(nno);
        model.addAttribute("n", dto2);


        return ("notice-detail");
    }


}