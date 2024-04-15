package com.camp.going.service;

import com.camp.going.common.Search;
import com.camp.going.dto.request.NoticeWriteRequestDTO;
import com.camp.going.dto.response.NoticeDetailResponseDTO;
import com.camp.going.dto.response.NoticeListResponseDTO;
import com.camp.going.entity.Notice;
import com.camp.going.mapper.NoticeMapper;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeService {

    private final NoticeMapper mapper;

    // 글 작성
    public void register(NoticeWriteRequestDTO dto, HttpSession session) {
        Notice notice = new Notice(dto);

//        notice.setWriter(LoginUtils.getCurrentLoginMemberAccount(session)); -> 공지사항에 작성자 기능이 없으므로 뺌

        mapper.save(notice);
    }

    // 목록 조회
    public List<NoticeListResponseDTO> getList(Search page) {
        List<NoticeListResponseDTO> dtoList = new ArrayList<>();
        List<Notice> noticeList = mapper.findAll(page);
        for (Notice notice : noticeList) {
            NoticeListResponseDTO dto = new NoticeListResponseDTO(notice);
            dtoList.add(dto);
        }
        return dtoList;
    }

    // 상세보기
    public NoticeDetailResponseDTO getDetail(int nno) {
        mapper.updateViewCount(nno);

        Notice notice = mapper.findOne(nno);
        return new NoticeDetailResponseDTO(notice);
    }

    // 지우기
    public void delete(int nno) {
        mapper.delete(nno);
    }


    public int getCount(Search page) {
        return mapper.getCount(page);
    }


}


















