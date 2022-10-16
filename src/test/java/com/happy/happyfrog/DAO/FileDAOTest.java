package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.FileDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class FileDAOTest {
    @Autowired
    private FileDAO dao;

    @Test
    public void insert() {
        UUID uuid = UUID.randomUUID();
        String path = "C:\\filedown";
        FileDTO dto = new FileDTO(uuid.toString(),path,"test3.jpg",2);
        int result = dao.insert(dto);
        assertTrue(result ==1);
    }

    @Test
    public void read() {
        FileDTO dto = dao.read(0);
        System.out.println("dto = " + dto);
        assertTrue(dto.getBno()==0);
    }

    @Test
    public void update() {
        FileDTO dto = new FileDTO();
        UUID uuid = UUID.randomUUID();
        dto.setUuid(uuid.toString());
        dto.setFileName("update.jpg");

        int result = dao.update(dto);
        assertTrue(result==1);
    }

    @Test
    public void deleteAll() {
        dao.deleteAll();

    }

    @Test
    public void delete() {
        dao.delete(1);
    }
}