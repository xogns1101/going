package com.camp.going.controller;

import com.camp.going.common.PageMaker;
import com.camp.going.common.Search;
import com.camp.going.dto.request.NoticeModifyRequestDTO;
import com.camp.going.dto.request.NoticeWriteRequestDTO;
import com.camp.going.dto.response.NoticeDetailResponseDTO;
import com.camp.going.dto.response.NoticeListResponseDTO;
import com.camp.going.service.NoticeService;
import com.camp.going.util.LoginUtils;
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
    private final HttpSession session;

    // 목록 조회 요청
    @GetMapping("/notice")
    public String list(Model model, @ModelAttribute("s") Search page) {
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
        System.out.println("/notice-detail-write: GET");
        if (LoginUtils.isLogin(session)) {
            if (!LoginUtils.isAdmin(session)) return "redirect:/error/403";
        } else return "redirect:/user/sign-in";
        return "notice-detail-write";
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
        if (LoginUtils.isLogin(session)) {
            if (!LoginUtils.isAdmin(session)) return "redirect:/error/403";
        } else return "redirect:/user/sign-in";
        log.info("/notice-modify: GET " + nno);
        NoticeDetailResponseDTO dto = service.getDetail(nno);
        model.addAttribute("notice", dto);
        return "notice-modify"; // 수정 폼으로 이동
    }


    // 글 수정 요청
    @PostMapping("notice-modify")
    public String modify(NoticeModifyRequestDTO dto, HttpSession session, Model model) {
        log.info("/notice-modify: POST, dto: {}", dto);

        service.modify(dto, session);

        int noticeNo = dto.getNoticeNo(); // 수정된 공지사항 번호
        return "redirect:/main/notice-detail/" + noticeNo;
    }


    // 글 삭제 요청
    @GetMapping("notice-delete")
    public String delete(int nno) {
        if (LoginUtils.isLogin(session)) {
            if (!LoginUtils.isAdmin(session)) return "redirect:/error/403";
        } else return "redirect:/user/sign-in";
        System.out.println("/notice-delete: GET" + nno);
        log.info("/notice-delete: GET " + nno);
        service.delete(nno);
        return "redirect:/main/notice";
    }


    // 글 상세보기 요청
    @GetMapping("notice-detail/{nno}")
    public String detail(@PathVariable("nno") int nno, @ModelAttribute("s") Search page, Model model) {
        System.out.println("/notice-detail: GET " + nno);
        NoticeDetailResponseDTO dto = service.getDetail(nno);

        model.addAttribute("n", dto);

        // 목록 보여주기
        List<NoticeListResponseDTO> dtoList = service.getList(page);

        PageMaker pageMaker = new PageMaker(page, service.getCount(page));

        model.addAttribute("nList", dtoList);
        model.addAttribute("maker", pageMaker);

        // 상세보기와 같은 목록 찾기
        model.addAttribute("currentNoticeNo", nno);


        return ("notice-detail");
    }

    // 페이지 번호와 검색 관련 매개변수를 받아서 공지사항 목록을 가져오는 메서드
    @GetMapping("/notice-detail")
    public String detailList(@ModelAttribute("s") Search page, Model model) {
        // 공지사항 목록을 가져오는 비즈니스 로직 호출
        List<NoticeListResponseDTO> dtoList = service.getList(page);
        // 페이지 메이커 생성
        PageMaker pageMaker = new PageMaker(page, service.getCount(page));
        // 모델에 공지사항 목록과 페이지 메이커 추가
        model.addAttribute("nList", dtoList);
        model.addAttribute("maker", pageMaker);
        // 뷰로 이동
        return "notice-detail";
    }





    @GetMapping("/notice-essential")
    public String essentialList(Model model, @ModelAttribute("s") Search page) {
        System.out.println("search = " + page);
        List<NoticeListResponseDTO> dtoList = service.getEssential(page);

        PageMaker pageMaker = new PageMaker(page, service.getCountEssential(page));

        model.addAttribute("nList", dtoList);
        model.addAttribute("maker", pageMaker);


        return "notice-essential";
    }

    @GetMapping("/notice-notice")
    public String noticeList(Model model, @ModelAttribute("s") Search page) {
        System.out.println("search = " + page);
        List<NoticeListResponseDTO> dtoList = service.getNotice(page);

        PageMaker pageMaker = new PageMaker(page, service.getCountNotice(page));

        model.addAttribute("nList", dtoList);
        model.addAttribute("maker", pageMaker);


        return "notice-notice";
    }

    @GetMapping("/notice-common")
    public String commonList(Model model, @ModelAttribute("s") Search page) {
        System.out.println("search = " + page);
        List<NoticeListResponseDTO> dtoList = service.getCommon(page);

        PageMaker pageMaker = new PageMaker(page, service.getCountCommon(page));

        model.addAttribute("nList", dtoList);
        model.addAttribute("maker", pageMaker);


        return "notice-common";
    }

}