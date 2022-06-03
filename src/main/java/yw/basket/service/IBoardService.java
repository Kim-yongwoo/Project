package yw.basket.service;

import yw.basket.dto.BoardDTO;

import java.util.List;

public interface IBoardService {

    List<BoardDTO> selectBoardList() throws Exception;

    // 게시글을 등록하는 기능에 대한 서비스
    void insertBoard(BoardDTO boardDTO) throws Exception;

    //게시글 상세
    BoardDTO selectBoardDetail(BoardDTO boardDTO) throws Exception;

    //게시글 수정
    void boardUpdate(BoardDTO boardDTO) throws Exception;

    //게시글 삭제
    void boardDelete(BoardDTO boardDTO) throws Exception;

    /**
     * 게시물 리스트 조회
     * @param boardDTO
     * @return
     * @throws Exception
     */


    //public List<BoardDTO> selectBoardList(BoardDTO boardDTO) throws Exception;

    /**
     * 게시물 작성
     * @param boardDTO
     * @throws Exception
     */
    //public void insertBoard(BoardDTO boardDTO) throws Exception;


    /**
     * 게시물 수정
     * @param boardDTO
     * @throws Exception
     */
    //public void updateBoard(BoardDTO boardDTO) throws Exception;

    /**
     * 게시물 삭제
     * @param boardDTO
     * @throws Exception
     */
    //public void deleteBoard(BoardDTO boardDTO) throws Exception;

    /**
     * 게시글 조회
     * @param boardDTO
     * @return
     * @throws Exception
     */
    //public BoardDTO selectBoardByCode(BoardDTO boardDTO) throws Exception;
}




