package yw.basket.mapper;


import org.apache.ibatis.annotations.Mapper;
import yw.basket.dto.BoardDTO;
import yw.basket.dto.MatchDTO;

import java.util.List;

@Mapper
public interface IMatchMapper {

    //매치 생성
    int matchRegSave(MatchDTO matchDTO) throws Exception;

    //매치 조회
    List<MatchDTO> matchDTOList(MatchDTO matchDTO) throws Exception;


}
