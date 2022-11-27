package com.happy.happyfrog.DTO;

import java.util.Date;
import java.util.Objects;

public class UserDTO {
    private String id;
    private String pw;
    private String nickname;
    private String introduce;
    private Date reg_date;

    public UserDTO(){

    }

    public UserDTO(String id, String pw, String nickname, String introduce) {
        this.id = id;
        this.pw = pw;
        this.nickname = nickname;
        this.introduce = introduce;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDTO userDTO = (UserDTO) o;
        return id.equals(userDTO.id) && pw.equals(userDTO.pw);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pw);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", nickname='" + nickname + '\'' +
                ", introduce='" + introduce + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }
}
