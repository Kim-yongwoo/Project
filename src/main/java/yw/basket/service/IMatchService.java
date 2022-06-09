package yw.basket.service;

import yw.basket.dto.BoardDTO;
import yw.basket.dto.MatchDTO;
import yw.basket.dto.UserDTO;

import java.util.List;

public interface IMatchService {


    //매치 저장
    int matchRegSave(MatchDTO matchDTO) throws Exception;

    //매치 불러오기
    List<MatchDTO> matchDTOList(MatchDTO matchDTO) throws Exception;

}
