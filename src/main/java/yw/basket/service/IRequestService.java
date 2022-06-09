package yw.basket.service;

import yw.basket.dto.MatchDTO;
import yw.basket.dto.RequestDTO;

import java.util.List;

public interface IRequestService {

    //매치 참여
    int matchReq(RequestDTO requestDTO) throws Exception;

}
