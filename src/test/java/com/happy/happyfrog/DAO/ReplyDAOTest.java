package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.ReplyDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReplyDAOTest {
    @Autowired
    private ReplyDAO dao;

    @Test
    public void deleteAll(){
        int cnt = dao.deleteAll();
        assertTrue(cnt ==2);
        assertTrue(dao.count()==0);
    }

    @Test
    public void count(){
        int cnt = dao.count();
        assertTrue(cnt == 0);
    }

    @Test
    public void insert(){
        ReplyDTO dto;
        for (int i = 0; i < 5; i++) {
            dto = new ReplyDTO("리플"+i,"작성자"+i);
            dao.insert(dto);
        }
        assertTrue(dao.count()==5);
    }

    @Test
    public void read(){
        List<ReplyDTO> list = dao.read(0);
        for (int i = 0; i < list.size(); i++) {
            System.out.println("list.get(i) = " + list.get(i));
        }
        assertTrue(list.size()==2);
    }

    @Test
    public void update(){
        ReplyDTO dto = new ReplyDTO("수정","작성자");
        dto.setCno(2);
        int result = dao.update(dto);
        System.out.println("dto = " + dto);
        assertTrue(result==1);
    }

    @Test
    public void delete(){
        int cno = 4;
        int result = dao.delete(cno);
        assertTrue(result==1);
    }

}