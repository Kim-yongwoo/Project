package yw.basket.mapper;

import org.apache.ibatis.annotations.Mapper;
import yw.basket.dto.MatchDTO;
import yw.basket.dto.RequestDTO;

@Mapper
public interface IRequestMapper {

    //매치 참여
    int matchReq(RequestDTO requestDTO) throws Exception;

    int matchReqSave(RequestDTO requestDTO) throws Exception;

    //매치 참여 메인
    int matchReqMain(RequestDTO requestDTO) throws Exception;

    // 매칭 참여 취소
    int matchReqCncSave(RequestDTO requestDTO) throws Exception;


}
