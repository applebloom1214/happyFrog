package com.happy.happyfrog.Service;

import com.happy.happyfrog.DAO.BoardDAO;
import com.happy.happyfrog.DAO.FileDAO;
import com.happy.happyfrog.DAO.ReplyDAO;
import com.happy.happyfrog.DAO.UserDAO;
import com.happy.happyfrog.DTO.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    private BoardDAO boardDAO;
    @Autowired
    private ReplyDAO dao;
    @Autowired
    private FileDAO fdao;
    @Autowired
    private UserDAO uDao;

    @Override
    public BoardDTO getRandomList(){
        return boardDAO.searchListRandom();
    }

    @Override
    public BoardDTO getOneList(Integer bno){
        return boardDAO.selectOne(bno);
    }

    @Override
    public List<ReplyDTO> getReplyList(Integer bno){
        return dao.read(bno);
    }

    @Override
    public int updateHits(Integer bno){
        return boardDAO.updateHits(bno);
    }

    @Override
    public UserDTO getUser(String id){
        return uDao.read(id);
    }

    @Override
    public ReplyDTO CheckReply(ReplyDTO dto){
        return dao.replyCheck(dto);
    }

    @Override
    public int searchCnt(SearchDTO sd){
        return boardDAO.searchCnt(sd);
    }

    @Override
    public List<BoardDTO> searchList(SearchDTO sd){
        return boardDAO.searchList(sd);
    }

    @Override
    public List<BoardDTO> searchListRead(SearchDTO sd){
        return boardDAO.searchListRead(sd);
    }

    @Override
    public List<BoardDTO> searchListRating(SearchDTO sd){
        return boardDAO.searchListRating(sd);
    }

    @Override
    public FileDTO readFile(int bno){
        return fdao.read(bno);
    }

    @Override
    public int update(BoardDTO boardDTO){
        return boardDAO.update(boardDTO);
    }

    @Override
    public int delete(Integer bno){
        return boardDAO.delete(bno);
    }
}
