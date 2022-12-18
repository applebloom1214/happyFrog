package com.happy.happyfrog.Service;

import com.happy.happyfrog.DAO.BoardDAO;
import com.happy.happyfrog.DAO.ReplyDAO;
import com.happy.happyfrog.DTO.ReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    private ReplyDAO dao;
    @Autowired
    private BoardDAO boardDAO;

    @Override
    public List<ReplyDTO> read(int bno){
        return dao.read(bno);
    }

    @Override
    public ReplyDTO replyCheck(ReplyDTO dto){
        return dao.replyCheck(dto);
    }

    @Override
    public int insert(ReplyDTO dto){
        return dao.insert(dto);
    }

    @Override
    public int updateRating(ReplyDTO dto){
        return boardDAO.updateRating(dto);
    }

    @Override
    public ReplyDTO readCno(int cno){
        return dao.readCno(cno);
    }

    @Override
    public int delete(int cno){
        return dao.delete(cno);
    }

    @Override
    public int deleteRating(ReplyDTO dto){
        return boardDAO.deleteRating(dto);
    }

    @Override
    public int update(ReplyDTO dto){
        return dao.update(dto);
    }
}
