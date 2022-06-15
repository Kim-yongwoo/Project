package yw.basket.service;

import yw.basket.dto.MatchDTO;
import yw.basket.dto.RequestDTO;

import java.util.List;

public interface IRequestService {

    //매치 참여
    int matchReq(RequestDTO requestDTO) throws Exception;

    int matchReqSave(RequestDTO requestDTO) throws Exception;

    //매치 참여 (메인)
    int matchReqMain(RequestDTO requestDTO) throws Exception;

    // 매칭 참여 취소
    int matchReqCncSave(RequestDTO requestDTO) throws Exception;

}
