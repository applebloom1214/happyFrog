package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.UserDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDAOTest {

    @Autowired
    private UserDAO dao;

    @Test
    public void insert() {
        UserDTO dto = new UserDTO("bbb","12345","test","hello");
        int result = dao.insert(dto);
        assertTrue(result ==1);
    }

    @Test
    public void read(){
        String id = "aaa";
        UserDTO dto = dao.read(id);
        System.out.println("dto = " + dto);
        assertTrue(dto.getId().equals("aaa"));
    }

    @Test
    public void update(){
        UserDTO dto = new UserDTO("bbb","22222","updatetest","hellomodify");
        int result = dao.update(dto);
        assertTrue(result==1);
    }

    @Test
    public void delete(){
      String id = "aaa";
      int result = dao.delete(id);
      assertTrue(result==1);
    }
}