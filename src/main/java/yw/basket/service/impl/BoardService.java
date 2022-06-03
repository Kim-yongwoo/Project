package yw.basket.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yw.basket.dto.BoardDTO;
import yw.basket.mapper.IBoardMapper;
import yw.basket.service.IBoardService;

import java.util.List;

@Service("BoardService")
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
    public void insertBoard(BoardDTO boardDTO) throws Exception {
        boardMapper.insertBoard(boardDTO);
    }

    // 게시글 상세
    @Override
    public BoardDTO selectBoardDetail(BoardDTO boardDTO) throws Exception {
        return boardMapper.selectBoardDetail(boardDTO);

    }

    @Override
    public void boardUpdate(BoardDTO boardDTO) throws Exception {
        boardMapper.boardUpdate(boardDTO);

    }

    @Override
    public void boardDelete(BoardDTO boardDTO) throws Exception {
        boardMapper.boardDelete(boardDTO);
    }

}



    /*public List<BoardDTO> selectBoardList(BoardDTO boardDTO) throws Exception {
        return boardMapper.selectBoardList(boardDTO);
    }

    @Override
    public void insertBoard(BoardDTO boardDTO) throws Exception {
        boardMapper.insertBoard(boardDTO);
    }

    @Override
    public void updateBoard(BoardDTO boardDTO) throws Exception {
        boardMapper.updateBoard(boardDTO);
    }

    @Override
    public void deleteBoard(BoardDTO boardDTO) throws Exception {
        boardMapper.deleteBoard(boardDTO);
    }

    @Override
    public BoardDTO selectBoardByCode(BoardDTO boardDTO) throws Exception {

        BoardDTO resultDTO = boardMapper.selectBoardByCode(boardDTO);

        return resultDTO;
    }*/



