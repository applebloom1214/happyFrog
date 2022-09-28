package com.happy.happyfrog.DTO;

public class SearchDTO {
    private Integer page = 1; // 검색페이지는 무조건 1페이지부터 시작
    private Integer PAGE_SIZE = 10; // 한 페이지당 보여줄 글갯수, 기본 10
    String option = ""; // 검색 옵션
    String keyword =""; // 검색 키워드

    public SearchDTO(){

    }



}
