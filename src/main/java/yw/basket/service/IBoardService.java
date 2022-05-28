package yw.basket.service;

import yw.basket.dto.BoardDTO;

import java.util.List;

public interface IBoardService {

    List<BoardDTO> selectBoardList() throws Exception;

    // 게시글을 등록하는 기능에 대한 서비스
    void insertBoard(BoardDTO board) throws Exception;
}
