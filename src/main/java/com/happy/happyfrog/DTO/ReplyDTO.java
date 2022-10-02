package com.happy.happyfrog.DTO;

import java.util.Date;
import java.util.Objects;

public class ReplyDTO {
    private Integer cno;
    private Integer bno;
    private String comment;
    private String commenter;
    private Date reg_date;
    private Date up_date;

    public ReplyDTO(){

    }

    public ReplyDTO(String comment, String commeter) {
        this.comment = comment;
        this.commenter = commeter;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReplyDTO replyDTO = (ReplyDTO) o;
        return cno.equals(replyDTO.cno) && bno.equals(replyDTO.bno) && comment.equals(replyDTO.comment) && commenter.equals(replyDTO.commenter);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cno, bno, comment, commenter);
    }

    public Integer getCno() {
        return cno;
    }

    public void setCno(Integer cno) {
        this.cno = cno;
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCommenter() {
        return commenter;
    }

    public void setCommeter(String commenter) {
        this.commenter = commenter;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public Date getUp_date() {
        return up_date;
    }

    public void setUp_date(Date up_date) {
        this.up_date = up_date;
    }

    @Override
    public String toString() {
        return "ReplyDTO{" +
                "cno=" + cno +
                ", bno=" + bno +
                ", comment='" + comment + '\'' +
                ", commeter='" + commenter + '\'' +
                ", reg_date=" + reg_date +
                ", up_date=" + up_date +
                '}';
    }
}
