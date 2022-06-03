package yw.basket.mapper;


import org.apache.ibatis.annotations.Mapper;
import yw.basket.dto.MatchDTO;

@Mapper
public interface IMatchMapper {

    //매치 생성
    int matchRegSave(MatchDTO matchDTO) throws Exception;
}
