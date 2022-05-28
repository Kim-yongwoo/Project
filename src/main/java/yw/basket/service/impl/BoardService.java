package yw.basket.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yw.basket.dto.BoardDTO;
import yw.basket.mapper.IBoardMapper;
import yw.basket.service.IBoardService;

import java.util.List;

@Service
public class BoardService implements IBoardService {

    private final IBoardMapper boardMapper;

    @Autowired
    public BoardService(IBoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    } // 매퍼클래스를 위에 private final 변수에 넣어준다(위에껀 null과 같은상태인데 이 값을 넣어줌으로써 mapper사용)

    @Override
    public List<BoardDTO> selectBoardList() throws Exception {

        return boardMapper.selectBoardList();
    }

    @Override
    public void insertBoard(BoardDTO board) throws Exception {
        boardMapper.insertBoard(board);
    }
}
