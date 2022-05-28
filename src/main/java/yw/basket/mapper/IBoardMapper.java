package yw.basket.mapper;


import org.apache.ibatis.annotations.Mapper;
import yw.basket.dto.BoardDTO;

import java.util.List;

@Mapper
public interface IBoardMapper {

    // 여기서 지정한 메서드의 이름은 쿼리의 이름과 동일해야 함 (selectBoardList)
    List<BoardDTO> selectBoardList() throws Exception;

    //게시판 쓰기
    void insertBoard(BoardDTO board) throws Exception;
}
