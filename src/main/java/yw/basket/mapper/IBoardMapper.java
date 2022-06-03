package yw.basket.mapper;


import org.apache.ibatis.annotations.Mapper;
import yw.basket.dto.BoardDTO;

import java.util.List;

@Mapper
public interface IBoardMapper {


    // 여기서 지정한 메서드의 이름은 쿼리의 이름과 동일해야 함 (selectBoardList)
    List<BoardDTO> selectBoardList() throws Exception;

    //게시판 쓰기
    void insertBoard(BoardDTO boardDTO) throws Exception;

    //게시글 조회
    BoardDTO selectBoardDetail(BoardDTO boardDTO) throws Exception;

    //게시글 수정
    void boardUpdate(BoardDTO boardDTO) throws Exception;

    //게시글 삭제
    void boardDelete(BoardDTO boardDTO) throws Exception;

}


    /**
     * 게시물 리스트 조회
     * @param boardDTO
     * @return
     * @throws Exception
     *//*
    List<BoardDTO> selectBoardList(BoardDTO boardDTO) throws Exception;

    *//**
     * 게시물 등록
     * @param boardDTO
     * @throws
     *//*
    void insertBoard(BoardDTO boardDTO) throws Exception;

    *//**
     * 게시물 수정
     * @param boardDTO
     * @throws Exception
     *//*
    void updateBoard(BoardDTO boardDTO) throws Exception;

    *//**
     * 게시물 삭제
     * @param boardDTO
     * @throws Exception
     *//*
    void deleteBoard(BoardDTO boardDTO) throws Exception;

    *//**
     * 게시물 조회
     * @param boardDTO
     * @return
     * @throws Exception
     *//*
    BoardDTO selectBoardByCode(BoardDTO boardDTO) throws Exception;*/









