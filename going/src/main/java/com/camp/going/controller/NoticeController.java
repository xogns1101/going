package com.camp.going.controller;

import com.camp.going.common.PageMaker;
import com.camp.going.common.Search;
import com.camp.going.dto.request.NoticeWriteRequestDTO;
import com.camp.going.dto.response.NoticeDetailResponseDTO;
import com.camp.going.dto.response.NoticeListResponseDTO;
import com.camp.going.service.NoticeService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

        return "(경로 패키지명)/list";
    }


    // 글쓰기 화면 요청
    @GetMapping("/write")
    public String write() {
        System.out.println("/notice/write: GET");
        return "(경로패키지명)/write";
    }


    // 글쓰기 등록 요청
    @PostMapping("/write")
    public String write(NoticeWriteRequestDTO dto, HttpSession session) {
        log.info("/notice/write: POST, dto: {}", dto);

        service.register(dto, session);
        return "redirect:/notice/list";
    }


    // 글 삭제 요청
    @GetMapping("/delete")
    public String delete(int nno) {
        System.out.println("/notice/delete: GET" + nno);
        service.delete(nno);

        return "redirect:/notice/list";
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























