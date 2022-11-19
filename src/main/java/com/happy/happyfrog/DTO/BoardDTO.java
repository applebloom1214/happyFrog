package com.happy.happyfrog.DTO;


import java.util.Date;
import java.util.Objects;

public class BoardDTO {
    private Integer bno; // 글번호
    private String writer; // 작성자
    private String title; // 제목
    private String content; // 내용(추후 이미지가 들어갈 예정)
    private Date regdate; // 등록일
    private Integer hits; // 조회수, 읽을 때마다 1 증가
    private Integer rating; // 평점, 댓글 달때마다 평점만큼 증가
    private Integer rcnt; //댓글수, 댓글 달때마다 1 증가

    public BoardDTO(){

    }

    public BoardDTO(String writer, String title) {
        this.writer = writer;
        this.title = title;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BoardDTO boardDTO = (BoardDTO) o;
        return bno.equals(boardDTO.bno) && writer.equals(boardDTO.writer) && title.equals(boardDTO.title);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bno, writer, title);
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public Integer getHits() {
        return hits;
    }

    public void setHits(Integer hits) {
        this.hits = hits;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Integer getRcnt() {
        return rcnt;
    }

    public void setRcnt(Integer rcnt) {
        this.rcnt = rcnt;
    }

    @Override
    public String toString() {
        return "BoardDTO{" +
                "bno=" + bno +
                ", writer='" + writer + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", regdate=" + regdate +
                ", hits=" + hits +
                ", rating=" + rating +
                ", rcnt=" + rcnt +
                '}';
    }
}
