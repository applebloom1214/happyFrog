package com.happy.happyfrog.DAO;

import com.happy.happyfrog.DTO.BoardDTO;
import com.happy.happyfrog.DTO.SearchDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDAOTest {
    @Autowired
    private BoardDAO boardDAO;

    @Test
    public void count() {
        System.out.println(boardDAO.count());
    }

    @Test
    public void deleteAll(){
        int result = boardDAO.deleteAll();
        assertTrue(result==1);
        assertTrue(boardDAO.count()==0);
    }

    @Test
    public void insert(){
        BoardDTO boardDTO = new BoardDTO("writer","title");
        System.out.println("boardDTO = " + boardDTO);
        int result = boardDAO.insert(boardDTO);
        System.out.println("result = " + result);
    }

    @Test
    public void insertTest(){
        BoardDTO boardDTO;
        for (int i = 1; i <= 260; i++) {
            boardDTO = new BoardDTO("writer"+i,"title"+i);
            boardDAO.insert(boardDTO);
        }

        assertTrue(boardDAO.count()==260);
    }


    @Test
    public void selectOne(){
        int bno = 3;
        BoardDTO boardDTO = boardDAO.selectOne(bno);
        System.out.println("boardDTO = " + boardDTO);
        assertTrue(boardDTO.getBno()==3);
    }

    @Test
    public void select10(){
        List<BoardDTO> list = boardDAO.select10();

        assertTrue(list.size()==10);
    }

    @Test
    public void update(){
        BoardDTO boardDTO = new BoardDTO("writer","upuptitle");
        boardDTO.setBno(3);

        int result = boardDAO.update(boardDTO);

        assertTrue(result==1);
    }

    @Test
    public void selectPage(){
            int page = 1;
            Integer offset =  (page-1) * 10;
            List<BoardDTO> list = boardDAO.selectPage(offset);

        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }

    }
    @Test
    public void searchCnt(){
        SearchDTO searchDTO = new SearchDTO(1);
        int cnt = boardDAO.searchCnt(searchDTO);
        assertTrue(cnt ==260);
    }

    @Test
    public void searchList(){
        SearchDTO searchDTO = new SearchDTO(1);
        System.out.println("searchDTO = " + searchDTO);
        System.out.println("searchDTO.getOffset() = " + searchDTO.getOffset());
        List<BoardDTO> list = boardDAO.searchList(searchDTO);
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
    }


}