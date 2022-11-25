package com.happy.happyfrog.DTO;

public class Finedust {
    private int value;  // 미세먼지 수치
    private String status; // 미세먼지 상태

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
