package com.happy.happyfrog.DTO;

public class SearchDTO {
    private Integer page = 1; // 검색페이지는 무조건 1페이지부터 시작
    private Integer PAGE_SIZE = 10; // 한 페이지당 보여줄 글갯수, 기본 10
    private String option = ""; // 검색 옵션
    private String keyword =""; // 검색 키워드

    public SearchDTO(){

    }

    public SearchDTO(Integer page){
        this.page=page;
    }

    public SearchDTO(Integer page, String option, String keyword){
        this.page = page;
        this.option = option;
        this.keyword = keyword;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPAGE_SIZE() {
        return PAGE_SIZE;
    }

    public void setPAGE_SIZE(Integer PAGE_SIZE) {
        this.PAGE_SIZE = PAGE_SIZE;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getOffset() {
        return (page-1)*PAGE_SIZE;
    }

    @Override
    public String toString() {
        return "SearchDTO{" +
                "page=" + page +
                ", PAGE_SIZE=" + PAGE_SIZE +
                ", option='" + option + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}
