package com.camp.going.common;


import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class Search extends Page {

    private String type, keyword;

    public Search() {
        this.type = "";
        this.keyword = "";
    }

}

