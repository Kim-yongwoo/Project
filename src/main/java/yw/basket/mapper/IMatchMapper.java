package yw.basket.mapper;


import org.apache.ibatis.annotations.Mapper;
import yw.basket.dto.BoardDTO;
import yw.basket.dto.MatchDTO;
import yw.basket.dto.RequestDTO;

import java.util.List;

@Mapper
public interface IMatchMapper {

    //매치 생성
    int matchRegSave(MatchDTO matchDTO) throws Exception;

    //매치 조회
    List<MatchDTO> matchDTOList(MatchDTO matchDTO) throws Exception;

    //매치 상세
    MatchDTO matchDetail(MatchDTO matchDTO) throws Exception;

    int matchReqSave(MatchDTO matchDTO) throws Exception;

    //신청 리스트
    List<MatchDTO> reqList(MatchDTO matchDTO) throws Exception;
}
