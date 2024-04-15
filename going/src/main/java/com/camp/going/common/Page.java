package com.camp.going.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString
public class Page {
    
    private int pageNo; // 페이지 번호
    private int amount; // 한 화면에 보일 게시물 수

    public Page() {
        this.pageNo = 1;
        this.amount = 8;
    }

    public int getPageStart() {
        return (pageNo - 1) * amount;
    }
    
}
