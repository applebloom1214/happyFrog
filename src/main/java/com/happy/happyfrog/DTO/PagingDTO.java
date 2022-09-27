package com.happy.happyfrog.DTO;

public class PagingDTO {
    private int PAGE_SIZE = 10; // 한 페이지 당 보여줄 게시물 갯수
    private int NAVI_SIZE = 10; // navi size
    private int totalCnt; // 총 게시물 갯수
    private int totalPage; // 총 페이지 갯수
    private int page; // 현재 페이지
    private int beginPage; // 시작 페이지
    private int endPage; // 끝 페이지
    private boolean showNext; // 다음 페이지로 이동하는 링크를 표시할 것인지
    private boolean showPrev; // 이전 페이지로 이동하는 링크를 표시할 것인지

    public PagingDTO(int totalCnt, int page){
        this.totalCnt = totalCnt;
        this.page = page;

        totalPage = totalCnt / PAGE_SIZE + (totalCnt % PAGE_SIZE == 0 ? 0:1);
        beginPage = page / NAVI_SIZE * NAVI_SIZE +1;
        endPage = Math.min(beginPage + NAVI_SIZE -1,totalPage);
        showPrev = beginPage != 1;
        showNext = endPage != totalPage;
    }

    public int getPAGE_SIZE() {
        return PAGE_SIZE;
    }

    public void setPAGE_SIZE(int PAGE_SIZE) {
        this.PAGE_SIZE = PAGE_SIZE;
    }

    public int getNAVI_SIZE() {
        return NAVI_SIZE;
    }

    public void setNAVI_SIZE(int NAVI_SIZE) {
        this.NAVI_SIZE = NAVI_SIZE;
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

     // 페이징 테스트용 메소드
    void print(){
        System.out.print(showPrev == true ? "<prev> ":" ");
        for (int i = beginPage; i <= endPage; i++) {
            System.out.print(i+" ");
        }
        System.out.print(showNext == true ? " <next>":" ");
    }


    @Override
    public String toString() {
        return "PagingDTO{" +
                "PAGE_SIZE=" + PAGE_SIZE +
                ", NAVI_SIZE=" + NAVI_SIZE +
                ", totalCnt=" + totalCnt +
                ", totalPage=" + totalPage +
                ", page=" + page +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showNext=" + showNext +
                ", showPrev=" + showPrev +
                '}';
    }
}
