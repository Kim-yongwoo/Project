package yw.basket.mapper;

import org.apache.ibatis.annotations.Mapper;
import yw.basket.dto.MatchDTO;
import yw.basket.dto.RequestDTO;

@Mapper
public interface IRequestMapper {

    //매치 참여
    int matchReq(RequestDTO requestDTO) throws Exception;
}
