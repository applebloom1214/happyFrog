package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.Finedust;
import org.junit.Test;


public class APIDAOTest {

    @Test
    public void getFinedust() throws Exception {
        APIDAO dao = new APIDAOImpl();
        Finedust finedust = dao.getFinddust();
        System.out.println("finedust.getValue() = " + finedust.getValue());
        System.out.println("finedust.getStatus() = " + finedust.getStatus());

    }
}